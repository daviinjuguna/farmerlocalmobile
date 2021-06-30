class AddFeedingObject {
  final double dryMatter;
  final double greenMatter;
  final bool water;
  AddFeedingObject({
    required this.dryMatter,
    required this.greenMatter,
    required this.water,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddFeedingObject &&
        other.dryMatter == dryMatter &&
        other.greenMatter == greenMatter &&
        other.water == water;
  }

  @override
  int get hashCode =>
      dryMatter.hashCode ^ greenMatter.hashCode ^ water.hashCode;

  @override
  String toString() =>
      'AddFeedingObject(dryMatter: $dryMatter, greenMatter: $greenMatter, water: $water)';
}
