import 'package:calley/core/widgets/app_button.dart';
import 'package:calley/core/widgets/scaffold_message.dart';
import 'package:calley/features/Dashboard/presentation/bloc/list_bloc.dart';
import 'package:calley/features/Dashboard/presentation/widgets/app_bar.dart';
import 'package:calley/features/Dashboard/presentation/widgets/side_menu.dart';
import 'package:calley/features/authentication/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:calley/features/authentication/presentation/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tests extends StatelessWidget {
  const Tests({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginSuccess) {
          final String name = state.user.user.username;
          return Scaffold(
            drawer: SideMenu(user: state.user),
            appBar: appBar,
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: BlocConsumer<ListBloc, ListState>(
                listener: (context, state) {
                  if (state is ListFailed) {
                    message(context, state.message, true);
                  }
                },
                builder: (context, state) {
                  if (state is ListLoading) {
                    return Center(child: CircularProgressIndicator.adaptive());
                  }
                  if (state is ListSucess) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Test List",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        "${state.data.calls.length} ",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      Text("CALLS"),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 18,
                                  horizontal: 26,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Text(
                                  name[0].toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 300,
                          child: PieChart(
                            PieChartData(
                              sections: [
                                PieChartSectionData(
                                  color: Colors.orange,
                                  value: 28,
                                  title: '',
                                  radius: 40,
                                ),
                                PieChartSectionData(
                                  color: Colors.blue,
                                  value: 22,
                                  title: '',
                                  radius: 40,
                                ),
                                PieChartSectionData(
                                  color: Colors.purple,
                                  value: 9,
                                  title: '',
                                  radius: 40,
                                ),
                              ],
                              centerSpaceRadius: 50,
                              sectionsSpace: 4,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _StatusCard(
                              title: "Pending",
                              value: state.data.pending.toString(),
                              color: Colors.orange,
                              bgColor: Color(0xffFFF7ED),
                            ),
                            _StatusCard(
                              title: "Done",
                              value: state.data.called.toString(),
                              color: Colors.green,
                              bgColor: Color(0xffECFDF5),
                            ),
                            _StatusCard(
                              title: "Schedule",
                              value: state.data.rescheduled.toString(),
                              color: Colors.purple,
                              bgColor: Color(0xffF5F3FF),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        AppButton(title: "Start Calling Now"),
                      ],
                    );
                  }
                  return Center(child: Text("Something went wrong!"));
                },
              ),
            ),
          );
        }
        return LoginPage();
      },
    );
  }
}

class _StatusCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final Color bgColor;

  const _StatusCard({
    required this.title,
    required this.value,
    required this.color,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 6,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(width: 10),
            Column(
              children: [
                Text(
                  title,
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                  "$value Calls",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
