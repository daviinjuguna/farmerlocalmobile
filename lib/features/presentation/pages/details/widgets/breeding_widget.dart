import 'package:farmerlocalmobile/features/domain/entities/breeders.dart';
import 'package:farmerlocalmobile/features/domain/entities/breeding.dart';
import 'package:flutter/material.dart';

class BreedingWidget extends StatefulWidget {
  const BreedingWidget({Key? key, required this.breeding}) : super(key: key);
  final List<Breeding> breeding;

  @override
  _BreedingWidgetState createState() => _BreedingWidgetState();
}

class _BreedingWidgetState extends State<BreedingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
