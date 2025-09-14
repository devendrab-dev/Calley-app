import 'package:calley/core/widgets/card.dart';
import 'package:calley/features/settings/data/languages.dart';
import 'package:calley/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Choose Your Language",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 10),
            Expanded(
              child: MyCard(
                child: ListView.builder(
                  itemCount: Language.all.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(Language.all[index].name),
                      subtitle: Text(Language.all[index].subtitle),
                      trailing: RadioGroup(
                        groupValue: "English",
                        onChanged: (value) {},
                        child: Radio(value: Language.all[index].name),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(8),
              child: AppButton(
                title: "Select",
                onPressed: () {
                  context.go("/signup");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
