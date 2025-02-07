import 'package:black_network/pages/Profils/CandidatProfile/MyResumPage/widget/dashLine.dart';
import 'package:black_network/pages/Profils/CandidatProfile/MyResumPage/widget/widgetEducation.dart';
import 'package:black_network/pages/Profils/CandidatProfile/editProfile/Forms/Validation/FormSecure.dart';
import 'package:black_network/theme/theme.dart';
import 'package:black_network/widgets/Dropdown.dart';
import 'package:black_network/widgets/TextFieldForm.dart';
import 'package:black_network/widgets/button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String? fileName;
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    ); // Limiter aux formats autorisés

    if (result != null) {
      PlatformFile file = result.files.first;

      setState(() {
        fileName = file.name;
      });

      // Tu peux faire quelque chose avec le fichier, comme l'envoyer vers un serveur
      print('Nom du fichier: ${file.name}');
      print('Taille du fichier: ${file.size}');
      print('Chemin du fichier: ${file.path}');
    } else {
      // L'utilisateur a annulé la sélection
    }
  }

  List<String> allSkills = [
    'Digital & Creative',
    'Retail',
    'Management',
    'Accounting & Finance',
    'Digital',
    'Creative Art'
  ];

  List<String> selectedSkills = [];
  String? _selectedOptionCv;
  //Clé des input
  final _description = GlobalKey<FormFieldState<String>>();
  final _monCv = GlobalKey<FormFieldState<String>>();

  // Controller du formulaire
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _monCvController = TextEditingController();

  final TextInputType inputText = TextInputType.multiline;

  @override
  void initState() {
    // Ajouter un listener pour déclacher la validation automatique
    _monCvController.addListener(() {
      // Si le formulaire est valide il s'actualise automatiquement
      _monCv.currentState?.validate();
    });
    _descriptionController.addListener(() {
      _description.currentState?.validate();
    });
    super.initState();
  }

  @override
  void dispose() {
    _monCvController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropdownButton2(
          aKey: _monCv,
          hint: "Mon Cv",
          value: _selectedOptionCv,
          dropdownItems: const [
            'Cv 1',
            'Cv 2',
          ],
          onChanged: (value) {
            setState(() {
              _selectedOptionCv = value;
              _monCvController.text = value ?? '';
            });
          },
          validator: validateDropdown,
          buttonWidth: screenWidth,
          buttonHeight: screenHeight * 0.062,
          dropdownWidth: screenWidth * 0.8,
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        CustomTextFormField(
          labelText: "Description",
          hintText: "Lorem Ipsum....",
          fieldKey: _description,
          controller: _descriptionController,
          keyboardType: inputText,
          validator: validatorDescription,
          maxLine: 6,
          textAlign: TextAlignVertical.top,
        ),
        SizedBox(
          height: screenHeight * 0.03,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Education',
                  style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                TextButton.icon(
                    onPressed: () {},
                    icon: Container(
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.redAccent,
                      ),
                    ),
                    label: const Text(
                      "Add Education",
                      style: TextStyle(color: Colors.redAccent),
                    ))
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Stack(
              children: [
                // Ligne pointillée continue à gauche
                Positioned(
                  left: screenWidth *
                      0.048, // Position de la ligne pointillée à gauche
                  top: 0,
                  bottom: 0,
                  child: CustomPaint(
                    size: Size(
                        1,
                        double
                            .infinity), // Prend toute la hauteur de la section
                    painter: DottedLinePainter(),
                  ),
                ),
                Column(
                  children: [
                    EducationItem(
                      icon: 'M',
                      degree: 'Bachelors in Fine Arts',
                      school: 'Modern College',
                      duration: '2012 - 2014',
                    ),
                    SizedBox(height: 16),
                    EducationItem(
                      icon: 'H',
                      degree: 'Computer Science',
                      school: 'Harvard University',
                      duration: '2008 - 2012',
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        SizedBox(height: screenHeight * 0.02),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Education',
                  style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                TextButton.icon(
                    onPressed: () {},
                    icon: Container(
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.redAccent,
                      ),
                    ),
                    label: const Text(
                      "Add Education",
                      style: TextStyle(color: Colors.redAccent),
                    ))
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Stack(
              children: [
                // Ligne pointillée continue à gauche
                Positioned(
                  left: screenWidth *
                      0.048, // Position de la ligne pointillée à gauche
                  top: 0,
                  bottom: 0,
                  child: CustomPaint(
                    size: Size(
                        1,
                        double
                            .infinity), // Prend toute la hauteur de la section
                    painter: DottedLinePainter(),
                  ),
                ),
                Column(
                  children: [
                    EducationItem(
                      color: lightColorScheme.primary,
                      icon: 'M',
                      degree: 'Bachelors in Fine Arts',
                      school: 'Modern College',
                      duration: '2012 - 2014',
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    EducationItem(
                      color: lightColorScheme.primary,
                      icon: 'H',
                      degree: 'Computer Science',
                      school: 'Harvard University',
                      duration: '2008 - 2012',
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        SizedBox(height: screenHeight * 0.05),
        InkWell(
          onTap: pickFile,
          child: DottedBorder(
            color: Colors.grey,
            strokeWidth: 1,
            dashPattern: const [6, 3], // Pattern pour le style en pointillé
            borderType: BorderType.RRect,
            radius: const Radius.circular(10),
            child: Container(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Row(
                children: [
                  Icon(
                    Icons.picture_as_pdf,
                    color: Colors.grey,
                    size: screenWidth * 0.1,
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fileName ?? "Portfolio",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.045),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.cloud_upload_outlined,
                    color: Colors.grey,
                    size: screenWidth * 0.08,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.03),
        const Divider(),
        SizedBox(height: screenHeight * 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Awards',
                  style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                TextButton.icon(
                    onPressed: () {},
                    icon: Container(
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.redAccent,
                      ),
                    ),
                    label: const Text(
                      "Add Awards",
                      style: TextStyle(color: Colors.redAccent),
                    ))
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Stack(
              children: [
                // Ligne pointillée continue à gauche
                Positioned(
                  left: screenWidth *
                      0.048, // Position de la ligne pointillée à gauche
                  top: 0,
                  bottom: 0,
                  child: CustomPaint(
                    size: Size(
                        1,
                        double
                            .infinity), // Prend toute la hauteur de la section
                    painter: DottedLinePainter(),
                  ),
                ),
                Column(
                  children: [
                    EducationItem(
                      color: lightColorScheme.primary,
                      icon: 'M',
                      degree: 'Bachelors in Fine Arts',
                      school: 'Modern College',
                      duration: '2012 - 2014',
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    EducationItem(
                      color: lightColorScheme.primary,
                      icon: 'H',
                      degree: 'Computer Science',
                      school: 'Harvard University',
                      duration: '2008 - 2012',
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        SizedBox(height: screenHeight * 0.05),
        Text(
          'Skills',
          style: TextStyle(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.bold,
          ),
          ),
        SizedBox(height: screenHeight * 0.02),
        InputDecorator(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Wrap(
            spacing: 6.0,
            // runSpacing: 6.0,
            children: [
              // Display selected skills as chips
              for (String skill in selectedSkills)
                Chip(
                  backgroundColor: lightColorScheme.onPrimary,
                  label: Text(
                    skill,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: lightColorScheme.surface
                    ),
                    ),
                  side: BorderSide.none,
                  deleteIconColor: lightColorScheme.surface,
                  deleteIcon: Icon(Icons.close),
                  onDeleted: () {
                    setState(() {
                      selectedSkills.remove(skill);
                      allSkills.add(skill);
                    });
                  },
                ),
              DropdownButton<String>(
                dropdownColor: lightColorScheme.onPrimary,
                isExpanded: true,
                underline: SizedBox(),
                hint: selectedSkills.isEmpty
                    ? Text(
                        'Select Skills',
                        style: const TextStyle(color: Colors.grey),
                      )
                    : null,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedSkills.add(newValue!);
                    allSkills.remove(newValue);
                  });
                },
                items: allSkills.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
                SizedBox(height: screenHeight * 0.05),
       CustomElevatedButton(
              paddingLR: screenWidth * 0.06,
              paddingTB: screenHeight * 0.01,
              text: "Save",
              textSize: screenWidth * 0.05,
              onPressed: () {
                // if (_formKeySocialNetwork.currentState?.validate() ?? false) {
                //   // Si le formulaire est valide
                // }
              })
      ],
    );
  }

}
