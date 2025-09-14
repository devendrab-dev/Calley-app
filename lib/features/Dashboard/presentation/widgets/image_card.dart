import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Color.fromRGBO(30, 51, 101, 1),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(8),
            child: Text(
              "LOAD NUMBER TO CALL",
              style: TextTheme.of(
                context,
              ).titleMedium!.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Visit https://app.getcalley.com to upload numbers that you wish to call using Calley Mobile App.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Image.asset("assets/images/image 108.png")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
