import 'package:black_network/pages/Profils/CandidatProfile/editProfile/Forms/Validation/FormSecure.dart';
import 'package:black_network/theme/theme.dart';
import 'package:black_network/widgets/CustomScafold.dart';
import 'package:black_network/widgets/TextFieldForm.dart';
import 'package:black_network/widgets/button.dart';
import 'package:black_network/widgets/container.dart';
import 'package:flutter/material.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({super.key});

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  final _oldPassword = GlobalKey<FormFieldState<String>>();
  final _newPassword = GlobalKey<FormFieldState<String>>();
  final _confirmPassword = GlobalKey<FormFieldState<String>>();

  final _formKeyChangePassword = GlobalKey<FormState>();

  // Controller du formulaire
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    _oldPasswordController.addListener(() {
      _oldPassword.currentState?.validate();
    });
    _newPasswordController.addListener(() {
      _newPassword.currentState?.validate();
    });
    _confirmPasswordController.addListener(() {
      _confirmPassword.currentState?.validate();
    });
    super.initState();
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
      appTitle: "Change Password",
      child: CustomContainer(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Change Your Password",
                style: TextStyle(
                  color: lightColorScheme.surface,
                  fontSize: fontTitle,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.05,),
              CustomTextFormField(
                key: _oldPassword,
                controller: _oldPasswordController,
                labelText: "Old Password",
                hintText: "Old Password",
                validator: validateText,
                obscureText: true,
              ),
              SizedBox(
                height: spaceHeight,
              ),
              CustomTextFormField(
                key: _newPassword,
                controller: _newPasswordController,
                labelText: "New Password",
                hintText: "New Password",
                validator: validateText,
                obscureText: true,
              ),
              SizedBox(
                height: spaceHeight,
              ),
              CustomTextFormField(
                key: _confirmPassword,
                controller: _confirmPasswordController,
                labelText: "Confirm Password",
                hintText: "Confirm Password",
                validator: validateText,
                obscureText: true,
              ),
              SizedBox(
                height: spaceHeight,
              ),
              Center(
                child: CustomElevatedButton(
                    paddingLR: screenWidth * 0.35,
                    paddingTB: screenHeight * 0.01,
                    text: "Update",
                    textSize: screenWidth * 0.05,
                    onPressed: () {
                      if (_formKeyChangePassword.currentState?.validate() ?? false) {
                        // Si le formulaire est valide
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
