import 'package:black_network/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cardView extends StatelessWidget{
  final Icon icon;
  final String title, number;
  final Color color, iconBackground;

  const cardView({
    super.key,
    required this.icon,
    required this.title,
    required this.number,
    required this.color,
    required this.iconBackground
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: lightColorScheme.onPrimary,
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 10,
        ),
        child: Column(
          spacing: 5,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: iconBackground,

              ),
              //color: iconBackground,
              child: Icon(
                  icon.icon,
                color: color,
                size: 30,
              ),
            ),
            Text(
                number,
              style: TextStyle(
                color: color,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: lightColorScheme.surface,
              ),
            )
          ],
        ),
      ),
    );
  }
}