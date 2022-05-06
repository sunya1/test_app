import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/screens/home/cubit/acitivity_cubit.dart';
import 'package:test_app/screens/home/cubit/activity_state.dart';
import 'package:test_app/screens/home/ui/tariffs_screen.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  @override
  void initState() {
    context.read<ActivitiesCubit>().getAllActivities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text(
            "Активности",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body:
            BlocBuilder<ActivitiesCubit, ActivitiesState>(builder: (_, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ActivitiesLoadedState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: ListView.separated(
                  itemBuilder: (_, index) => Stack(children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            final _cubit = context.read<ActivitiesCubit>();
                            _cubit.setTraffics(index);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlocProvider.value(
                                      value: _cubit,
                                      child:  TariffsScreen(imageUrl: state.activities[index].imageUrl,))),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl: state.activities[index].imageUrl,
                                progressIndicatorBuilder: (context, s, p) =>
                                    const Center(
                                        child: CircularProgressIndicator()),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0, left: 14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.activities[index].nameRu,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                state.activities[index].nameRu,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ]),
                  separatorBuilder: (_, index) => const SizedBox(height: 16),
                  itemCount: state.activities.length),
            );
          }
          return const SizedBox(
            child: Text("something went wrong"),
          );
        }));
  }
}
