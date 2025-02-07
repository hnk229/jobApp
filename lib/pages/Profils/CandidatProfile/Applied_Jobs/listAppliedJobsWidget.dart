import 'package:black_network/theme/theme.dart';
import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final String company;
  final String jobTitle;
  final String location;
  final String date;
  final String rating;

  const JobCard({
    super.key,
    required this.company,
    required this.jobTitle,
    required this.location,
    required this.date,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    // var fontTitle = screenWidth * 0.06;
    var fontbody = screenWidth * 0.04;
    var iconSize = screenWidth * 0.04;
    // var spaceHeight = screenHeight * 0.02;
    var spaceWidth = screenWidth * 0.02;
    return Card(
      color: lightColorScheme.onPrimary,
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.02),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/avatar/avataaars.png'), // Add your company logo asset
              radius: 25,
            ),
            SizedBox(width: spaceWidth),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    company,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: lightColorScheme.surface
                      ),
                  ),
                  Text(
                    jobTitle,
                    style: TextStyle(
                        fontSize: fontbody,
                        color: lightColorScheme.surface,
                         fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey, size: iconSize),
                      SizedBox(width: spaceWidth),
                      SizedBox(
                        width: screenWidth * 0.5,
                        child: Text(
                          location,
                          style: const TextStyle(
                            color: Colors.grey
                          ),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_month_rounded,color: Colors.grey, size: iconSize),
                      SizedBox(width: spaceWidth),
                      Text(date,
                      style: const TextStyle(
                            color: Colors.grey
                          ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'View') {
                      // Handle view action
                    } else if (value == 'Delete') {
                      // Handle delete action
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        value: 'View',
                        child: Row(
                          children: [
                            Icon(
                              Icons.visibility,
                              color: lightColorScheme.primary,
                            ),
                            SizedBox(width: spaceWidth),
                            Text(
                              'View',
                              style: TextStyle(color: lightColorScheme.surface),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'Delete',
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: lightColorScheme.primary,
                            ),
                            SizedBox(width: spaceWidth),
                            Text(
                              'Delete',
                              style: TextStyle(color: lightColorScheme.surface),
                            ),
                          ],
                        ),
                      ),
                    ];
                  },
                  icon: Icon(Icons.more_vert),
                ),
                // const Spacer(),
                Text(
                  'Active',
                  style: TextStyle(color: lightColorScheme.onSecondary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
