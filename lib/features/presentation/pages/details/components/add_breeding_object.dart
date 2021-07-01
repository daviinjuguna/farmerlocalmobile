class AddBreedingObject {
  final int kits;
  final int mateId;
  AddBreedingObject({
    required this.kits,
    required this.mateId,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddBreedingObject &&
        other.kits == kits &&
        other.mateId == mateId;
  }

  @override
  int get hashCode => kits.hashCode ^ mateId.hashCode;

  AddBreedingObject copyWith({
    int? kits,
    int? mateId,
  }) {
    return AddBreedingObject(
      kits: kits ?? this.kits,
      mateId: mateId ?? this.mateId,
    );
  }

  @override
  String toString() => 'AddBreedingObject(kits: $kits, mateId: $mateId)';
}
