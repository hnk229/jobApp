import 'package:black_network/pages/Categorie/allCategorie.dart';
import 'package:black_network/pages/Home/widgetJobList.dart';
import 'package:black_network/pages/bottomNavigationBar.dart';
import 'package:black_network/theme/theme.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    //Liste pour les tags
    List<String> tags = [
      'UI UX Designer',
      'Designer',
      'Marketing',
      'Account',
      'Programmer',
      'Restaurant'
    ];
    // Récupérer la longueur et largeur de l'ecran
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.07),
        child: Column(
            children: [
              Container(
                height: screenHeight * 0.06,
                width: screenWidth * 0.85, // La largeur désirée
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Container(
                        width: screenWidth * 0.3,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Ville',
                            fillColor: lightColorScheme.onPrimary,
                            filled: true,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    22)), // Pas de bordure pour le TextFormField
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Poste',
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            fillColor: lightColorScheme.onPrimary,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22)),
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                // Action lors du clic sur le bouton de recherche
                                print('Recherche');
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ), // Contenu centré
              ),
              const SizedBox(height: 3), // Espacement entre les champs
            ],
          ),
      ),
      backgroundColor: lightColorScheme.onPrimary,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Job Categories",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: lightColorScheme.surface),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const AllCategorie();
                      }));
                    },
                    child: Text(
                      "See All >",
                      style: TextStyle(color: lightColorScheme.primary),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              // Grid for Job Categories
              Container(
                child: Wrap(
                  spacing: 6.0, // Espace horizontal entre les tags
                  runSpacing: 2.0, // Espace vertical entre les lignes de tags
                  children: tags.map((tag) {
                    return Chip(
                      label: Text(tag),
                      backgroundColor:
                          lightColorScheme.secondary,// Couleur du tag
                      labelStyle: TextStyle(
                          color:
                              lightColorScheme.primary), // Couleur du texte
                      side: BorderSide.none, // Supprime la bordure
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recents Jobs List",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: lightColorScheme.surface),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage(
                                    selecte: 1,
                                  )));
                    },
                    child: Text(
                      "See All >",
                      style: TextStyle(color: lightColorScheme.primary),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Column(
                children: [
                  jobCard(
                    width: screenWidth * 0.3,
                    companyLogo: Icons.business, // Utiliser une image ou icône
                    companyName: "Amazon",
                    jobTitle: "Customer Service Agent",
                    location: "Miaplaza, New York, USA",
                    jobType: "Full Time",
                    timePosted: "5 min ago",
                    rating: 4.6,
                    salary: "\$60/Hour",
                  ),
                  jobCard(
                    width: screenWidth * 0.3,
                    companyLogo: Icons.business, // Utiliser une image ou icône
                    companyName: "Amazon",
                    jobTitle: "Customer Service Agent",
                    location: "Miaplaza, New York, USA",
                    jobType: "Full Time",
                    timePosted: "5 min ago",
                    rating: 4.6,
                    salary: "\$60/Hour",
                  ),
                  jobCard(
                    width: screenWidth * 0.3,
                    companyLogo: Icons.business, // Utiliser une image ou icône
                    companyName: "Amazon",
                    jobTitle: "Customer Service Agent",
                    location: "Miaplaza, New York, USA",
                    jobType: "Full Time",
                    timePosted: "5 min ago",
                    rating: 4.6,
                    salary: "\$60/Hour",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String, String>> items = [
  {
    'motif': 'Réunion',
    'depart': '23/9/2024 à 15h58',
    'arriver': '23/9/2024 à 17h27',
    'vehicule': '4x4',
    'statut': 'Terminer',
    'lieuD': 'PAC',
    'lieuA': 'Mairie'
  },
  {
    'motif': 'Mission',
    'depart': '23/9/2024 à 14h58',
    'arriver': '23/9/2024 à 17h05',
    'statut': "en cours...",
    'vehicule': '4x4',
    'lieuD': 'PAC',
    'lieuA': 'Calavi'
  },
];
