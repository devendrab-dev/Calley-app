import 'package:calley/features/Dashboard/presentation/widgets/menu_item.dart';
import 'package:calley/features/authentication/data/models/user_model.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.blue,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white,
                      child: Image.asset("assets/images/profile.png"),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${user.user.username} •  Personal",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          user.user.email,
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              MenuItem(
                src: "assets/Icons/image 55.png",
                title: "Getting Started",
              ),
              MenuItem(src: "assets/Icons/image 56.png", title: "Sync Data"),
              MenuItem(src: "assets/Icons/image 57.png", title: "Gamification"),
              MenuItem(src: "assets/Icons/image 58.png", title: "Send Logs"),
              MenuItem(src: "assets/Icons/image 59.png", title: "Settings"),
              MenuItem(src: "assets/Icons/image 60.png", title: "Help?"),
              MenuItem(
                src: "assets/Icons/image 61.png",
                title: "Cancel Subscription",
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Text(
                  "App Info",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              MenuItem(src: "assets/Icons/image 62.png", title: "About Us"),
              MenuItem(
                src: "assets/Icons/image 63.png",
                title: "Privacy Policy",
              ),
              MenuItem(
                src: "assets/Icons/version.png",
                title: "Version 1.01.52",
              ),
              MenuItem(src: "assets/Icons/share.png", title: "Share App"),
              MenuItem(src: "assets/Icons/image 64.png", title: "Logout"),
            ],
          ),
        ),
      ),
    );
  }
}
