import 'package:black_network/theme/theme.dart';
import 'package:black_network/widgets/CustomScafold.dart';
import 'package:black_network/widgets/container.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Cvmanager extends StatefulWidget {
  const Cvmanager({super.key});

  @override
  State<Cvmanager> createState() => _CvmanagerState();
}

class _CvmanagerState extends State<Cvmanager> {
  List<PlatformFile> selectedFiles = [];

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      dialogTitle: "Select Your CV ",
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['docx', 'pdf', 'doc'],
    ); // Limiter aux formats autorisés

    if (result != null) {
      setState(() {
        selectedFiles = result.files; // Mettre à jour la liste des fichiers sélectionnés
      });

      // Tu peux faire quelque chose avec les fichiers, comme les envoyer vers un serveur
      for (var file in selectedFiles) {
        print('Nom du fichier: ${file.name}');
        print('Taille du fichier: ${file.size}');
        print('Chemin du fichier: ${file.path}');
      }
    } else {
      // L'utilisateur a annulé la sélection
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    var fontTitle = screenWidth * 0.06;
    var spaceHeight = screenHeight * 0.018;

    return CustomScaffold(
        appTitle: "Cv Manager",
        child: CustomContainer(
        child: Column(
          spacing: spaceHeight,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cv Manager",
              style: TextStyle(
                color: lightColorScheme.surface,
                fontSize: fontTitle,
              ),
            ),
            InkWell(
              onTap: pickFile,
              child: DottedBorder(
                color: Colors.grey,
                strokeWidth: 1,
                dashPattern: const [6, 3],
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
                              selectedFiles.isNotEmpty
                                  ? '${selectedFiles.length} files selected'
                                  : "Drop files here to upload",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.045,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "To upload file size is (Max 5Mb) and allowed file types are (.doc, .docx, .pdf)",
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
            const Divider(),
            // Afficher les fichiers sélectionnés dans un GridView
            Expanded(
              child: selectedFiles.isNotEmpty
                  ? GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Nombre de colonnes
                        childAspectRatio: 3 / 2, // Aspect ratio des cards
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: selectedFiles.length,
                      itemBuilder: (context, index) {
                        PlatformFile file = selectedFiles[index];
                        final size = file.size / 2048;
                        return Card(
                          color: lightColorScheme.onPrimary,
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.insert_drive_file,
                                  size: screenWidth * 0.04,
                                  color: Colors.blue,
                                ),
                                SizedBox(height: spaceHeight),
                                Text(
                                  file.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth * 0.04,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: spaceHeight),
                                Text(
                                  '${(file.size / (1024 * 1024)).toStringAsFixed(2)} Mo', // Convertit en Mo et affiche 2 décimales
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: screenWidth * 0.03,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        "No CV selected",
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          color: Colors.grey,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
