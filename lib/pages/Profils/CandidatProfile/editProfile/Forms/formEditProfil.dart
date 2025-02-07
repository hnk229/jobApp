import 'package:black_network/pages/Profils/CandidatProfile/editProfile/Forms/Validation/FormSecure.dart';
import 'package:black_network/theme/theme.dart';
import 'package:black_network/widgets/Dropdown.dart';
import 'package:black_network/widgets/TextFieldForm.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Formeditprofil extends StatefulWidget {
  const Formeditprofil({super.key});

  @override
  State<Formeditprofil> createState() => _FormeditprofilState();
}

class _FormeditprofilState extends State<Formeditprofil> {
  // KeyForm
  final _fullName = GlobalKey<FormFieldState<String>>();
  final _jobTitle = GlobalKey<FormFieldState<String>>();
  final _phone = GlobalKey<FormFieldState<String>>();
  final _emailAddress = GlobalKey<FormFieldState<String>>();
  final _webSite = GlobalKey<FormFieldState<String>>();
  final _currentSalary = GlobalKey<FormFieldState<String>>();
  final _expectedSalary = GlobalKey<FormFieldState<String>>();
  final _experience = GlobalKey<FormFieldState<String>>();
  final _age = GlobalKey<FormFieldState<String>>();
  final _educationLevel = GlobalKey<FormFieldState<String>>();
  final _categories = GlobalKey<FormFieldState<String>>();
  final _searchListing = GlobalKey<FormFieldState<String>>();
  final _description = GlobalKey<FormFieldState<String>>();
  final _langages = GlobalKey<FormFieldState<String>>();

  final _formKeyMyProfil = GlobalKey<FormState>();
  final TextInputType inputText = TextInputType.text;
  final TextInputType inputPhone = TextInputType.phone;
  final TextInputType inputNumber = TextInputType.number;
  final TextInputType inputEmail = TextInputType.emailAddress;
  final TextInputType inputDescrip = TextInputType.multiline;

  // controller
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _currentSalaryController =
      TextEditingController();
  final TextEditingController _expectedSalaryController =
      TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _educationLevelController =
      TextEditingController();
  final TextEditingController _categoriesController = TextEditingController();
  final TextEditingController _searchListingController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _langagesController = TextEditingController();

  String? _selectedOptionSalary;
  String? _selectedOptionExpectedSalary;
  String? _selectedOptionCategories;
  String? _selectedOptionAge;
  String? _selectedOptionSearch;

  String? fileName;
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
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

  //Steper index
  int _index = 0;

