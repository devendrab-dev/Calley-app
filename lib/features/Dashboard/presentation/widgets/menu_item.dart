import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key, required this.src, required this.title});

  final String src;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Image.asset(src),
      ),
      title: Text(title),
      onTap: () {},
    );
  }
}
