import 'dart:io';

import 'package:farmerlocalmobile/di/injection.dart';
import 'package:farmerlocalmobile/features/domain/entities/breeders.dart';
import 'package:farmerlocalmobile/features/presentation/bloc/breeders/breeders_bloc.dart';
import 'package:farmerlocalmobile/features/presentation/bloc/image/image_bloc.dart';
import 'package:farmerlocalmobile/features/presentation/widgets/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBreederWidget extends StatefulWidget {
  const AddBreederWidget({
    Key? key,
    this.breeders,
  }) : super(key: key);

  final Breeders? breeders;
  @override
  _AddBreederWidgetState createState() => _AddBreederWidgetState();
}

class _AddBreederWidgetState extends State<AddBreederWidget> {
  late final _breedersBloc = getIt<BreedersBloc>();
  late final _imageBloc = getIt<ImageBloc>();
  late final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  bool _isMale = true;

  double _weight = 0.0;

  File? _imageFile;
  File? _editedImageFile;
  @override
  void initState() {
    super.initState();
    _weight = widget.breeders?.weight ?? 0.0;
    _isMale = widget.breeders?.gender ?? true;
    _nameController = TextEditingController(text: widget.breeders?.name);
    _ageController =
        TextEditingController(text: widget.breeders?.age.toString());
    if (widget.breeders?.image != null) {
      _imageFile = File(widget.breeders!.image!);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _breedersBloc.close();
    _imageBloc.close();
    _nameController.dispose();
    _ageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (create) => _breedersBloc),
        BlocProvider(create: (create) => _imageBloc),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener(
            listener: (context, ImageState state) {
              if (state is ImageSuccess) {
                _imageFile = File(state.image);
                setState(() {
                  _editedImageFile = File(state.image);
                });
              }
            },
            bloc: _imageBloc,
          ),
          BlocListener(
            listener: (context, BreedersState state) {
              if (state is BreedersLoading) {
                ScaffoldMessenger.maybeOf(context)
                  ?..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.blue,
                      behavior: SnackBarBehavior.fixed,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      )),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Loading...",
                          ),
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          )
                        ],
                      ),
                    ),
                  );
              }
              if (state is BreedersSuccess) {
                WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
                  Navigator.pop(context);
                });
                ScaffoldMessenger.maybeOf(context)
                  ?..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 1),
                      backgroundColor: Colors.green,
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
                            "SUCCESS",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          widget.breeders != null
                              ? Text("Edited Successfully")
                              : Text("Added Successfully")
                        ],
                      ),
                    ),
                  );
              }
              if (state is BreedersError) {
                ScaffoldMessenger.maybeOf(context)
                  ?..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
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
                          Text(state.message)
                        ],
                      ),
                    ),
                  );
              }
            },
            bloc: _breedersBloc,
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.breeders != null ? "EDIT" : "ADD",
              style: TextStyle(color: Colors.white),
            ),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder(
                  builder: (context, ImageState state) => InkWell(
                    onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (BuildContext bc) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: new Wrap(
                              children: <Widget>[
                                new ListTile(
                                  leading:
                                      new Icon(Icons.photo_library_outlined),
                                  title: new Text('Photo Library'),
                                  onTap: () =>
                                      Navigator.of(context).pop("Gallery"),
                                ),
                                new ListTile(
                                  leading:
                                      new Icon(Icons.photo_camera_outlined),
                                  title: new Text('Camera'),
                                  onTap: () =>
                                      Navigator.of(context).pop("Camera"),
                                ),
                              ],
                            ),
                          );
                        }).then((value) {
                      if (value != null) {
                        _imageBloc.add(PickImageEvent(location: value));
                      }
                    }).catchError((e, s) {
                      print("PICK IMAGE ERROR: $e,$s");
                    }),
                    child: CircleAvatar(
                      backgroundColor: Colors.lightGreen,
                      radius: 50,
                      backgroundImage:
                          _imageFile != null ? FileImage(_imageFile!) : null,
                      child: _imageFile != null
                          ? Opacity(opacity: 0)
                          : Container(
                              child: Icon(
                                Icons.camera,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  bloc: _imageBloc,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 50,
                        right: 50,
                      ),
                      child: TextFormField(
                        controller: _nameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) return "field required";
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "Breeder",
                          hintText: "Name of the breeder",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 50,
                        right: 50,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Weight (kg)"),
                          SizedBox(height: 5),
                          Slider(
                            value: _weight,
                            min: 0.0,
                            max: 8.0,
                            activeColor: Colors.green,
                            inactiveColor: Colors.lightGreen,
                            label: _weight.toStringAsFixed(1),
                            onChanged: (value) {
                              setState(() {
                                _weight = value;
                              });
                            },
                          ),
                          Text(_weight.toStringAsFixed(1))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        left: 50,
                        right: 50,
                      ),
                      child: CustomSwitch(
                        value: _isMale,
                        onChanged: (value) {
                          setState(() {
                            _isMale = value;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 50,
                        right: 50,
                      ),
                      child: TextFormField(
                        controller: _ageController,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: false),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2)
                        ],
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) return "field required";
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "Age (Months)",
                          hintText: "Age of the breeder",
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 50,
                        right: 50,
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          if (_weight == 0.0 ||
                              _imageFile == null ||
                              _nameController.text.isEmpty ||
                              _ageController.text.isEmpty) {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                          if (widget.breeders != null) {
                            _breedersBloc.add(
                              UpdateBreederEvent(
                                id: widget.breeders!.id,
                                image: _editedImageFile,
                                breeders: widget.breeders!.copyWith(
                                  name: _nameController.text.trim(),
                                  weight: _weight,
                                  gender: _isMale,
                                  age: int.parse(_ageController.text.trim()),
                                ),
                              ),
                            );
                            return;
                          }
                          _breedersBloc.add(AddBreedersEvent(
                            name: _nameController.text.trim(),
                            weight: _weight,
                            gender: _isMale,
                            age: int.parse(_ageController.text.trim()),
                            image: _imageFile!,
                          ));
                        },
                        color: Colors.green,
                        child: Text(
                          "SUBMIT",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
