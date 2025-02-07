import 'package:black_network/pages/Home/widgetJobList.dart';
import 'package:black_network/theme/theme.dart';
import 'package:flutter/material.dart';

class AllJobs extends StatefulWidget {
  const AllJobs({super.key});

  @override
  State<AllJobs> createState() => _AllJobsState();
}

class _AllJobsState extends State<AllJobs> {
  @override
  Widget build(BuildContext context) {
    // Récupérer la longueur et largeur de l'écran
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
      body: Column(
        children: [
          // La ligne du titre reste fixe
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.02,
            ),
            child: Row(
              children: [
                Text(
                  "UI UX Designer",
                  style: TextStyle(
                    color: lightColorScheme.surface,
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  "(258 Jobs)",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          // Contenu scrollable
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  children: [
                    // Liste des jobs
                    jobCard(
                      width: screenWidth * 0.3,
                      companyLogo: Icons.business,
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
                      companyLogo: Icons.business,
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
                      companyLogo: Icons.business,
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
                      companyLogo: Icons.business,
                      companyName: "Amazon",
                      jobTitle: "Customer Service Agent",
                      location: "Miaplaza, New York, USA",
                      jobType: "Full Time",
                      timePosted: "5 min ago",
                      rating: 4.6,
                      salary: "\$60/Hour",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
