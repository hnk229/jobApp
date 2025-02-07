import 'package:black_network/pages/Profils/CandidatProfile/MyResumPage/Form/profile.dart';
import 'package:black_network/pages/Profils/CandidatProfile/editProfile/Forms/formEditProfil.dart';
import 'package:black_network/theme/theme.dart';
import 'package:black_network/widgets/CustomScafold.dart';
import 'package:flutter/material.dart';

class Myresume extends StatefulWidget {
  const Myresume({super.key});

  @override
  State<Myresume> createState() => _MyresumeState();
}

class _MyresumeState extends State<Myresume> {
    //Clé du formulaire
  final _formKeyMyResume = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    return CustomScaffold(
      appTitle: "My Resume",
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Resume!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: lightColorScheme.surface,
                    fontSize: screenWidth * 0.06),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: lightColorScheme.onPrimary,                  
                ),
                child: Form(
                  key: _formKeyMyResume,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Profile",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: lightColorScheme.surface,
                            fontSize: screenWidth * 0.04),
                      ),
                      SizedBox(height: screenHeight * 0.03,),
                      const MyProfile(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
