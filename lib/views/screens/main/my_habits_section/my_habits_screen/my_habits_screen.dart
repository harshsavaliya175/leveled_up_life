import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/views/screens/main/my_habits_section/my_habits_screen/bloc/my_habit_cubit.dart';
import 'package:leveled_up_life/views/screens/main/my_habits_section/my_habits_screen/my_habits_data.dart';
import 'package:leveled_up_life/views/widgets/add_new_habit_bottom_sheet_widget.dart';
import 'package:leveled_up_life/views/widgets/common_app_bar.dart';

class MyHabitsScreen extends StatelessWidget {
  MyHabitsScreen({super.key});

  final ScrollController scrollController = ScrollController();

  void scrollControllerListener(BuildContext context) {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          context.read<MyHabitCubit>().loadMoreHabitData();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = context.getScreenSize;
    scrollControllerListener(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CommonAppBar(
          displayLeading: false,
          title: LocaleKeys.my_habits.tr(),
        ),
      ),
      backgroundColor: primaryColor,
      body: BlocConsumer<MyHabitCubit, MyHabitState>(
        listener: (BuildContext context, MyHabitState state) {
          if (state.message.isNotEmpty) {
            context.showAppSnackBar(message: state.message);
          }
          if (state.isForceLogout) {
            context.forceLogout();
          }
        },
        builder: (BuildContext context, MyHabitState state) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  height: size.height,
                  width: size.width,
                  margin: const EdgeInsets.only(top: 16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Column(
                      children: [
                        12.gapSpace(),
                        Center(
                          child: Container(
                            height: 5,
                            width: 70,
                            decoration: BoxDecoration(
                              color: bottomSheetHandleColor,
                              borderRadius: BorderRadius.circular(60),
                            ),
                          ),
                        ),
                        12.gapSpace(),
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              await Future.delayed(const Duration(seconds: 1));
                              context
                                  .read<MyHabitCubit>()
                                  .getHabitsList(isLoading: false);
                            },
                            backgroundColor: primaryColor,
                            color: Colors.white,
                            child: MyHabitsData(
                                scrollController: scrollController),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<MyHabitCubit>()
              .changeData(time: '', isSetReminder: false, habits: '');

          context.showAppBottomSheet(
            contentWidget: DraggableScrollableSheet(
              initialChildSize: 0.65,
              maxChildSize: 1,
              minChildSize: 0.65,
              expand: false,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return AddNewHabitBottomSheetWidget(
                  controller: scrollController,
                );
              },
            ),
          );
        },
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: buttonColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: buttonColor.withOpacity(0.6),
                offset: const Offset(0, 3),
                blurRadius: 30,
                spreadRadius: 5,
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Assets.icons.icAdd.svg(fit: BoxFit.scaleDown),
        ),
      ),
    );
  }
}
