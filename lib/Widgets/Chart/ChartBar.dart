import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key,required this.fill});

  final double fill;

  @override
  Widget build(BuildContext context) {

    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: FractionallySizedBox(
            heightFactor: fill,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.9),
                    Theme.of(context).colorScheme.primary.withOpacity(0.5)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
                ),
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10)),
                shape: BoxShape.rectangle,
                color:
                isDarkMode ? Theme.of(context).colorScheme.secondary :
                Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.8)
              ),
            ),
          ),
        )
    );
  }
}
