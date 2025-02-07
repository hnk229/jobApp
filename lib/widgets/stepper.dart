
import 'package:flutter/material.dart';

class CustomStepper extends StatefulWidget {
  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Your Profile'),
      ),
      body: Column(
        children: [
          // Custom horizontal stepper with titles below numbers
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildStepIndicator(0, 'Step 1 title'),
              _buildStepLine(),
              _buildStepIndicator(1, 'Step 2 title'),
              _buildStepLine(),
              _buildStepIndicator(2, 'Step 3 title'),
            ],
          ),
          Expanded(
            child: _buildStepContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(int step, String title) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _currentStep = step;
            });
          },
          child: CircleAvatar(
            radius: 20,
            backgroundColor: _currentStep == step ? Colors.blue : Colors.grey,
            child: Text(
              (step + 1).toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            color: _currentStep == step ? Colors.blue : Colors.grey,
            fontWeight: _currentStep == step ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildStepLine() {
    return Expanded(
      child: Container(
        height: 2,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return Center(child: Text('Content for Step 1'));
      case 1:
        return Center(child: Text('Content for Step 2'));
      case 2:
        return Center(child: Text('Content for Step 3'));
      default:
        return Container();
    }
  }
}