import 'package:doorcareadmin/core/theme/color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../report/bloc/bloc/fetch_all_completed_service_bloc.dart';

class ServiceBookingsChart extends StatelessWidget {
  const ServiceBookingsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAllCompletedServiceBloc,
        FetchAllCompletedServiceState>(
      builder: (context, state) {
        if (state is FetchAllCompletedServiceLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FetchAllCompletedServiceSuccessState) {
          // Group services by service name and count occurrences
          final serviceCounts = <String, int>{};
          final totalServices = state.fetchAllCompletedServiceModel.length;

          for (var serviceModel in state.fetchAllCompletedServiceModel) {
            serviceCounts.update(serviceModel.serviceName, (count) => count + 1,
                ifAbsent: () => 1);
          }

          // Map the service counts to ServiceData with percentage calculation
          final serviceData = serviceCounts.entries
              .map((entry) =>
                  ServiceData(entry.key, (entry.value / totalServices) * 100))
              .toList();

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
                  child: SfCircularChart(
                    legend: const Legend(
                      isVisible: true,
                      overflowMode: LegendItemOverflowMode.wrap,
                    ),
                    series: <CircularSeries>[
                      PieSeries<ServiceData, String>(
                        dataSource: serviceData, // Use the mapped list here
                        xValueMapper: (ServiceData data, _) => data.service,
                        yValueMapper: (ServiceData data, _) => data.percentage,
                        dataLabelMapper: (ServiceData data, _) =>
                            '${data.percentage.toStringAsFixed(1)}%', // Show percentage with 1 decimal
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is FetchAllCompletedServiceFailState) {
          return const Center(child: Text('Failed to fetch Total Orders'));
        } else {
          return const Center(child: Text('No Total Orders available'));
        }
      },
    );
  }
}

class ServiceData {
  ServiceData(this.service, this.percentage);

  final String service;
  final double percentage;
}
