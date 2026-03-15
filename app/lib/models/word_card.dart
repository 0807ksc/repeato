class WordCard {
  const WordCard({
    required this.id,
    required this.word,
    required this.meaningKo,
    required this.exampleEn,
    required this.exampleKo,
    required this.level,
    required this.category,
    required this.deckId,
    required this.deckName,
  });

  final int id;
  final String word;
  final String meaningKo;
  final String exampleEn;
  final String exampleKo;
  final String level;
  final String category;
  final String deckId;
  final String deckName;

  factory WordCard.fromJson(Map<String, dynamic> json) {
    final level = json['level'] as String;
    final defaultDeckId = switch (level) {
      'm2_beginner' => 'm2_beginner_english',
      'cheonjamun_basic' => 'cheonjamun_basic',
      _ => json['category'] as String? ?? 'custom',
    };
    final defaultDeckName = switch (level) {
      'm2_beginner' => '중2 초급 영어',
      'cheonjamun_basic' => '천자문 입문',
      _ => json['category'] as String? ?? '직접 추가',
    };

    return WordCard(
      id: json['id'] as int,
      word: json['word'] as String,
      meaningKo: json['meaning_ko'] as String,
      exampleEn: json['example_en'] as String,
      exampleKo: json['example_ko'] as String,
      level: level,
      category: json['category'] as String,
      deckId: json['deck_id'] as String? ?? defaultDeckId,
      deckName: json['deck_name'] as String? ?? defaultDeckName,
    );
  }
}
