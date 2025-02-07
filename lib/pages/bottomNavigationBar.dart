import 'package:black_network/pages/Home/homePage.dart';
import 'package:black_network/pages/Jobs/allJobs.dart';
import 'package:black_network/pages/Profils/CandidatProfile/profilUser.dart';
import 'package:black_network/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:flutter/cupertino.dart';

import 'Dashboard/darhborad.dart';

class MyHomePage extends StatefulWidget {
  final int? selecte;
  const MyHomePage({this.selecte = 0, super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selected = 0;
  final controller = PageController();

  @override
  void initState() {
    selected = widget.selecte ?? 0;  // Initialise l'onglet sélectionné
 // Utiliser addPostFrameCallback pour éviter l'erreur de ScrollController non attaché
  WidgetsBinding.instance.addPostFrameCallback((_) {
    controller.jumpToPage(selected);
  });
  super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        // Récupérer la longueur et largeur de l'ecran
    var screenSize = MediaQuery.of(context).size;
    // var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Scaffold(
      extendBody: true, //to make floating action button notch transparent

      //to avoid the floating action button overlapping behavior,
      // when a soft keyboard is displayed
      // resizeToAvoidBottomInset: false,

      bottomNavigationBar: StylishBottomBar(
        // option: AnimatedBarOptions(
        //   iconSize: 30,
        //   barAnimation: BarAnimation.blink,
        //   iconStyle: IconStyle.animated,

        //   opacity: 0.3,
        // ),
        option: DotBarOptions(
          iconSize: 30,
          dotStyle: DotStyle.tile,
          gradient: LinearGradient(
            colors: [
              lightColorScheme.primary,
              Colors.deepPurple,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        items: [
          BottomBarItem(
            icon: const Icon(
              Icons.house_outlined,
            ),
            selectedIcon: const Icon(Icons.house_rounded),
            selectedColor: lightColorScheme.primary,
            unSelectedColor: Colors.grey,
            title: Text(
              'Accueil',
              style: TextStyle(
                fontSize: screenWidth * 0.0287,
                fontWeight: FontWeight.bold,
              ),
            ),
            // badge: const Text('9+'),
            // showBadge: true,
            // badgeColor: Colors.purple,
            // badgePadding: const EdgeInsets.only(left: 4, right: 4),
          ),
          BottomBarItem(
            icon: const Icon(Icons.star_border_rounded),
            selectedIcon: const Icon(Icons.star_rounded),
            selectedColor: lightColorScheme.primary,
            unSelectedColor: Colors.grey,
            // backgroundColor: Colors.orange,
            title: Text(
              'Jobs',
              style: TextStyle(
                fontSize: screenWidth * 0.0287,
              ),
            ),
          ),
          BottomBarItem(
            icon: const Icon(CupertinoIcons.square_grid_2x2),
            selectedIcon: const Icon(CupertinoIcons.square_grid_2x2_fill),
            selectedColor: lightColorScheme.primary,
            unSelectedColor: Colors.grey,
            // backgroundColor: Colors.orange,
            title: Text(
              'Dashboard',
              style: TextStyle(
                fontSize: screenWidth * 0.0287,
              ),
            ),
          ),
          BottomBarItem(
              icon: const Icon(
                Icons.message_outlined,
              ),
              selectedIcon: const Icon(
                Icons.message,
              ),
              selectedColor: lightColorScheme.primary,
              unSelectedColor: Colors.grey,
              title: Text(
                'Message',
                style: TextStyle(
                  fontSize: screenWidth * 0.0287,
                ),
              )),
          BottomBarItem(
              icon: const Icon(
                Icons.settings_outlined,
              ),
              selectedIcon: const Icon(
                Icons.settings,
              ),
              selectedColor: lightColorScheme.primary,
              unSelectedColor: Colors.grey,
              title: Text('Settings',
                  style: TextStyle(
                    fontSize: screenWidth * 0.0287,
                  ))),
        ],
        // hasNotch: true,
        // fabLocation: StylishBarFabLocation.end,
        currentIndex: selected,
        // notchStyle: NotchStyle.circle,
        onTap: (index) {
          if (index == selected) return;
          controller.jumpToPage(index);
          setState(() {
            selected = index;
          });
        },
      ),
      appBar: AppBar(
        backgroundColor: lightColorScheme.onPrimary,
        // centerTitle: true,
        title: Row(
          children: [
            FlutterLogo(
              size: screenWidth * 0.06,
            ),
            SizedBox(width: screenWidth * 0.02,),
            Text(
              "LOGO",
              style: TextStyle(
                color: lightColorScheme.shadow,
                fontWeight: FontWeight.bold,
              ),
              )
          ],
        ),
        // leading: Drawer(),
        actions: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: lightColorScheme.surface.withOpacity(0.15),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: IconButton(
              icon: Icon(
                Icons.notifications,
                color: lightColorScheme.onPrimary,
                size: screenWidth * 0.06,
              ),
              onPressed: (){},
            ),
          )
        ],
      ),
      
      backgroundColor: lightColorScheme.onPrimary,
      body: SafeArea(
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              selected =
                  index; // Mettre à jour l'index sélectionné lors du changement de page
            });
          },
          children: const [
            Homepage(),
            AllJobs(),
            Darhborad(),
            Center(child: Text('Style')),
            UserProfile(),
          ],
        ),
      ),
    );
  }
}
