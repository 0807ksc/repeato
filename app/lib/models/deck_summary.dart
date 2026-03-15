class DeckSummary {
  const DeckSummary({
    required this.id,
    required this.name,
    required this.totalCards,
    required this.customCards,
  });

  final String id;
  final String name;
  final int totalCards;
  final int customCards;
}
