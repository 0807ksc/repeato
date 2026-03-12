class WordCard {
  const WordCard({
    required this.id,
    required this.word,
    required this.meaningKo,
    required this.exampleEn,
    required this.exampleKo,
    required this.level,
    required this.category,
  });

  final int id;
  final String word;
  final String meaningKo;
  final String exampleEn;
  final String exampleKo;
  final String level;
  final String category;

  factory WordCard.fromJson(Map<String, dynamic> json) {
    return WordCard(
      id: json['id'] as int,
      word: json['word'] as String,
      meaningKo: json['meaning_ko'] as String,
      exampleEn: json['example_en'] as String,
      exampleKo: json['example_ko'] as String,
      level: json['level'] as String,
      category: json['category'] as String,
    );
  }
}
