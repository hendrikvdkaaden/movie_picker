import 'package:flutter/material.dart';
import 'package:movie_picker/screens/movie_list_screen.dart';

import 'explore_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Keeps track of the currently selected tab

  // List of pages corresponding to each tab in the BottomNavigationBar
  final List<Widget> _pages = [
    const ExploreScreen(), // Screen showing properties
    const MovieListScreen(), // Screen showing favorite properties
  ];

  // Method to handle tab selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _pages[_selectedIndex], // Display the selected page
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        // Hide selected tab labels
        showUnselectedLabels: false,
        // Hide unselected tab labels
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).highlightColor,
        unselectedItemColor: Theme.of(context).unselectedWidgetColor,
        onTap: _onItemTapped, // Handle tab selection
      ),
    );
  }
}
