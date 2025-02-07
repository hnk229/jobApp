import 'package:black_network/pages/Profils/CandidatProfile/editProfile/Forms/formContactInformation.dart';
import 'package:black_network/pages/Profils/CandidatProfile/editProfile/Forms/formEditProfil.dart';
import 'package:black_network/pages/Profils/CandidatProfile/editProfile/Forms/formNetxork.dart';
import 'package:black_network/theme/theme.dart';
import 'package:black_network/widgets/CustomScafold.dart';
import 'package:flutter/material.dart';

class EditProfileCandidat extends StatefulWidget {
  const EditProfileCandidat({super.key});

  @override
  State<EditProfileCandidat> createState() => _EditProfileCandidatState();
}

class _EditProfileCandidatState extends State<EditProfileCandidat> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    return CustomScaffold(
      appTitle: "Edit Your Profil",
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.8,
              child: const Formeditprofil(),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: lightColorScheme.onPrimary,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // Décalage de l'ombre
                  ),
                ],
              ),
              child: const Formnetxork(),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: lightColorScheme.onPrimary,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // Décalage de l'ombre
                  ),
                ],
              ),
              child: const Formcontactinformation(),
            ),
          ],
        ),
      ),
    );
  }
}
