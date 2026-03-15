import 'package:flutter/material.dart';

import '../widgets/review_note_card.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({
    super.key,
    required this.onAddCard,
    required this.onNavigateToday,
    required this.todayStudyDeckNames,
  });

  final void Function({
    required String word,
    required String meaningKo,
    required String deck,
    required bool moveToToday,
  }) onAddCard;
  final VoidCallback onNavigateToday;
  final List<String> todayStudyDeckNames;

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _wordController = TextEditingController();
  final _meaningController = TextEditingController();
  final _deckController = TextEditingController(text: '직접 추가');
  String? _lastSavedWord;

  @override
  void dispose() {
    _wordController.dispose();
    _meaningController.dispose();
    _deckController.dispose();
    super.dispose();
  }

  void _save({required bool moveToToday}) {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    final word = _wordController.text.trim();
    final meaningKo = _meaningController.text.trim();
    final deck = _deckController.text.trim();

    widget.onAddCard(
      word: word,
      meaningKo: meaningKo,
      deck: deck,
      moveToToday: moveToToday,
    );

    setState(() {
      _lastSavedWord = word;
      _wordController.clear();
      _meaningController.clear();
    });

    if (moveToToday) {
      widget.onNavigateToday();
    }
  }

  @override
  void didUpdateWidget(covariant AddScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.todayStudyDeckNames.isEmpty) {
      return;
    }

    final currentDeck = _deckController.text.trim();
    if (currentDeck.isEmpty || currentDeck == '직접 추가' || !widget.todayStudyDeckNames.contains(currentDeck)) {
      _deckController.text = widget.todayStudyDeckNames.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.todayStudyDeckNames.isNotEmpty &&
        (_deckController.text.trim().isEmpty ||
            _deckController.text.trim() == '직접 추가' ||
            !widget.todayStudyDeckNames.contains(_deckController.text.trim()))) {
      _deckController.text = widget.todayStudyDeckNames.first;
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Add', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 12),
        const ReviewNoteCard(
          title: '리뷰 설명',
          body: '사용자 그룹에는 "오늘 학습 중인 덱 맥락이 Add에서도 자연스럽게 이어지는지"를 확인해 달라고 안내합니다.',
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('오늘 학습 덱', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(
                  widget.todayStudyDeckNames.isEmpty
                      ? '활성화된 오늘 학습 덱이 없습니다.'
                      : '현재 ${widget.todayStudyDeckNames.length}개 덱이 오늘 학습에 포함돼 있습니다.',
                ),
                if (widget.todayStudyDeckNames.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.todayStudyDeckNames
                        .map(
                          (deckName) => ChoiceChip(
                            label: Text(deckName),
                            selected: _deckController.text.trim() == deckName,
                            onSelected: (_) => setState(() => _deckController.text = deckName),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ],
            ),
          ),
        ),
        if (_lastSavedWord != null) ...[
          const SizedBox(height: 12),
          Card(
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '"$_lastSavedWord" 저장 완료',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '계속 추가하거나 바로 Today로 이동할 수 있습니다.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      OutlinedButton(
                        onPressed: () => setState(() => _lastSavedWord = null),
                        child: const Text('계속 추가'),
                      ),
                      FilledButton(
                        onPressed: widget.onNavigateToday,
                        child: const Text('Today로 이동'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.edit_note, color: Theme.of(context).colorScheme.primary),
                      const SizedBox(width: 8),
                      Text('직접 입력', style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _wordController,
                    decoration: const InputDecoration(
                      labelText: '앞면',
                      hintText: '예: resilient',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value == null || value.trim().isEmpty ? '앞면을 입력해 주세요.' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _meaningController,
                    decoration: const InputDecoration(
                      labelText: '뒷면',
                      hintText: '예: 회복력이 있는',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value == null || value.trim().isEmpty ? '뒷면을 입력해 주세요.' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _deckController,
                    decoration: const InputDecoration(
                      labelText: '덱',
                      hintText: '예: 여행 영어',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value == null || value.trim().isEmpty ? '덱 이름을 입력해 주세요.' : null,
                  ),
                  const SizedBox(height: 12),
                  FilledButton.icon(
                    onPressed: () => _save(moveToToday: false),
                    icon: const Icon(Icons.save_outlined),
                    label: const Text('카드 저장'),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '저장 후 다음 행동은 아래 CTA에서 선택합니다.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Card(
          child: ListTile(
            leading: Icon(Icons.upload_file),
            title: Text('가져오기'),
            subtitle: Text('CSV/텍스트 가져오기는 템플릿과 중복 정책 확정 후 구현합니다.'),
          ),
        ),
      ],
    );
  }
}
