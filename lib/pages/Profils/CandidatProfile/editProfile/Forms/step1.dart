import 'package:black_network/pages/Profils/CandidatProfile/editProfile/Forms/Validation/FormSecure.dart';
import 'package:black_network/widgets/TextFieldForm.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Step1 extends StatefulWidget {
  const Step1({super.key});

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  // KeyForm
  final _fullName = GlobalKey<FormFieldState<String>>();
  final _jobTitle = GlobalKey<FormFieldState<String>>();
  final _phone = GlobalKey<FormFieldState<String>>();
  final _emailAddress = GlobalKey<FormFieldState<String>>();
  final _webSite = GlobalKey<FormFieldState<String>>();
    final TextInputType inputText = TextInputType.text;
  final TextInputType inputPhone = TextInputType.phone;
  final TextInputType inputNumber = TextInputType.number;
  final TextInputType inputEmail = TextInputType.emailAddress;
  final TextInputType inputDescrip = TextInputType.multiline;
   final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
    String? fileName;


    bool isFilePickerActive = false;  // Déclaration de l'état

Future<void> pickFile() async {
  // Vérifier si le sélecteur de fichier est déjà actif
  if (isFilePickerActive) {
    print('Sélecteur de fichier déjà actif');
    return;
  }

  try {
    // Activer l'indicateur
    setState(() {
      isFilePickerActive = true;
    });

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

      // Traiter le fichier
      print('Nom du fichier: ${file.name}');
      print('Taille du fichier: ${file.size}');
      print('Chemin du fichier: ${file.path}');
    } else {
      // L'utilisateur a annulé la sélection
      print('Aucun fichier sélectionné.');
    }
  } catch (e) {
    print('Erreur lors de la sélection de fichier : $e');
  } finally {
    // Réinitialiser l'indicateur après la sélection
    setState(() {
      isFilePickerActive = false;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Column(
      children: [

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
      ],
    );
  }
}