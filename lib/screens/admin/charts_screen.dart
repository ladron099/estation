import 'package:d_chart/d_chart.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:estation/components/appVars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChartScreen extends StatelessWidget {
  ChartScreen({super.key});
  final group1 = [
    DChartScatterData(
      domain: 1,
      measure: 23,
      size: 10,
      startPlot: DPlot(2, 10),
      type: SymbolType.rect,
    ),
    DChartScatterData(
      domain: 2,
      measure: 12,
      type: SymbolType.circle,
    ),
    DChartScatterData(domain: 3, measure: 19),
  ];
  final group2 = [
    DChartScatterData(
      domain: 1,
      measure: 15,
      type: SymbolType.triangle,
    ),
    DChartScatterData(
        domain: 3, measure: 25, type: SymbolType.triangle, size: 15),
    DChartScatterData(domain: 5, measure: 7),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Charts'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              30.verticalSpace,
              SizedBox(
                width: double.infinity,
                height: 300.h,
                child: DChartTime(
                  chartRender: DRenderLine(),
                  measureLabel: (value) => '$value MAD',
                  domainLabel: (dateTime) {
                    // [DateFormat] from intl package
                    return DateFormat('d MMM yy').format(dateTime!);
                  },
                  groupData: [
                    DChartTimeGroup(
                      id: 'Keyboard',
                      color: primaryColor,
                      data: [
                        DChartTimeData(
                            time: DateTime(2023, 2, 1), value: 12234),
                        DChartTimeData(
                            time: DateTime(2023, 2, 2), value: 20000),
                        DChartTimeData(
                            time: DateTime(2023, 2, 4), value: 12344),
                        DChartTimeData(time: DateTime(2023, 2, 8), value: 6666),
                        DChartTimeData(
                            time: DateTime(2023, 2, 9), value: 10000),
                        DChartTimeData(
                            time: DateTime(2023, 2, 10), value: 6666),
                        DChartTimeData(
                            time: DateTime(2023, 2, 12), value: 10000),
                        DChartTimeData(
                            time: DateTime(2023, 2, 18), value: 20000),
                        DChartTimeData(
                            time: DateTime(2023, 2, 20), value: 5643),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
