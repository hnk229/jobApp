import 'package:flutter/material.dart';
import '../../theme/theme.dart';
import 'categorieContainer.dart';

class AllCategorie extends StatefulWidget {
  const AllCategorie({super.key});

  @override
  State<AllCategorie> createState() => _AllCategorieState();
}

class _AllCategorieState extends State<AllCategorie> {
  @override
  Widget build(BuildContext context) {
    // Récupérer la longueur et largeur de l'ecran
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
          size: screenWidth * 0.06,
        ),
        centerTitle: true,
        backgroundColor: lightColorScheme.primary,
        title: const Text(
          "Catégories",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: lightColorScheme.onPrimary,
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.01, horizontal: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Catégories",
              style: TextStyle(
                color: lightColorScheme.surface,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // 2 colonnes
                crossAxisSpacing: 16, // Espacement entre les colonnes
                mainAxisSpacing: 16, // Espacement entre les lignes
                children: [
                  categoryCard('Designer', '420 Jobs', Icons.category,
                      lightColorScheme.primary),
                  categoryCard('Education', '50 Jobs', Icons.category,
                      lightColorScheme.primary),
                  categoryCard('Restaurant', '120 Jobs', Icons.category,
                      lightColorScheme.primary),
                  categoryCard('Health', '160 Jobs', Icons.category,
                      lightColorScheme.primary),
                  categoryCard('Programmer', '40 Jobs', Icons.category,
                      lightColorScheme.primary),
                  categoryCard('Finance', '10 Jobs', Icons.category,
                      lightColorScheme.primary),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
