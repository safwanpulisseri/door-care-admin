import 'package:doorcareadmin/feature/users/bloc/bloc/fetch_user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../report/bloc/bloc/fetch_all_completed_service_bloc.dart';
import '../../../services/bloc/fetch_all_added_services/fetch_all_added_services_bloc.dart';
import '../../../workers/bloc/fetch_all_workers_bloc.dart';
import '../widget/recent_transactions_widget.dart';
import '../widget/sales_report_widget.dart';
import '../widget/service_booking_widget.dart';
import '../widget/summary_cards_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          // Wide screen layout
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const SizedBox(height: 16),
                      // const SalesReport(),
                      SizedBox(height: 16),
                      ServiceBookingsChart(),
                      SizedBox(height: 16),
                      RecentTransactions(),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      BlocBuilder<FetchUserBloc, FetchUserState>(
                        builder: (context, state) {
                          if (state is FetchLoadingState) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state is FetchSuccessState) {
                            final totalTransactionCount =
                                state.fetchUserModel.length;
                            return SummaryCard(
                              'Total Customers',
                              totalTransactionCount.toString(),
                            );
                          } else if (state is FetchFailState) {
                            return const Center(
                                child: Text('Failed to fetch Total Customers'));
                          } else {
                            return const Center(
                                child: Text('No Total Customers available'));
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<FetchAllWorkersBloc, FetchAllWorkersState>(
                        builder: (context, state) {
                          if (state is FetchAllWorkersLoadingState) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state is FetchAllWorkersSuccessState) {
                            final totalTransactionCount =
                                state.fetchAllWorkersModel.length;
                            return SummaryCard(
                              'Total Workers',
                              totalTransactionCount.toString(),
                            );
                          } else if (state is FetchAllWorkersFailState) {
                            return const Center(
                                child: Text('Failed to fetch Total Workers'));
                          } else {
                            return const Center(
                                child: Text('No Total Workers available'));
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<FetchAllCompletedServiceBloc,
                          FetchAllCompletedServiceState>(
                        builder: (context, state) {
                          if (state is FetchAllCompletedServiceLoadingState) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state
                              is FetchAllCompletedServiceSuccessState) {
                            final totalTransactionCount =
                                state.fetchAllCompletedServiceModel.length;
                            return SummaryCard(
                              'Total Orders',
                              totalTransactionCount.toString(),
                            );
                          } else if (state
                              is FetchAllCompletedServiceFailState) {
                            return const Center(
                                child: Text('Failed to fetch Total Orders'));
                          } else {
                            return const Center(
                                child: Text('No Total Orders available'));
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<FetchAllAddedServicesBloc,
                          FetchAllAddedServicesState>(
                        builder: (context, state) {
                          if (state is FetchAllAddedServicesLoadingState) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state
                              is FetchAllAddedServicesSuccessState) {
                            final totalTransactionCount =
                                state.fetchAllServiceModel.length;
                            return SummaryCard(
                              'Total Services',
                              totalTransactionCount.toString(),
                            );
                          } else if (state is FetchAllAddedServicesFailState) {
                            return const Center(
                                child: Text('Failed to fetch Total Services'));
                          } else {
                            return const Center(
                                child: Text('No Total Services available'));
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          // Narrow screen layout (stacked)
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const SalesReport(),
                const SizedBox(height: 16),
                const ServiceBookingsChart(),
                const SizedBox(height: 16),
                const RecentTransactions(),
                const SizedBox(height: 16),
                BlocBuilder<FetchUserBloc, FetchUserState>(
                  builder: (context, state) {
                    if (state is FetchLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is FetchSuccessState) {
                      final totalTransactionCount = state.fetchUserModel.length;
                      return SummaryCard(
                        'Total Customers',
                        totalTransactionCount.toString(),
                      );
                    } else if (state is FetchFailState) {
                      return const Center(
                          child: Text('Failed to fetch Total Customers'));
                    } else {
                      return const Center(
                          child: Text('No Total Customers available'));
                    }
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<FetchAllWorkersBloc, FetchAllWorkersState>(
                  builder: (context, state) {
                    if (state is FetchAllWorkersLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is FetchAllWorkersSuccessState) {
                      final totalTransactionCount =
                          state.fetchAllWorkersModel.length;
                      return SummaryCard(
                        'Total Workers',
                        totalTransactionCount.toString(),
                      );
                    } else if (state is FetchAllWorkersFailState) {
                      return const Center(
                          child: Text('Failed to fetch Total Workers'));
                    } else {
                      return const Center(
                          child: Text('No Total Workers available'));
                    }
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<FetchAllCompletedServiceBloc,
                    FetchAllCompletedServiceState>(
                  builder: (context, state) {
                    if (state is FetchAllCompletedServiceLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is FetchAllCompletedServiceSuccessState) {
                      final totalTransactionCount =
                          state.fetchAllCompletedServiceModel.length;
                      return SummaryCard(
                        'Total Orders',
                        totalTransactionCount.toString(),
                      );
                    } else if (state is FetchAllCompletedServiceFailState) {
                      return const Center(
                          child: Text('Failed to fetch Total Orders'));
                    } else {
                      return const Center(
                          child: Text('No Total Orders available'));
                    }
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<FetchAllAddedServicesBloc,
                    FetchAllAddedServicesState>(
                  builder: (context, state) {
                    if (state is FetchAllAddedServicesLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is FetchAllAddedServicesSuccessState) {
                      final totalTransactionCount =
                          state.fetchAllServiceModel.length;
                      return SummaryCard(
                        'Total Services',
                        totalTransactionCount.toString(),
                      );
                    } else if (state is FetchAllAddedServicesFailState) {
                      return const Center(
                          child: Text('Failed to fetch Total Services'));
                    } else {
                      return const Center(
                          child: Text('No Total Services available'));
                    }
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
