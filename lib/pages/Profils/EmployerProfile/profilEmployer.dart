import 'package:black_network/pages/Profils/widgetProfilList.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class ProfilEmployer extends StatefulWidget {
  const ProfilEmployer({super.key});

  @override
  State<ProfilEmployer> createState() => _ProfilEmployerState();
}

class _ProfilEmployerState extends State<ProfilEmployer> {
  @override
  Widget build(BuildContext context) {
    // Récupérer la longueur et largeur de l'écran
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.08),
        child: AppBar(
          backgroundColor: lightColorScheme.primary,
          title: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Première ligne : image de profil et icône "settings"
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // Image de profil
                        CircleAvatar(
                          backgroundColor: lightColorScheme.onPrimary,
                          radius: 29, // Taille de l'image de profil
                          backgroundImage: AssetImage(
                              'assets/avatar/avataaars.png'), // Remplacer par l'image réelle
                        ),
                        SizedBox(
                            width: screenWidth *
                                0.03), // Espacement entre l'image et le texte

                        // Nom de l'utilisateur et localisation
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Brianne Chaney",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.05,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "New York, USA",
                              style: TextStyle(
                                color: Colors.white
                                    .withOpacity(0.8), // Couleur plus claire
                                fontSize: screenWidth * 0.035,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Icône de paramètres
                    const Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 28,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: lightColorScheme.onPrimary,
      body: ListView(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.03, horizontal: screenWidth * 0.05),
        children: [
          // Première section (Edit Profile)
          const WidgetMenuProfile(
              leadingIcon: Icon(Icons.person_outline),
              trailingIcon: Icon(Icons.edit_outlined),
              title: "Edit profile"),

          // Update Resume
          const WidgetMenuProfile(
              leadingIcon: Icon(Icons.article),
              trailingIcon: Icon(Icons.edit_outlined),
              title: "Update your resume"),

          // Create Resume
          const WidgetMenuProfile(
              leadingIcon: Icon(Icons.article_outlined),
              trailingIcon: Icon(Icons.edit_outlined),
              title: "Create your resume"),
          // Password
          const WidgetMenuProfile(
              leadingIcon: Icon(Icons.lock_outline),
              trailingIcon: Icon(Icons.arrow_forward_ios),
              title: "Change Password"),

          // Language

          Card(
            color: lightColorScheme.onPrimary,
            shadowColor: Colors.grey.withOpacity(0.8),
            elevation: 3,
            child: ListTile(
              leading: Icon(Icons.language, color: lightColorScheme.surface),
              title: Text('Language',
                  style: TextStyle(color: lightColorScheme.surface)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('English',
                      style: TextStyle(color: lightColorScheme.surface)),
                  const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                ],
              ),
              onTap: () {
                // Action lors du clic
              },
            ),
          ),
          // Log Out
          const WidgetMenuProfile(
              leadingIcon: Icon(Icons.logout),
              trailingIcon: Icon(Icons.arrow_forward_ios),
              title: 'Log Out'),
          
        ],
      ),
    );
  }
}