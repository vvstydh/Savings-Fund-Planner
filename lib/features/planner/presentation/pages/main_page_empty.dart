import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:savings_fund_planner/core/theme/theme.dart';
import 'package:savings_fund_planner/core/widgets/appbar.dart';
import 'package:savings_fund_planner/core/app/store/card_data/card_data.dart';
import 'package:savings_fund_planner/core/widgets/universal_button.dart';

class MainPageEmpty extends StatelessWidget {
  const MainPageEmpty({super.key, required this.cardStore});
  final CardData cardStore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      appBar: const Appbar(
        appBarText: 'Planner',
        height: 40,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 148,
            child: Image.asset(
              'assets/images/list_is_empty.png',
              fit: BoxFit.fill,
            ),
          ),
          Text(
            'You don\'t have any cards yet',
            style: theme.textTheme.bodyMedium,
          ),
          Text(
            'Click the button below to create a new one',
            style: theme.textTheme.labelSmall,
          ),
          UniversalButton(
            text: 'CREATE YOUR FIRST GOAL',
            press: () {
              context.go('/cardAdditionGoal', extra: cardStore);
            },
          )
        ],
      ),
    );
  }
}
