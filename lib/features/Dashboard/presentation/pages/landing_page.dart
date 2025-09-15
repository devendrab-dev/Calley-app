import 'package:calley/core/widgets/app_button.dart';
import 'package:calley/features/Dashboard/presentation/widgets/app_bar.dart';
import 'package:calley/features/Dashboard/presentation/widgets/profile_card.dart';
import 'package:calley/features/Dashboard/presentation/widgets/side_menu.dart';
import 'package:calley/features/Dashboard/presentation/widgets/video_card.dart';
import 'package:calley/features/authentication/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:calley/features/authentication/presentation/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginSuccess) {
          return Scaffold(
            drawer: SideMenu(user: state.user),
            appBar: appBar,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ProfileCard(name: state.user.user.username),
                          SizedBox(height: 20),
                          VideoCard(),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset("assets/images/whatsapp.png"),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: AppButton(
                          title: "Start Calling Now",
                          onPressed: () => context.go("/dashboard"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        return LoginPage();
      },
    );
  }
}
