import 'package:black_network/pages/Profils/CandidatProfile/editProfile/Forms/Validation/FormSecure.dart';
import 'package:black_network/widgets/TextFieldForm.dart';
import 'package:black_network/widgets/button.dart';
import 'package:flutter/material.dart';

class Formnetxork extends StatefulWidget {
  const Formnetxork({super.key});

  @override
  State<Formnetxork> createState() => _FormnetxorkState();
}

class _FormnetxorkState extends State<Formnetxork> {
  //Clé des input
  final _facebook = GlobalKey<FormFieldState<String>>();
  final _x = GlobalKey<FormFieldState<String>>();
  final _linkedin = GlobalKey<FormFieldState<String>>();
  final _googlePlus = GlobalKey<FormFieldState<String>>();

  //Clé du formulaire
  final _formKeySocialNetwork = GlobalKey<FormState>();
  final TextInputType inputText = TextInputType.emailAddress;

  //Controller des input
  final TextEditingController _facebookController = TextEditingController();
  final TextEditingController _xController = TextEditingController();
  final TextEditingController _linkedinController = TextEditingController();
  final TextEditingController _googlePlusController = TextEditingController();

  @override
  void initState() {
    // Ajouter un listener pour déclacher la validation automatique
    _facebookController.addListener(() {
      // Si le formulaire est valide il s'actualise automatiquement
      _facebook.currentState?.validate();
    });
    _xController.addListener(() {
      _x.currentState?.validate();
    });
    _linkedinController.addListener(() {
      _linkedin.currentState?.validate();
    });
    _googlePlusController.addListener(() {
      _googlePlus.currentState?.validate();
    });
    super.initState();
  }

  @override
  void dispose() {
    _facebookController.dispose();
    _xController.dispose();
    _linkedinController.dispose();
    _googlePlusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Form(
      key: _formKeySocialNetwork,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Social Network',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.05,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          CustomTextFormField(
            labelText: "Facebook",
            hintText: "www.facebook.com",
            fieldKey: _facebook,
            controller: _facebookController,
            validator: validateLink,
            keyboardType: inputText,
          ),
          SizedBox(height: screenHeight * 0.015),
          CustomTextFormField(
            labelText: "X",
            hintText: "www.twitter.com",
            fieldKey: _x,
            controller: _xController,
            validator: validateLink,
            keyboardType: inputText,
          ),
          SizedBox(height: screenHeight * 0.015),
          CustomTextFormField(
            labelText: "Linkedin",
            hintText: "www.linkedin.com",
            fieldKey: _linkedin,
            controller: _linkedinController,
            validator: validateLink,
            keyboardType: inputText,
          ),
          SizedBox(height: screenHeight * 0.015),
          CustomTextFormField(
            labelText: "Google Plus",
            hintText: "johndoe@gmail.com",
            fieldKey: _googlePlus,
            controller: _googlePlusController,
            validator: validateLink,
            keyboardType: inputText,
          ),
          SizedBox(height: screenHeight * 0.02),
          CustomElevatedButton(
              paddingLR: screenWidth * 0.06,
              paddingTB: screenHeight * 0.01,
              text: "Save",
              textSize: screenWidth * 0.05,
              onPressed: () {
                if (_formKeySocialNetwork.currentState?.validate() ?? false) {
                  // Si le formulaire est valide
                }
              })
        ],
      ),
    );
  }
}
