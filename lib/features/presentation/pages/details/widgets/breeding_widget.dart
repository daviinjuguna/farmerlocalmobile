import 'package:farmerlocalmobile/core/utils/constants.dart';
import 'package:farmerlocalmobile/core/utils/parse_date.dart';
import 'package:farmerlocalmobile/features/domain/entities/breeding.dart';
import 'package:flutter/material.dart';

class BreedingWidget extends StatelessWidget {
  const BreedingWidget({
    Key? key,
    required this.breeding,
    required this.addBreeding,
    required this.deleteBreeding,
  }) : super(key: key);
  final List<Breeding> breeding;
  final VoidCallback addBreeding;
  final Function(Breeding breeding) deleteBreeding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                  ),
                  child: DataTable(
                    headingRowColor:
                        MaterialStateProperty.all(Colors.lightGreen),
                    columns: [
                      DataColumn(
                          label: Text("Mated With",
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text("No. of Kits",
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text("Date",
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text("Action",
                              style: TextStyle(color: Colors.white)))
                    ],
                    rows: breeding
                        .map(
                          (e) => DataRow(
                            cells: [
                              DataCell(Text(e.mate.name)),
                              DataCell(Text(e.kit.toString())),
                              DataCell(Text(
                                parseUniqueDate(
                                    e.date.millisecondsSinceEpoch ~/ 1000),
                              )),
                              DataCell(IconButton(
                                onPressed: () {
                                  deleteBreeding(e);
                                },
                                icon: Icon(Icons.delete),
                                color: Colors.red,
                              ))
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              )
            ],
          ),
        ),
        ElevatedButton(
          onPressed: addBreeding,
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith(getColor)),
          child: Text(
            "Add Breeding",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
