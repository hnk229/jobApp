import 'package:black_network/theme/theme.dart';
import 'package:flutter/material.dart';

class EducationItem extends StatelessWidget {
  final String icon;
  final String degree;
  final String school;
  final Color? color;
  final String duration;

  const EducationItem({
    super.key, 
    required this.icon,
    required this.degree,
    required this.school,
    required this.duration, this.color,
  });

  @override
  Widget build(BuildContext context) {
        var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: color ?? Colors.redAccent ,
          child: Text(icon, style: TextStyle(color: Colors.white)),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width:screenWidth *0.4,
                    child: Text(
                      degree,
                      style: TextStyle(fontSize: screenWidth * 0.038, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: lightColorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit, color: lightColorScheme.primary),
                    ),
                  ),
                  // const Spacer(),
                  SizedBox(width: screenWidth * 0.01,),

                  Container(
                    decoration: BoxDecoration(
                      color: lightColorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete, color: lightColorScheme.primary),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.002),
                decoration: BoxDecoration(
                  color: color?.withOpacity(0.1) ?? Colors.redAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  duration,
                  style: TextStyle(color: color ?? Colors.redAccent),
                ),
              ),
              Text(
                school,
                style: TextStyle(
                  fontSize: screenWidth * 0.032, 
                  color: color ?? Colors.redAccent),
              ),
              SizedBox(height: 8),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                'Proin a ipsum tellus. Interdum et malesuada fames ac ante '
                'ipsum primis in faucibus.',
                style: TextStyle(fontSize: screenWidth * 0.036, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
