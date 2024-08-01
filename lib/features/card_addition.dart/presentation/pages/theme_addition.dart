import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:savings_fund_planner/core/theme/theme.dart';
import 'package:savings_fund_planner/core/widgets/planner_card_widget.dart';
import 'package:savings_fund_planner/features/card_addition.dart/presentation/store/card_data.dart';
import 'package:savings_fund_planner/features/card_addition.dart/presentation/widgets/appbar_for_card_addition.dart';
import 'package:savings_fund_planner/features/card_addition.dart/presentation/widgets/choose_color_row.dart';
import 'package:savings_fund_planner/features/card_addition.dart/presentation/widgets/next_button.dart';
import 'package:savings_fund_planner/features/card_addition.dart/presentation/widgets/progress_panel.dart';

class ThemeAddition extends StatelessWidget {
  const ThemeAddition({super.key, required this.cardStore});
  final CardData cardStore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarForCardAddition(
          appBarText: 'New card',
          height: 40,
          route: '/cardAdditionSavings',
          cardStore: cardStore,
        ),
        backgroundColor: theme.colorScheme.primary,
        body: Container(
          margin: const EdgeInsets.only(top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProgressPanel(
                    goalColor: theme.colorScheme.secondary,
                    savingsColor: theme.colorScheme.secondary,
                    themeColor: theme.colorScheme.secondary,
                    imageColor: theme.colorScheme.tertiary,
                  ),
                  PlannerCardWidget(cardStore: cardStore),
                  Text(
                    'Choose the color for your card',
                    style: theme.textTheme.labelLarge,
                  ),
                  ChooseColorRow(
                    cardStore: cardStore,
                  )
                ],
              )),
              NextButton(press: () {
                cardStore.add();
                context.go(
                  '/',
                );
              })
            ],
          ),
        ));
  }
}
