import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/assets.gen.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';

class AppCalendarWidget extends StatefulWidget {
  final Function(String date) onTap;

  const AppCalendarWidget({super.key, required this.onTap});

  @override
  State<AppCalendarWidget> createState() => _AppCalendarWidgetState();
}

class _AppCalendarWidgetState extends State<AppCalendarWidget> {
  int dayIndex = DateTime.now().day - 1;

  DateTime time = DateTime.now();
  DateTime selectedDate = DateTime.now();

  int currentMonth = DateTime.now().month;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
      scrollToDate(DateTime.now().day);
    });
  }

  void scrollToDate(int date) {
    date -= 1;
    if (date != -1) {
      scrollController.animateTo(
        date * 50.0,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        16.gapSpace(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${DateFormat('MMMM').format(
                DateTime(
                  time.year,
                  time.month,
                ),
              )} ${DateTime(
                time.year,
                time.month,
              ).year}",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: FontFamily.avenirNextDemi,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  highlightColor: lightGreyColor,
                  onPressed: () {
                    setState(() {
                      time = DateTime(time.year, time.month - 1, 1);
                      currentMonth = time.month;
                      if (selectedDate.month == currentMonth) {
                        scrollToDate(selectedDate.day);
                      } else {
                        scrollToDate(1);
                      }
                    });
                  },
                  icon: Assets.icons.icPrevious.svg(fit: BoxFit.scaleDown),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      time = DateTime(
                          time.year,
                          time.month == DateTime.now().month
                              ? time.month
                              : time.month + 1,
                          1);
                      currentMonth = time.month;
                      if (time.month == currentMonth) {
                        time =
                            DateTime(time.year, time.month, DateTime.now().day);
                      }
                      if (selectedDate.month == currentMonth) {
                        scrollToDate(selectedDate.day);
                      } else {
                        scrollToDate(1);
                      }
                    });
                  },
                  highlightColor: lightGreyColor,
                  icon: Assets.icons.icNextMonth.svg(
                    height: 20,
                    width: 12,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
              ],
            ),
          ],
        ).paddingOnly(left: 20, right: 8),
        16.gapSpace(),
        SizedBox(
          height: 65,
          child: ListView.separated(
            controller: scrollController,
            itemCount: DateTime(time.year, time.month + 1, 0).day,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) =>
                10.gapSpace(),
            itemBuilder: (BuildContext context, int index) {
              return Material(
                borderRadius: BorderRadius.circular(12),
                color: (dayIndex == index && selectedDate.month == currentMonth)
                    ? buttonColor
                    : Colors.transparent,
                child: InkWell(
                  splashColor: secondaryThreeColor,
                  borderRadius: BorderRadius.circular(12),
                  onTap: DateTime.now().month == currentMonth
                      ? (index + 1) > DateTime.now().day
                          ? null
                          : () {
                              setState(() {
                                selectedDate = DateTime(
                                  time.year,
                                  time.month,
                                  index + 1,
                                );
                                String date = DateFormat('yyyy-MM-dd')
                                    .format(selectedDate);
                                widget.onTap(date);
                                dayIndex = index;
                                currentMonth = time.month;
                              });
                            }
                      : () {
                          setState(() {
                            selectedDate = DateTime(
                              time.year,
                              time.month,
                              index + 1,
                            );
                            String date =
                                DateFormat('yyyy-MM-dd').format(selectedDate);
                            widget.onTap(date);
                            dayIndex = index;
                            currentMonth = time.month;
                          });
                        },
                  child: Container(
                    height: 62,
                    width: 46,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${index + 1}",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: FontFamily.avenirNextMedium,
                            color: DateTime.now().month == time.month
                                ? (index + 1) > DateTime.now().day
                                    ? Colors.white.withOpacity(0.4)
                                    : Colors.white
                                : Colors.white,
                          ),
                        ),
                        Text(
                          DateFormat('EEE').format(
                            DateTime(
                              time.year,
                              time.month,
                              index + 1,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 12,
                            color: DateTime.now().month == time.month
                                ? (index + 1) > DateTime.now().day
                                    ? Colors.white.withOpacity(0.4)
                                    : Colors.white
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
