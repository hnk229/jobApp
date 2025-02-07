import 'package:black_network/pages/Profils/CandidatProfile/Applied_Jobs/AppliedJobs.dart';
import 'package:black_network/pages/Profils/CandidatProfile/Change_password/changePassword.dart';
import 'package:black_network/pages/Profils/CandidatProfile/Cv_manager/CvManager.dart';
import 'package:black_network/pages/Profils/CandidatProfile/MyResumPage/myResume.dart';
import 'package:black_network/pages/Profils/CandidatProfile/ShortlistedJobs/shortlistedJobs.dart';
import 'package:black_network/pages/Profils/CandidatProfile/editProfile/editProfile.dart';
import 'package:black_network/pages/Profils/widgetProfilList.dart';
import 'package:black_network/theme/theme.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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
          backgroundColor: lightColorScheme.onPrimary,
          title: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Première ligne : image de profil et icône "settings"
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: screenWidth * 0.03,
                      children: [
                        // Image de profil
                        CircleAvatar(
                          backgroundColor: lightColorScheme.onPrimary,
                          radius: 29, // Taille de l'image de profil
                          backgroundImage: const AssetImage(
                              'assets/avatar/avataaars.png'), // Remplacer par l'image réelle
                        ),

                        // Nom de l'utilisateur et localisation
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Brianne Chaney",
                              style: TextStyle(
                                color: lightColorScheme.shadow,
                                fontSize: screenWidth * 0.05,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "New York, USA",
                              style: TextStyle(
                                color: lightColorScheme.shadow
                                    .withOpacity(0.7), // Couleur plus claire
                                fontSize: screenWidth * 0.035,
                              ),
                            ),
                          ],
                        ),
                      ],
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
          WidgetMenuProfile(
            leadingIcon: const Icon(Icons.person_outline),
            trailingIcon: const Icon(Icons.edit_outlined),
            title: "My profile",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const EditProfileCandidat()));
            },
          ),

          // My resume
          WidgetMenuProfile(
            leadingIcon: Icon(Icons.article),
            trailingIcon: Icon(Icons.edit_outlined),
            title: "My resume",
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Myresume()));
            },
          ),

          // Applied Jobs
          WidgetMenuProfile(
            leadingIcon: Icon(Icons.business_center_outlined),
            trailingIcon: Icon(Icons.edit_outlined),
            title: "Applied Jobs",
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Appliedjobs()));
            },
          ),

          // Shortlisted Jobs
          WidgetMenuProfile(
            leadingIcon: Icon(Icons.bookmark_border),
            trailingIcon: Icon(Icons.arrow_forward_ios),
            title: "Shortlisted Jobs",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Shortlistedjobs()));
            },
          ),

          //CV Manager
          WidgetMenuProfile(
            leadingIcon: Icon(Icons.article_outlined),
            trailingIcon: Icon(Icons.arrow_forward_ios),
            title: "CV Manager",
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Cvmanager()));
            },
          ),

          // Password
          WidgetMenuProfile(
            leadingIcon: Icon(Icons.lock_outline),
            trailingIcon: Icon(Icons.arrow_forward_ios),
            title: "Change Password",
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Changepassword()));
            },
          ),

          // Language

          ListTile(
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
