part of 'feeding_bloc.dart';

@immutable
abstract class FeedingEvent {}

class InsertFeedingEvent extends FeedingEvent {
  final int breederId;
  final double dryMatter;
  final double greenMatter;
  final bool water;
  InsertFeedingEvent({
    required this.breederId,
    required this.dryMatter,
    required this.greenMatter,
    required this.water,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InsertFeedingEvent &&
        other.breederId == breederId &&
        other.dryMatter == dryMatter &&
        other.greenMatter == greenMatter &&
        other.water == water;
  }

  @override
  int get hashCode {
    return breederId.hashCode ^
        dryMatter.hashCode ^
        greenMatter.hashCode ^
        water.hashCode;
  }

  InsertFeedingEvent copyWith({
    int? breederId,
    double? dryMatter,
    double? greenMatter,
    bool? water,
  }) {
    return InsertFeedingEvent(
      breederId: breederId ?? this.breederId,
      dryMatter: dryMatter ?? this.dryMatter,
      greenMatter: greenMatter ?? this.greenMatter,
      water: water ?? this.water,
    );
  }
}

class DeleteFeeding extends FeedingEvent {
  final int id;
  DeleteFeeding({
    required this.id,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DeleteFeeding && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'DeleteFeeding(id: $id)';
}
