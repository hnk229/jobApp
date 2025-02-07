import 'package:black_network/pages/Dashboard/widgetDashborad/cardWidget.dart';
import 'package:black_network/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Darhborad extends StatefulWidget {
  const Darhborad({super.key});

  @override
  State<Darhborad> createState() => _DarhboradState();
}

class _DarhboradState extends State<Darhborad> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Scaffold(
      backgroundColor: lightColorScheme.onPrimary,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenHeight * 0.01,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: cardView(
                      icon: Icon(Icons.card_travel),
                      title: "Applied Jobs",
                      number: "777",
                      color: lightColorScheme.primary,
                      iconBackground: lightColorScheme.secondary,
                    ),
                  ),
                  Expanded(
                    child: cardView(
                      icon: Icon(Icons.card_travel),
                      title: "Applied Jobs",
                      number: "777",
                      color: lightColorScheme.primary,
                      iconBackground: lightColorScheme.secondary,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
