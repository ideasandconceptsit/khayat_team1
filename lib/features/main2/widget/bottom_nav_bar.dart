import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<IconData> _icons = [
    Icons.home,
    Icons.shopping_cart,
    Icons.shopping_bag,
    Icons.favorite,
    Icons.person,
  ];

  final List<String> _titles = [
    "Home",
    "Shop",
    "Cart",
    "Favorites",
    "Profile",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      items: List.generate(_icons.length, (index) {
        return BottomNavigationBarItem(
          icon: Icon(_icons[index]),
          label: _titles[index],
        );
      }),
    );
  }
}
