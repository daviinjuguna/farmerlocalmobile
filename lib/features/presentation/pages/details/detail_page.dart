import 'package:farmerlocalmobile/di/injection.dart';
import 'package:farmerlocalmobile/features/domain/entities/breeders.dart';
import 'package:farmerlocalmobile/features/presentation/bloc/breeding/breeding_bloc.dart';
import 'package:farmerlocalmobile/features/presentation/bloc/feeding/feeding_bloc.dart';
import 'package:farmerlocalmobile/features/presentation/bloc/watch_blocs/watch_breeding.dart';
import 'package:farmerlocalmobile/features/presentation/bloc/watch_blocs/watch_feeding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'components/add_breeding_object.dart';
import 'components/add_breeding_widget.dart';
import 'components/add_feeding_dialog.dart';
import 'components/add_feeding_object.dart';
import 'widgets/breeding_widget.dart';
import 'widgets/feeding_widget.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key, required this.breeders}) : super(key: key);
  final Breeders breeders;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late final _feedingBloc = getIt<FeedingBloc>();
  late final _breedingBloc = getIt<BreedingBloc>();
  late final _watchFeeding = getIt<WatchFeedingBloc>();
  late final _watchBreeding = getIt<WatchBreedingBloc>();

  @override
  void initState() {
    super.initState();
    _watchFeeding.streamFeeding(widget.breeders.id);
    _watchBreeding.watchBreeding(widget.breeders.id);
  }

  @override
  void dispose() {
    super.dispose();
    _feedingBloc.close();
    _watchFeeding.close();
    _breedingBloc.close();
    _watchBreeding.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (create) => _feedingBloc),
        BlocProvider(create: (create) => _breedingBloc),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<BreedingBloc, BreedingState>(
            listener: (c, state) {
              if (state is BreedingLoading) {
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
              if (state is BreedingSuccess) {
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
                          Text("Request success")
                        ],
                      ),
                    ),
                  );
              }
              if (state is BreedingError) {
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
                          Text(state.error)
                        ],
                      ),
                    ),
                  );
              }
            },
          ),
          BlocListener<FeedingBloc, FeedingState>(
            listener: (c, state) {
              if (state is FeedingLoading) {
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
              if (state is FeedingSuccess) {
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
                          Text("Request success")
                        ],
                      ),
                    ),
                  );
              }
              if (state is FeedingError) {
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
                          Text(state.error)
                        ],
                      ),
                    ),
                  );
              }
            },
          ),
        ],
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              title: Text(
                "${widget.breeders.name}",
                style: TextStyle(color: Colors.white),
              ),
              bottom: TabBar(
                labelColor: Colors.white,
                tabs: [
                  Tab(
                    text: "Feeding",
                  ),
                  Tab(
                    text: "Breeding",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  child: StreamBuilder<FeedingResponse>(
                    stream: _watchFeeding.subJect.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.error != null &&
                            snapshot.data!.error!.length > 0) {
                          return Text("Error Msee");
                        }
                        return FeedingWidget(
                          feeding: snapshot.data!.feeding,
                          addFeeding: () => showDialog<AddFeedingObject?>(
                            context: context,
                            builder: (builder) => AddFeedingDialog(),
                          ).then((value) {
                            if (value != null) {
                              _feedingBloc.add(InsertFeedingEvent(
                                breederId: widget.breeders.id,
                                dryMatter: value.dryMatter,
                                greenMatter: value.greenMatter,
                                water: value.water,
                              ));
                            }
                          }).catchError((e, s) {
                            print("ADD FEEDING ERROR: $e,$s");
                          }),
                          delete: (feeding) => showDialog<bool?>(
                            context: context,
                            builder: (builder) => AlertDialog(
                              title: Text("DELETE"),
                              content: Text("Are you sure you want to delete?"),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(null),
                                  child: Text(
                                    "CANCEL",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 1.4,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: Text(
                                    "DELETE",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 1.4,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ).then((value) {
                            if (value != null && value) {
                              _feedingBloc
                                  .add(DeleteFeedingEvent(id: feeding.id));
                            } else {
                              print("NTAKUFINYA");
                            }
                          }).catchError((e, s) {
                            print("ERROR DELETE: $e,$s");
                          }),
                          edit: (feeding) => showDialog<AddFeedingObject?>(
                                  context: context,
                                  builder: (builder) =>
                                      AddFeedingDialog(feeding: feeding))
                              .then((value) {
                            if (value != null) {
                              _feedingBloc.add(UpdateFeedingEvent(
                                  id: feeding.id,
                                  feeding: feeding.copyWith(
                                    dryMatter: value.dryMatter,
                                    water: value.water,
                                    greenMatter: value.greenMatter,
                                  )));
                            } else {
                              print("NTAKUFINYA");
                            }
                          }).catchError((e, s) {
                            print("ERROR EDIT: $e,$s");
                          }),
                        );
                      } else if (snapshot.hasError) {
                        return Text("Error Msee");
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),

                //!BREEDING
                Provider<WatchBreedingBloc>(
                  create: (_) => _watchBreeding,
                  child: Container(
                    child: StreamBuilder<BreedingResponse>(
                        stream: _watchBreeding.subJect.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.error != null &&
                                snapshot.data!.error!.length > 0) {
                              return Text("Error Msee");
                            }
                            return BreedingWidget(
                              breeding: snapshot.data!.breeding,
                              addBreeding: () => showDialog<AddBreedingObject?>(
                                context: context,
                                builder: (builder) => AddBreedingWidget(
                                  gender: widget.breeders.gender,
                                ),
                              ).then((value) {
                                if (value != null) {
                                  _breedingBloc.add(AddBreedingEvent(
                                    kits: value.kits,
                                    breeder: widget.breeders.id,
                                    mate: value.mateId,
                                  ));
                                  return;
                                }
                                print("HAKUNA LA");
                              }).catchError((e, s) {
                                print("ERROR ADD BREED: $e,$s");
                              }),
                              deleteBreeding: (breeding) => showDialog<bool?>(
                                context: context,
                                builder: (builder) => AlertDialog(
                                  title: Text("DELETE"),
                                  content:
                                      Text("Are you sure you want to delete?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(null),
                                      child: Text(
                                        "CANCEL",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: 1.4,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      child: Text(
                                        "DELETE",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: 1.4,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ).then((value) {
                                if (value != null && value) {
                                  _breedingBloc.add(
                                      DeleteBreedingEvent(id: breeding.id));
                                } else {
                                  print("NTAKUFINYA");
                                }
                              }).catchError((e, s) {
                                print("ERROR DELETE: $e,$s");
                              }),
                            );
                          } else if (snapshot.hasError) {
                            return Text("Error Msee");
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
