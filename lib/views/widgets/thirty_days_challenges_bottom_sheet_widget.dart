import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leveled_up_life/core/constants/app_colors.dart';
import 'package:leveled_up_life/core/utils/extensions.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';
import 'package:leveled_up_life/generated/locale_keys.g.dart';
import 'package:leveled_up_life/views/screens/main/thirty_days_challenges_screen/bloc/thirty_days_challenges_cubit.dart';
import 'package:leveled_up_life/views/widgets/app_button.dart';
import 'package:leveled_up_life/views/widgets/common_bottom_sheet_top_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ThirtyDaysChallengesBottomSheetWidget extends StatelessWidget {
  const ThirtyDaysChallengesBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TooltipBehavior behavior = TooltipBehavior(enable: true);
    return BlocBuilder<ThirtyDaysChallengesCubit, ThirtyDaysChallengesState>(
      builder: (BuildContext context, ThirtyDaysChallengesState state) {
        return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            CommonBottomSheetTopWidget(
              title: LocaleKeys.summary_chart.tr(),
              onTap: () {
                context.pop();
              },
            ),
            20.gapSpace(),
            BlocBuilder<ThirtyDaysChallengesCubit, ThirtyDaysChallengesState>(
              builder: (BuildContext context, ThirtyDaysChallengesState state) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            onTap: () {
                              context
                                  .read<ThirtyDaysChallengesCubit>()
                                  .getSummaryChart(chartSelectedIndex: 0);
                            },
                            buttonBorderRadius: 8,
                            appButtonColor: state.chartSelectedIndex == 0
                                ? buttonColor
                                : Colors.transparent,
                            borderSide: state.chartSelectedIndex == 0
                                ? BorderSide.none
                                : const BorderSide(
                                    color: coolThreeColor,
                                    width: 1,
                                  ),
                            child: Text(
                              LocaleKeys.one_day.tr(),
                              style: TextStyle(
                                fontSize: 16,
                                color: state.chartSelectedIndex == 0
                                    ? Colors.white
                                    : coolFourColor,
                                fontFamily: FontFamily.avenirNextMedium,
                              ),
                            ),
                          ),
                        ),
                        4.gapSpace(),
                        Expanded(
                          child: AppButton(
                            onTap: () {
                              context
                                  .read<ThirtyDaysChallengesCubit>()
                                  .getSummaryChart(chartSelectedIndex: 1);
                            },
                            buttonBorderRadius: 8,
                            appButtonColor: state.chartSelectedIndex == 1
                                ? buttonColor
                                : Colors.transparent,
                            borderSide: state.chartSelectedIndex == 1
                                ? BorderSide.none
                                : const BorderSide(
                                    color: coolThreeColor,
                                    width: 1,
                                  ),
                            child: Text(
                              LocaleKeys.week.tr(),
                              style: TextStyle(
                                fontSize: 16,
                                color: state.chartSelectedIndex == 1
                                    ? Colors.white
                                    : coolFourColor,
                                fontFamily: FontFamily.avenirNextMedium,
                              ),
                            ),
                          ),
                        ),
                        4.gapSpace(),
                        Expanded(
                          child: AppButton(
                            onTap: () {
                              context
                                  .read<ThirtyDaysChallengesCubit>()
                                  .getSummaryChart(chartSelectedIndex: 2);
                            },
                            buttonBorderRadius: 8,
                            appButtonColor: state.chartSelectedIndex == 2
                                ? buttonColor
                                : Colors.transparent,
                            borderSide: state.chartSelectedIndex == 2
                                ? BorderSide.none
                                : const BorderSide(
                                    color: coolThreeColor,
                                    width: 1,
                                  ),
                            child: Text(
                              LocaleKeys.month.tr(),
                              style: TextStyle(
                                fontSize: 16,
                                color: state.chartSelectedIndex == 2
                                    ? Colors.white
                                    : coolFourColor,
                                fontFamily: FontFamily.avenirNextMedium,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    28.gapSpace(),
                    FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Row(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CircleAvatar(
                                radius: 10,
                                backgroundColor: chartCompleteColor,
                              ),
                              10.gapSpace(),
                              Text(
                                LocaleKeys.complete.tr(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: primaryColor,
                                  fontFamily: FontFamily.avenirNextMedium,
                                ),
                              ),
                            ],
                          ),
                          16.gapSpace(),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CircleAvatar(
                                radius: 10,
                                backgroundColor: chartRemainingColor,
                              ),
                              10.gapSpace(),
                              Text(
                                LocaleKeys.remaining.tr(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: primaryColor,
                                  fontFamily: FontFamily.avenirNextMedium,
                                ),
                              ),
                            ],
                          ),
                          16.gapSpace(),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CircleAvatar(
                                radius: 10,
                                backgroundColor: chartIncompleteColor,
                              ),
                              10.gapSpace(),
                              Text(
                                LocaleKeys.incomplete.tr(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: primaryColor,
                                  fontFamily: FontFamily.avenirNextMedium,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    40.gapSpace(),
                    SfCartesianChart(
                      primaryXAxis: const CategoryAxis(
                        majorGridLines: MajorGridLines(width: 0),
                        labelStyle: TextStyle(
                          fontSize: 12,
                          color: primaryColor,
                        ),
                      ),
                      primaryYAxis: NumericAxis(
                        minimum: 0,
                        maximum:
                            (state.summaryChartModel?.total ?? 10).toDouble() +
                                2,
                        majorGridLines: const MajorGridLines(width: 0),
                        labelStyle: const TextStyle(
                          fontSize: 12,
                          color: primaryColor,
                        ),
                      ),
                      tooltipBehavior: behavior,
                      series: <ColumnSeries<ChartData, String>>[
                        ColumnSeries<ChartData, String>(
                          dataSource: <ChartData>[
                            ChartData(
                              LocaleKeys.complete.tr(),
                              (state.summaryChartModel?.complete ?? 0),
                              chartCompleteColor,
                            ),
                            ChartData(
                              LocaleKeys.remaining.tr(),
                              (state.summaryChartModel?.remaining ?? 0),
                              chartRemainingColor,
                            ),
                            if (state.chartSelectedIndex != 0)
                              ChartData(
                                LocaleKeys.incomplete.tr(),
                                (state.summaryChartModel?.incomplete ?? 0),
                                chartIncompleteColor,
                              ),
                          ],
                          xValueMapper: (ChartData chartData, int _) =>
                              chartData.challengesStatus,
                          yValueMapper: (ChartData chartData, int _) =>
                              chartData.challengesValue,
                          pointColorMapper: (ChartData chartData, int index) =>
                              chartData.color,
                          width: 0.35,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                          dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                            textStyle: TextStyle(
                              fontSize: 12,
                              color: primaryColor,
                              fontFamily: FontFamily.avenirNextMedium,
                            ),
                          ),
                          enableTooltip: true,
                          animationDuration: 300,
                        )
                      ],
                    ),
                    26.gapSpace(),
                  ],
                );
              },
            ).paddingSymmetric(horizontal: 20),
          ],
        );
      },
    );
  }
}

class ChartData {
  ChartData(this.challengesStatus, this.challengesValue, this.color);

  final String challengesStatus;
  final int challengesValue;
  final Color color;
}
