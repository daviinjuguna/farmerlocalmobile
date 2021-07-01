import 'package:farmerlocalmobile/di/injection.dart';
import 'package:farmerlocalmobile/features/domain/entities/breeders.dart';
import 'package:farmerlocalmobile/features/presentation/bloc/gender/gender_bloc.dart';
import 'package:farmerlocalmobile/features/presentation/pages/details/components/add_breeding_object.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBreedingWidget extends StatefulWidget {
  const AddBreedingWidget({
    Key? key,
    required this.gender,
  }) : super(key: key);

  final bool gender;

  @override
  _AddBreedingWidgetState createState() => _AddBreedingWidgetState();
}

class _AddBreedingWidgetState extends State<AddBreedingWidget> {
  late final _genderBloc = getIt<GenderBloc>();
  late final _kitsController = TextEditingController();

  List<Breeders> _breeders = const [];
  Breeders? _singleBreeder;

  @override
  void initState() {
    super.initState();
    _genderBloc.add(GetOppGenderEvent(widget.gender));
  }

  @override
  void dispose() {
    _genderBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (create) => _genderBloc),
      ],
      child: AlertDialog(
        title: Text("ADD BREEDING"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder(
              builder: (c, GenderState state) {
                if (state is GenderSuccess) {
                  _breeders = state.breeders;
                  return _breeders.isEmpty
                      ? Container(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              widget.gender
                                  ? Text(
                                      "No Doe Found",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  : Text(
                                      "No Bucks Found",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            ],
                          ),
                        )
                      : DropdownButton<Breeders>(
                          value: _singleBreeder,
                          hint: Text("Select Mate"),
                          onChanged: (breeder) {
                            setState(() {
                              _singleBreeder = breeder;
                            });
                          },
                          items: _breeders
                              .map((breeder) => DropdownMenuItem<Breeders>(
                                    child: Text("${breeder.name}"),
                                    value: breeder,
                                  ))
                              .toList(),
                        );
                }
                if (state is GenderLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is GenderError) {
                  return Text("Error Fetching");
                }
                return Container();
              },
              bloc: _genderBloc,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 50,
                right: 50,
              ),
              child: TextFormField(
                controller: _kitsController,
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) return "field required";
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: "Kits (Number)",
                  hintText: "Enter no of kits",
                ),
              ),
            ),
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
              if (_kitsController.text.isEmpty || _singleBreeder == null) {
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
              Navigator.of(context).pop(AddBreedingObject(
                kits: int.parse(_kitsController.text.trim()),
                mateId: _singleBreeder!.id,
              ));
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
      ),
    );
  }
}
