import 'package:farmerlocalmobile/features/domain/entities/feeding.dart';
import 'package:farmerlocalmobile/features/presentation/widgets/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'add_feeding_object.dart';

class AddFeedingDialog extends StatefulWidget {
  const AddFeedingDialog({Key? key, this.feeding}) : super(key: key);
  final Feeding? feeding;
  @override
  _AddFeedingDialogState createState() => _AddFeedingDialogState();
}

class _AddFeedingDialogState extends State<AddFeedingDialog> {
  TextEditingController _dryMatter = TextEditingController();
  TextEditingController _greenMatter = TextEditingController();
  bool _isWater = false;

  @override
  void initState() {
    super.initState();
    _isWater = widget.feeding?.water ?? false;
    _dryMatter = TextEditingController(
        text: widget.feeding?.dryMatter.toStringAsFixed(1));
    _greenMatter = TextEditingController(
        text: widget.feeding?.greenMatter.toStringAsFixed(1));
  }

  @override
  void dispose() {
    super.dispose();
    _dryMatter.dispose();
    _greenMatter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(widget.feeding != null ? "EDIT FEEDING" : "ADD FEEDING"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _dryMatter,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              LengthLimitingTextInputFormatter(4),
            ],
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              labelText: "Dry Matter (grams)",
              hintText: "Enter dry matter",
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: _greenMatter,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              LengthLimitingTextInputFormatter(4),
            ],
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              labelText: "Green Matter (grams)",
              hintText: "Enter green matter",
            ),
          ),
          SizedBox(
            height: 5,
          ),
          CustomSwitch(
            value: _isWater,
            activeText: "WATER",
            inactiveText: "NO WATER",
            onChanged: (value) {
              setState(() {
                _isWater = value;
              });
            },
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(null),
          child: Text(
            "CANCEL",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              letterSpacing: 1.4,
              color: Colors.red,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            if (_dryMatter.text.isEmpty || _greenMatter.text.isEmpty) {
              ScaffoldMessenger.maybeOf(context)
                ?..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    duration: Duration(milliseconds: 1500),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.fixed,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    )),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "ERROR",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // SizedBox(height: 3),
                        Text("Please fill all values")
                      ],
                    ),
                  ),
                );
              return;
            }
            Navigator.of(context).pop(
              AddFeedingObject(
                dryMatter: double.parse(_dryMatter.text.trim()),
                greenMatter: double.parse(_greenMatter.text.trim()),
                water: _isWater,
              ),
            );
          },
          child: Text(
            "SUBMIT",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              letterSpacing: 1.4,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}
