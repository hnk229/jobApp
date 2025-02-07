import 'package:black_network/pages/Profils/CandidatProfile/editProfile/Forms/Validation/FormSecure.dart';
import 'package:black_network/widgets/Dropdown.dart';
import 'package:black_network/widgets/TextFieldForm.dart';
import 'package:black_network/widgets/button.dart';
import 'package:flutter/material.dart';

class Formcontactinformation extends StatefulWidget {
  const Formcontactinformation({super.key});

  @override
  State<Formcontactinformation> createState() => _FormcontactinformationState();
}

class _FormcontactinformationState extends State<Formcontactinformation> {
  String? _selectedOptionCountry, _selectedOptionCity;

  //Clé des input
  final _country = GlobalKey<FormFieldState<String>>();
  final _city = GlobalKey<FormFieldState<String>>();
  final _address = GlobalKey<FormFieldState<String>>();

  //Clé du formulaire
  final _formKeyContactInformation = GlobalKey<FormState>();
  final TextInputType inputText = TextInputType.text;

  //Controller des input
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    // Ajouter un listener pour déclacher la validation automatique
    _countryController.addListener(() {
      // Si le formulaire est valide il s'actualise automatiquement
      _country.currentState?.validate();
    });
    _cityController.addListener(() {
      _city.currentState?.validate();
    });
    _addressController.addListener(() {
      _address.currentState?.validate();
    });
    super.initState();
  }

  @override
  void dispose() {
    _countryController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Form(
      key: _formKeyContactInformation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Information',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.05,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          CustomDropdownButton2(
            hint: "Country",
            value: _selectedOptionCountry,
            dropdownItems: const [
              'yes',
              'No',
            ],
            onChanged: (value) {
              setState(() {
                _selectedOptionCountry = value;
                _countryController.text = value ?? '';
              });
            },
            validator: validateDropdown,
            buttonWidth: screenWidth,
            buttonHeight: screenHeight * 0.062,
            dropdownWidth: screenWidth * 0.8,
          ),
          SizedBox(height: screenHeight * 0.015),
          CustomDropdownButton2(
            aKey: _city,
            hint: "City",
            value: _selectedOptionCity,
            dropdownItems: const [
              'yes',
              'No',
            ],
            onChanged: (value) {
              setState(() {
                _selectedOptionCity = value;
                _cityController.text = value ?? '';
              });
            },
            validator: validateDropdown,
            buttonWidth: screenWidth,
            buttonHeight: screenHeight * 0.062,
            dropdownWidth: screenWidth * 0.8,
          ),
          SizedBox(height: screenHeight * 0.015),
          CustomTextFormField(
              labelText: "Complete Address", 
              hintText: "93, Paris, ...",
              fieldKey: _address,
              controller: _addressController,
              validator: validateText,
              keyboardType: inputText,
              ),
          // SizedBox(height: screenHeight * 0.015),
          // CustomTextFormField(
          //     labelText: "Google Plus", hintText: "johndoe@gmail.com"),
          SizedBox(height: screenHeight * 0.02),
          CustomElevatedButton(
              paddingLR: screenWidth * 0.06,
              paddingTB: screenHeight * 0.01,
              textSize: screenWidth * 0.05,
              text: "Save",
              onPressed: () {})
        ],
      ),
    );
  }
}