  @override
  void initState() {
    // Ajouter un listener pour déclacher la validation automatique
    _fullNameController.addListener(() {
      // Si le formulaire est valide il s'actualise automatiquement
      _fullName.currentState?.validate();
    });
    _jobTitleController.addListener(() {
      _jobTitle.currentState?.validate();
    });
    _phoneController.addListener(() {
      _phone.currentState?.validate();
    });
    _emailAddressController.addListener(() {
      _emailAddress.currentState?.validate();
    });
    _jobTitleController.addListener(() {
      _jobTitle.currentState?.validate();
    });
    _websiteController.addListener(() {
      _webSite.currentState?.validate();
    });
    _currentSalaryController.addListener(() {
      _currentSalary.currentState?.validate();
    });
    _expectedSalaryController.addListener(() {
      _expectedSalary.currentState?.validate();
    });
    _experienceController.addListener(() {
      _experience.currentState?.validate();
    });
    _ageController.addListener(() {
      _age.currentState?.validate();
    });
    _educationLevelController.addListener(() {
      _educationLevel.currentState?.validate();
    });
    _categoriesController.addListener(() {
      _categories.currentState?.validate();
    });
    _searchListingController.addListener(() {
      _searchListing.currentState?.validate();
    });
    _descriptionController.addListener(() {
      _description.currentState?.validate();
    });
    _langagesController.addListener(() {
      _langages.currentState?.validate();
    });
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _jobTitleController.dispose();
    _phoneController.dispose();
    _emailAddressController.dispose();
    _websiteController.dispose();
    _currentSalaryController.dispose();
    _expectedSalaryController.dispose();
    _experienceController.dispose();
    _ageController.dispose();
    _educationLevelController.dispose();
    _langagesController.dispose();
    _categoriesController.dispose();
    _searchListingController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    List<Step> getSteps() => [
          Step(
              state: _index > 0 ? StepState.complete : StepState.indexed,
              isActive: _index >= 0,
              title: const Text(''),
              content: Column(
                children: [
                  Text(
                    'Personnal Detail',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.05,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  InkWell(
                    onTap: pickFile,
                    child: DottedBorder(
                      color: Colors.grey,
                      strokeWidth: 1,
                      dashPattern: const [
                        6,
                        3
                      ], // Pattern pour le style en pointillé
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(screenWidth * 0.05),
                        child: Row(
                          children: [
                            Icon(
                              Icons.image,
                              color: Colors.grey,
                              size: screenWidth * 0.1,
                            ),
                            SizedBox(width: screenWidth * 0.05),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    fileName ?? "Browse Logo",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: screenWidth * 0.045),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "(Max file size is 1MB, Minimum dimension: 330x300 And Suitable files are .jpg & .png)",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: screenWidth * 0.03),
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
                  SizedBox(height: screenHeight * 0.02),
                  const Divider(),
                  SizedBox(height: screenHeight * 0.01),
                  CustomTextFormField(
                    keyboardType: inputText,
                    labelText: "Full Name *",
                    hintText: "John Doe",
                    controller: _fullNameController,
                    fieldKey: _fullName,
                    validator: validateText,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  CustomTextFormField(
                    keyboardType: inputText,
                    labelText: "Job Title",
                    hintText: "UI Designer *",
                    validator: validateText,
                    controller: _jobTitleController,
                    fieldKey: _jobTitle,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  CustomTextFormField(
                    labelText: "Phone *",
                    hintText: "0 123 456 7890",
                    validator: validatorPhone,
                    fieldKey: _phone,
                    controller: _phoneController,
                    keyboardType: inputPhone,
                  ),
                ],
              )),
          Step(
              state: _index > 1 ? StepState.complete : StepState.indexed,
              isActive: _index >= 1,
              title: Text(''),
              content: Column(
                children: [
                  Text(
                    'Personnal Detail',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.05,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextFormField(
                    labelText: "Email Address *",
                    hintText: "johndoe@gmail.com",
                    fieldKey: _emailAddress,
                    controller: _emailAddressController,
                    keyboardType: inputEmail,
                    validator: validatorEmail,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  CustomTextFormField(
                    labelText: "Website",
                    hintText: "www.johndoe.com",
                    fieldKey: _webSite,
                    controller: _websiteController,
                    keyboardType: inputEmail,
                    validator: validateText,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  CustomDropdownButton2(
                    aKey: _currentSalary,
                    hint: "Current Salary (\$)",
                    value: _selectedOptionSalary,
                    dropdownItems: const [
                      '40-70 k',
                      '50-80 k',
                      '60-90 k',
                      '70-100 k',
                      '100-150 k'
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedOptionSalary = value;
                        _currentSalaryController.text = value ?? '';
                      });
                    },
                    buttonWidth: screenWidth,
                    buttonHeight: screenHeight * 0.062,
                    dropdownWidth: screenWidth * 0.8,
                    validator: validateDropdown,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  CustomDropdownButton2(
                    aKey: _expectedSalary,
                    hint: "Expected Salary (\$)",
                    value: _selectedOptionExpectedSalary,
                    dropdownItems: const [
                      '40-70 k',
                      '50-80 k',
                      '60-90 k',
                      '70-100 k',
                      '100-150 k'
                    ],
                    validator: validateDropdown,
                    onChanged: (value) {
                      setState(() {
                        _selectedOptionExpectedSalary = value;
                        _expectedSalaryController.text = value ?? '';
                      });
                    },
                    buttonWidth: screenWidth,
                    buttonHeight: screenHeight * 0.062,
                    dropdownWidth: screenWidth * 0.8,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  CustomTextFormField(
                    labelText: "Expérience",
                    hintText: "5-10 years",
                    fieldKey: _experience,
                    controller: _experienceController,
                    keyboardType: inputNumber,
                    validator: validatorNumber,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                ],
              )),
          Step(
              state: _index > 2 ? StepState.complete : StepState.indexed,
              isActive: _index >= 2,
              title: Text(''),
              content: Column(
                children: [
                  Text(
                    'Personnal Detail',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.05,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomDropdownButton2(
                    aKey: _age,
                    hint: "Age",
                    value: _selectedOptionAge,
                    dropdownItems: const [
                      '23 - 27 years',
                      '24 - 28 years',
                      '25 - 29 years',
                      '26 - 30 years',
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedOptionAge = value;
                        _ageController.text = value ?? '';
                      });
                    },
                    validator: validateDropdown,
                    buttonWidth: screenWidth,
                    buttonHeight: screenHeight * 0.062,
                    dropdownWidth: screenWidth * 0.8,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  CustomTextFormField(
                    labelText: "Education levels",
                    hintText: "Certificate",
                    fieldKey: _educationLevel,
                    controller: _educationLevelController,
                    keyboardType: inputText,
                    validator: validateText,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  CustomTextFormField(
                    labelText: "Langages",
                    hintText: "English, French",
                    fieldKey: _langages,
                    controller: _langagesController,
                    keyboardType: inputText,
                    validator: validateText,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  CustomDropdownButton2(
                    aKey: _categories,
                    hint: "Categories",
                    value: _selectedOptionCategories,
                    dropdownItems: const [
                      '23 - 27 years',
                      '24 - 28 years',
                      '25 - 29 years',
                      '26 - 30 years',
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedOptionCategories = value;
                        _categoriesController.text = value ?? '';
                      });
                    },
                    validator: validateDropdown,
                    buttonWidth: screenWidth,
                    buttonHeight: screenHeight * 0.062,
                    dropdownWidth: screenWidth * 0.8,
                  ),
                  SizedBox(height: screenHeight * 0.12),
                ],
              )),
          Step(
              state: _index > 3 ? StepState.complete : StepState.indexed,
              isActive: _index >= 3,
              title: Text(''),
              content: Column(
                children: [
                  Text(
                    'Personnal Detail',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.05,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomDropdownButton2(
                    aKey: _searchListing,
                    hint: "Allow In Search & Listing",
                    value: _selectedOptionSearch,
                    dropdownItems: const [
                      'yes',
                      'No',
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedOptionSearch = value;
                        _searchListingController.text = value ?? '';
                      });
                    },
                    validator: validateDropdown,
                    buttonWidth: screenWidth,
                    buttonHeight: screenHeight * 0.062,
                    dropdownWidth: screenWidth * 0.8,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  CustomTextFormField(
                    labelText: "Description",
                    hintText: "Lorem Ipsum....",
                    fieldKey: _description,
                    controller: _descriptionController,
                    keyboardType: inputDescrip,
                    validator: validatorDescription,
                    maxLine: 6,
                    textAlign: TextAlignVertical.top,
                  ),
                  SizedBox(height: screenHeight * 0.14),
                ],
              )),
        ];

    return Form(
      key: _formKeyMyProfil,
      child: Container(
        color: Colors.white,
        child: Theme(
          data: ThemeData(
            // Custom color for the active steps
            colorScheme: ColorScheme.light(primary: lightColorScheme.primary),

            // Custom style for the stepper's title bar and indicators
            canvasColor: lightColorScheme.onPrimary,
          ), // Background of the stepper's bar (title area),
          child: Stepper(
            elevation: 0,
            currentStep: _index,
            type: StepperType.horizontal,
            onStepCancel: () {
              if (_index > 0) {
                setState(() {
                  _index -= 1;
                });
              }
            },
            onStepContinue: () {
              final isLastStep = _index == getSteps().length - 1;
              if (isLastStep) {
                print("Finaly");
              } else {
                setState(() {
                  _index += 1;
                });
              }
            },
            onStepTapped: (int index) {
              setState(() {
                _index = index;
              });
            },
            steps: getSteps(),
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              final isLastStep = _index == getSteps().length - 1;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  if (_index != 0)
                    TextButton(
                      onPressed: details.onStepCancel,
                      child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.01,
                            horizontal: screenWidth * 0.06,
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.01),
                              color: lightColorScheme.secondary),
                          child: Text(
                            'Back',
                            style: TextStyle(fontSize: screenWidth * 0.045),
                          )),
                    ),
                  TextButton(
                    onPressed: details.onStepContinue,
                    child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.01,
                          horizontal: screenWidth * 0.06,
                        ),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.01),
                            color: lightColorScheme.primary),
                        child: Text(
                          isLastStep ? 'Save' : 'Next',
                          style: TextStyle(
                              color: lightColorScheme.onPrimary,
                              fontSize: screenWidth * 0.045),
                        )),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
