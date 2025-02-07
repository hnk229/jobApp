import 'package:black_network/pages/Profils/CandidatProfile/Applied_Jobs/listAppliedJobsWidget.dart';
import 'package:black_network/theme/theme.dart';
import 'package:black_network/widgets/CustomScafold.dart';
import 'package:black_network/widgets/Dropdown.dart';
import 'package:black_network/widgets/container.dart';
import 'package:flutter/material.dart';

class Appliedjobs extends StatefulWidget {
  const Appliedjobs({super.key});

  @override
  State<Appliedjobs> createState() => _AppliedjobsState();
}

class _AppliedjobsState extends State<Appliedjobs> {
  String? _selectedItems;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    var fontTitle = screenWidth * 0.06;
    // var fontbody = screenWidth * 0.04;
    var spaceHeight = screenHeight * 0.018;
    // var spaceWidth = screenWidth * 0.01;
    return CustomScaffold(
        appTitle: "Applied Jobs",
        child: CustomContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Applied Jobs",
                style: TextStyle(
                  color: lightColorScheme.surface,
                  fontSize: fontTitle,
                ),
              ),
              SizedBox(
                height: spaceHeight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: screenWidth * 0.48,
                    child: CustomDropdownButton2(
                      // aKey: _currentSalary,
                      hint: "Filtre",
                      value: _selectedItems,
                      dropdownItems: const [
                        'Last 6 Months',
                        'Last 12 Months',
                        'Last 16 Months',
                        'Last 24 Months',
                        'Last 5 Years'
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedItems = value;
                          // _currentSalaryController.text = value ?? '';
                        });
                      },
                      buttonWidth: screenWidth,
                      buttonHeight: screenHeight * 0.062,
                      dropdownWidth: screenWidth * 0.8,
                      // validator: validateDropdown,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: screenHeight * 0.68,
                    child: ListView.builder(
                      itemCount: 5, // Example: 5 saved jobs
                      itemBuilder: (context, index) {
                        return const JobCard(
                          company: 'Total ltd',
                          jobTitle: 'Office Assistance',
                          location: 'Miaplaza, New York, USA',
                          date: 'Dec 5, 2009',
                          rating: '4.6',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
