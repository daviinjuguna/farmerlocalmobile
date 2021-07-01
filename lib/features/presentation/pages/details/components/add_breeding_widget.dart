import 'package:farmerlocalmobile/di/injection.dart';
import 'package:farmerlocalmobile/features/domain/entities/breeders.dart';
import 'package:farmerlocalmobile/features/presentation/bloc/gender/gender_bloc.dart';
import 'package:flutter/material.dart';
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
          ],
        ),
      ),
    );
  }
}
