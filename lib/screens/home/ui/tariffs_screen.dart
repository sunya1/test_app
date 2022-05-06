import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:test_app/components/app_custom_button.dart';
import 'package:test_app/screens/home/ui/widgets/slivers_app_bar.dart';
import 'package:test_app/theme/colors.dart';

import '../cubit/acitivity_cubit.dart';
import '../cubit/activity_state.dart';

class TariffsScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  const TariffsScreen({Key? key, required this.imageUrl, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ActivitiesCubit, ActivitiesState>(builder: (_, state) {
        if (state is TariffState) {
          return CustomScrollView(
            slivers: [
              AppBarWidget(
                imagePath: imageUrl,
                text: title,
                onTap: () {
                  final _cubit = context.read<ActivitiesCubit>();
                  _cubit.setActivities();
                  _cubit.setClear();
                  Navigator.pop(context);
                },
              ),
              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      topRight: Radius.circular(35.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Дата посещения",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Подзаголовок в одну строку",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.35),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 24.0, bottom: 16),
                            child: Divider(
                              thickness: 1,
                              color: AppColors.dividerColor,
                            ),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: state.firstAvailableData,
                                  maxTime: state.lastAvailableDate,
                                  onConfirm: (date) {
                                context
                                    .read<ActivitiesCubit>()
                                    .setChoosedDate(date);
                              }, locale: LocaleType.ru);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 24),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.dividerColor, width: 1),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today,
                                          color: AppColors.loginBgColor,
                                          size: 16,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                            state.choosedDate.isNotEmpty
                                                ? state.choosedDate
                                                : "Выберите Дату",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400))
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColors.loginBgColor,
                                      size: 16,
                                    )
                                  ]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (_, index) => ListTile(
                                      tileColor: AppColors.trafficTileBgColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      title: Text(
                                        state.tariffs[index].nameRu,
                                        style: TextStyle(
                                            color: AppColors.listTileTitleColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      subtitle: Text(
                                          state.tariffs[index].priceInfo.price
                                                  .toInt()
                                                  .toString() +
                                              " T",
                                          style: TextStyle(
                                              color: AppColors
                                                  .listTileSubTitleColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400)),
                                      trailing: InkWell(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12)),
                                        onTap: () {
                                          print("added");
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColors.loginBgColor,
                                                  width: 1),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              color: AppColors.loginBgColor,
                                              size: 16,
                                            )),
                                      ),
                                    ),
                                separatorBuilder: (_, index) =>
                                    const SizedBox(height: 8),
                                itemCount: state.tariffs.length),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: AppCustomElevatedButton(
                                  onPressed: () {
                                    print("ffdsfsd");
                                  },
                                  fontSize: 16,
                                  text: "Оплатить",
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                    stops: const [0.0, 0.5, 1.0],
                                    colors: [
                                      AppColors.loginBgSecondColor,
                                      AppColors.loginBgSecondColor,
                                      AppColors.loginBgColor,
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Column(mainAxisSize: MainAxisSize.min, children: [
                            Divider(
                              thickness: 1,
                              color: AppColors.dividerColor,
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (_, index) => Divider(
                                thickness: 1,
                                color: AppColors.dividerColor,
                              ),
                              itemBuilder: (_, index) => ListTile(
                                title: Text(
                                    index == 0
                                        ? "Правила поведения в сноупарке"
                                        : "Позвонить",
                                    style: TextStyle(
                                        color: index == 0
                                            ? Colors.black
                                            : AppColors.loginBgColor,
                                        fontSize: 16,
                                        fontWeight: index == 0
                                            ? FontWeight.w400
                                            : FontWeight.w700)),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.loginBgColor,
                                  size: 16,
                                ),
                              ),
                              itemCount: 2,
                            )
                          ]),
                        ]),
                  ),
                ),
              )
            ],
          );
        }
        return const SizedBox();
      }),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //     Divider(
      //       thickness: 1,
      //       color: AppColors.dividerColor,
      //     ),
      //     ListView.separated(
      //       shrinkWrap: true,
      //       separatorBuilder: (_, index) => Divider(
      //         thickness: 1,
      //         color: AppColors.dividerColor,
      //       ),
      //       itemBuilder: (_, index) => ListTile(
      //         title: Text(
      //             index == 0 ? "Правила поведения в сноупарке" : "Позвонить",
      //             style: TextStyle(
      //                 color: index == 0 ? Colors.black : AppColors.loginBgColor,
      //                 fontSize: 16,
      //                 fontWeight:
      //                     index == 0 ? FontWeight.w400 : FontWeight.w700)),
      //         trailing: Icon(
      //           Icons.arrow_forward_ios,
      //           color: AppColors.loginBgColor,
      //           size: 16,
      //         ),
      //       ),
      //       itemCount: 2,
      //     )
      //   ]),
      // ),
    );
  }
}
