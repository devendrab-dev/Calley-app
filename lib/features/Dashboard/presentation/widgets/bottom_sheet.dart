import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CallingListBottomSheet extends StatelessWidget {
  const CallingListBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color.fromRGBO(30, 51, 101, 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // 👈 shrink to fit content
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              "CALLING LISTS",
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // 👈 keep compact
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(239, 246, 255, 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select Calling List",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.refresh, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              "Refresh",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(239, 246, 255, 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Test List",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      GestureDetector(
                        onTap: () => context.push("/tests"),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset("assets/Icons/image 53.png"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
