import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/add_history_entry.dart';
import 'models/session_stats.dart';
import 'models/deck_summary.dart';
import 'models/word_card.dart';
import 'screens/add_screen.dart';
import 'screens/decks_screen.dart';
import 'screens/insights_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/today_screen.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  int _currentIndex = 0;
  SessionStats _stats = SessionStats.empty;
  final List<WordCard> _cards = [];
  final List<AddHistoryEntry> _recentAddHistory = [];
  final Set<String> _todayStudyDeckIds = {'m2_beginner_english'};
  bool _isLoading = true;
  Object? _loadError;

  @override
  void initState() {
    super.initState();
    _bootstrapCards();
  }

  Future<void> _bootstrapCards() async {
    try {
      final cards = await _loadCards();
      if (!mounted) return;
      setState(() {
        _cards
          ..clear()
          ..addAll(cards);
        _isLoading = false;
        _stats = SessionStats(
          target: 30,
          completed: 0,
          known: 0,
          unsure: 0,
          again: 0,
          done: false,
        );
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _loadError = error;
        _isLoading = false;
      });
    }
  }

  Future<List<WordCard>> _loadCards() async {
    const assetPaths = [
      'assets/data/m2_beginner_words.json',
      'assets/data/cheonjamun_sample.json',
    ];
    final cards = <WordCard>[];

    try {
      for (final assetPath in assetPaths) {
        debugPrint('[Repeato] loadCards: start ($assetPath)');
        final raw = await rootBundle
            .loadString(assetPath)
            .timeout(
              const Duration(seconds: 5),
              onTimeout: () {
                throw TimeoutException('Timed out loading asset: $assetPath');
              },
            );
        debugPrint('[Repeato] loadCards: loaded raw (${raw.length} chars)');

        final List<dynamic> decoded = jsonDecode(raw) as List<dynamic>;
        debugPrint(
          '[Repeato] loadCards: decoded list (${decoded.length} items)',
        );

        cards.addAll(
          decoded.map((e) => WordCard.fromJson(e as Map<String, dynamic>)),
        );
      }
      debugPrint('[Repeato] loadCards: done (${cards.length} cards)');
      return cards;
    } catch (e, st) {
      debugPrint('[Repeato] loadCards: ERROR $e');
      debugPrint('$st');
      rethrow;
    }
  }

  void _addCard({
    required String word,
    required String meaningKo,
    required String deck,
    required bool moveToToday,
  }) {
    final nextId = _cards.isEmpty
        ? 1
        : _cards.map((card) => card.id).reduce((a, b) => a > b ? a : b) + 1;
    final newCard = WordCard(
      id: nextId,
      word: word,
      meaningKo: meaningKo,
      exampleEn: '$word example',
      exampleKo: '$meaningKo 예문',
      level: 'custom',
      category: deck,
      deckId: deck.trim().toLowerCase().replaceAll(' ', '_'),
      deckName: deck,
    );

    setState(() {
      _cards.add(newCard);
      _recentAddHistory.insert(
        0,
        AddHistoryEntry(word: word, meaningKo: meaningKo, deckName: deck),
      );
      if (_recentAddHistory.length > 4) {
        _recentAddHistory.removeRange(4, _recentAddHistory.length);
      }
      if (moveToToday) {
        _currentIndex = 0;
      }
    });
  }

  List<DeckSummary> _buildDecks() {
    final grouped = <String, List<WordCard>>{};
    for (final card in _cards) {
      grouped.putIfAbsent(card.deckId, () => []).add(card);
    }

    final decks =
        grouped.entries
            .map(
              (entry) => DeckSummary(
                id: entry.key,
                name: entry.value.first.deckName,
                totalCards: entry.value.length,
                customCards: entry.value
                    .where((card) => card.level == 'custom')
                    .length,
                isRecommendedToday:
                    entry.key == 'm2_beginner_english' ||
                    entry.key == 'cheonjamun_basic',
              ),
            )
            .toList()
          ..sort((a, b) => a.name.compareTo(b.name));
    return decks;
  }

  void _startDeckStudyNow(String deckId) {
    setState(() {
      _todayStudyDeckIds
        ..clear()
        ..add(deckId);
      _currentIndex = 0;
      _stats = SessionStats.empty;
    });
  }

  void _toggleTodayDeck(String deckId) {
    setState(() {
      if (_todayStudyDeckIds.contains(deckId) &&
          _todayStudyDeckIds.length > 1) {
        _todayStudyDeckIds.remove(deckId);
      } else {
        _todayStudyDeckIds.add(deckId);
      }
      _stats = SessionStats.empty;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(strokeWidth: 4),
              ),
              SizedBox(height: 12),
              Text('Loading…'),
            ],
          ),
        ),
      );
    }

    if (_loadError != null) {
      return Scaffold(body: Center(child: Text('데이터 로드 실패: $_loadError')));
    }

    final decks = _buildDecks();
    if (_todayStudyDeckIds.isEmpty && decks.isNotEmpty) {
      _todayStudyDeckIds.add(decks.first.id);
    }
    final todayDecks = decks
        .where((deck) => _todayStudyDeckIds.contains(deck.id))
        .toList();
    final todayDeckLabel = todayDecks.map((deck) => deck.name).join(' + ');
    final todayDeckNames = todayDecks.map((deck) => deck.name).toList();
    final recentDeckNames = <String>{
      ..._recentAddHistory.map((entry) => entry.deckName),
      ...decks.where((deck) => deck.customCards > 0).map((deck) => deck.name),
    }.toList();
    final todayCards = _cards
        .where((card) => _todayStudyDeckIds.contains(card.deckId))
        .toList();
    final screens = <Widget>[
      TodayScreen(
        key: ValueKey('today-${_todayStudyDeckIds.join('-')}'),
        cards: todayCards,
        deckName: todayDeckLabel,
        onStatsChanged: (s) => setState(() => _stats = s),
      ),
      DecksScreen(
        decks: decks,
        todayStudyDeckIds: _todayStudyDeckIds,
        onToggleTodayDeck: _toggleTodayDeck,
        onStudyDeckNow: _startDeckStudyNow,
      ),
      AddScreen(
        key: const ValueKey('add-screen'),
        onAddCard: _addCard,
        onNavigateToday: () => setState(() => _currentIndex = 0),
        todayStudyDeckNames: todayDeckNames,
        recentDeckNames: recentDeckNames,
        recentEntries: _recentAddHistory,
      ),
      InsightsScreen(
        stats: _stats,
        deckName: todayDeckLabel,
        totalCards: todayCards.length,
        todayStudyDeckNames: todayDeckNames,
        onStartToday: () => setState(() => _currentIndex = 0),
        onOpenDeck: () => setState(() => _currentIndex = 1),
      ),
      ProfileScreen(
        stats: _stats,
        totalCards: todayCards.length,
        onResumeToday: () => setState(() => _currentIndex = 0),
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: screens),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => setState(() => _currentIndex = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Today',
          ),
          NavigationDestination(
            icon: Icon(Icons.collections_bookmark_outlined),
            selectedIcon: Icon(Icons.collections_bookmark),
            label: 'Decks',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_circle_outline),
            selectedIcon: Icon(Icons.add_circle),
            label: 'Add',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: 'Insights',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
