import 'package:farmerlocalmobile/features/domain/entities/feeding.dart';

class FeedingModel extends Feeding {
  @override
  final int id;
  @override
  final double dryMatter;
  @override
  final double greenMatter;
  @override
  final bool water;
  @override
  final DateTime date;

  FeedingModel({
    required this.id,
    required this.dryMatter,
    required this.greenMatter,
    required this.water,
    required this.date,
  }) : super(
          date: date,
          id: id,
          dryMatter: dryMatter,
          water: water,
          greenMatter: greenMatter,
        );

  FeedingModel copyWith({
    int? id,
    double? dryMatter,
    double? greenMatter,
    bool? water,
    DateTime? date,
  }) {
    return FeedingModel(
      id: id ?? this.id,
      dryMatter: dryMatter ?? this.dryMatter,
      greenMatter: greenMatter ?? this.greenMatter,
      water: water ?? this.water,
      date: date ?? this.date,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FeedingModel &&
        other.id == id &&
        other.dryMatter == dryMatter &&
        other.greenMatter == greenMatter &&
        other.water == water &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        dryMatter.hashCode ^
        greenMatter.hashCode ^
        water.hashCode ^
        date.hashCode;
  }

  @override
  String toString() {
    return 'FeedingModel(id: $id, dryMatter: $dryMatter, greenMatter: $greenMatter, water: $water, date: $date)';
  }
}
