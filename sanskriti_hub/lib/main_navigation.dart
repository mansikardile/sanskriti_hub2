import 'package:flutter/material.dart';
import 'learner_dashboard.dart';
import 'artisan_marketplace.dart';
import 'explore_feed.dart';
import 'profile_page.dart'; // Import the new profile page

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  // Updated list with the functional ProfilePage
  final List<Widget> _pages = [
    const LearnerDashboard(),
    const ExploreFeed(),
    const ArtisanMarketplace(),
    const ProfilePage(), // Replaced the Center text with your Supabase Profile Page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack( // Use IndexedStack to preserve the scroll state of each page
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF007A85),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), activeIcon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), activeIcon: Icon(Icons.shopping_bag), label: 'Market'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}