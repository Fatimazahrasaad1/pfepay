import 'package:flutter/material.dart';
import 'package:mkadia/views/cart/cart.dart';
import 'package:mkadia/views/home/HomeView.dart';
import 'package:mkadia/views/profil/profil.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  // Liste des vues
  late List<Widget> views;

  @override
  void initState() {
    super.initState();
    // Initialisation de la liste des vues
    views = [
      const HomeView(),
      const Cart(),
      const ProfilPage(), // Suppression de 'user' et récupération via Provider
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          if (index == 1) { // Index de Cart
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Cart(),
              ),
            );
          } else {
            setState(() {
              currentIndex = index;
            });
          }
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body: views[currentIndex], // Affiche la vue en fonction de l'index
    );
  }
}
