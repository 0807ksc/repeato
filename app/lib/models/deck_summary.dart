class DeckSummary {
  const DeckSummary({
    required this.id,
    required this.name,
    required this.totalCards,
    required this.customCards,
    required this.isRecommendedToday,
  });

  final String id;
  final String name;
  final int totalCards;
  final int customCards;
  final bool isRecommendedToday;
}
