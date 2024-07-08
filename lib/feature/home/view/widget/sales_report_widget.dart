import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/color/app_color.dart';

class SalesReport extends StatelessWidget {
  const SalesReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColor.background,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          width: 1,
          color: AppColor.toneThree.withOpacity(0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.toneThree.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Sales Report',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download),
                label: const Text('Export PDF'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            //color: Colors.blue.shade50,
            child: SfCartesianChart(
              title: const ChartTitle(text: 'Sales Report'),
              legend: const Legend(isVisible: false),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries>[
                LineSeries<SalesData, DateTime>(
                  dataSource: getChartData(),
                  xValueMapper: (SalesData sales, _) => sales.date,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  markerSettings: const MarkerSettings(isVisible: true),
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  enableTooltip: true,
                ),
              ],
              primaryXAxis: DateTimeAxis(
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                intervalType: DateTimeIntervalType.months,
                dateFormat: DateFormat.MMM(),
              ),
              primaryYAxis: const NumericAxis(
                labelFormat: '\${value}',
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<SalesData> getChartData() {
    return [
      SalesData(DateTime(2023, 1), 25000),
      SalesData(DateTime(2023, 2), 35000),
      SalesData(DateTime(2023, 3), 45000),
      SalesData(DateTime(2023, 4), 30000),
      SalesData(DateTime(2023, 5), 40000),
      SalesData(DateTime(2023, 6), 45000),
      SalesData(DateTime(2023, 7), 50000),
      SalesData(DateTime(2023, 8), 55000),
      SalesData(DateTime(2023, 9), 60000),
      SalesData(DateTime(2023, 10), 65000),
      SalesData(DateTime(2023, 11), 70000),
      SalesData(DateTime(2023, 12), 75000),
    ];
  }
}

class SalesData {
  SalesData(this.date, this.sales);

  final DateTime date;
  final double sales;
}
