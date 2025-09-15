import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key,required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.blue,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            child: Image.asset("assets/images/profile.png"),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello $name", style: TextStyle(color: Colors.white)),
              Text(
                "Welcome to Calley!",
                style: TextTheme.of(
                  context,
                ).headlineSmall!.copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
