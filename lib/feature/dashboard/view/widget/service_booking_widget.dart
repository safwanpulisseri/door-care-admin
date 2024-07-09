import 'package:door_care_admin/core/theme/color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ServiceBookingsChart extends StatelessWidget {
  const ServiceBookingsChart({super.key});

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
          const Row(
            children: [
              Text(
                'Service Bookings',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            //color: Colors.blue.shade50,
            child: SfCircularChart(
              legend: const Legend(
                isVisible: true,
                overflowMode: LegendItemOverflowMode.wrap,
              ),
              series: <CircularSeries>[
                PieSeries<ServiceData, String>(
                  dataSource: getServiceData(),
                  xValueMapper: (ServiceData data, _) => data.service,
                  yValueMapper: (ServiceData data, _) => data.percentage,
                  dataLabelMapper: (ServiceData data, _) =>
                      '${data.percentage}%',
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<ServiceData> getServiceData() {
    return [
      ServiceData('Air Conditioner', 32),
      ServiceData('Home Cleaning', 24),
      ServiceData('Electrical', 16),
      ServiceData('Plumbing', 18),
      ServiceData('Carpentry', 10),
    ];
  }
}

class ServiceData {
  ServiceData(this.service, this.percentage);

  final String service;
  final double percentage;
}
