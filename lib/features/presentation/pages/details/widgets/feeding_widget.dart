import 'package:farmerlocalmobile/core/utils/constants.dart';
import 'package:farmerlocalmobile/core/utils/parse_date.dart';
import 'package:farmerlocalmobile/features/domain/entities/feeding.dart';
import 'package:flutter/material.dart';

class FeedingWidget extends StatelessWidget {
  const FeedingWidget({
    Key? key,
    required this.feeding,
    required this.addFeeding,
    required this.delete,
    required this.edit,
  }) : super(key: key);

  final List<Feeding> feeding;
  final VoidCallback addFeeding;
  final Function(Feeding feeding) delete;
  final Function(Feeding feeding) edit;

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
                          label: Text(
                        "Date",
                        style: TextStyle(color: Colors.white),
                      )),
                      DataColumn(
                          label: Text("Dry Matter (grams)",
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text("Green Matter (grams)",
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text("Water (YES/NO)",
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                        label: Text(
                          "Action",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                    rows: feeding
                        .map(
                          (e) => DataRow(
                            cells: [
                              DataCell(Text(parseUniqueDate(
                                  e.date.millisecondsSinceEpoch ~/ 1000))),
                              DataCell(Text("${e.dryMatter}")),
                              DataCell(Text("${e.greenMatter}")),
                              DataCell(Text(e.water ? "YES" : "NO")),
                              DataCell(Row(
                                children: [
                                  IconButton(
                                    onPressed: () => edit(e),
                                    icon: Icon(Icons.edit),
                                    color: Colors.green,
                                  ),
                                  IconButton(
                                    onPressed: () => delete(e),
                                    color: Colors.red,
                                    icon: Icon(Icons.delete),
                                  ),
                                ],
                              ))
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: addFeeding,
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith(getColor)),
          child: Text(
            "Add Feeding",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
