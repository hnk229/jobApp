import 'package:black_network/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key, 
    required this.appTitle,
    required this.child, 
    });
  final String appTitle;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    // var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    // var fontTitle = screenWidth * 0.06;
    // var fontbody = screenWidth * 0.04;
    // var spaceHeight = screenHeight * 0.018;
    // var spaceWidth = screenWidth * 0.01;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: lightColorScheme.surface,
          size: screenWidth * 0.06,
        ),
        centerTitle: true,
        backgroundColor: lightColorScheme.onPrimary,
        title: Text(
          appTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: lightColorScheme.surface,
          ),
        ),
      ),
      backgroundColor: lightColorScheme.onPrimary,
      body: child,
    );
  }
}
