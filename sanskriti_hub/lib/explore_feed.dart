import 'package:flutter/material.dart';
import 'artisan_marketplace.dart';
import 'oral_traditions_player.dart';
import 'artisan_profile.dart';

class ExploreFeed extends StatefulWidget {
  const ExploreFeed({super.key});

  @override
  State<ExploreFeed> createState() => _ExploreFeedState();
}

class _ExploreFeedState extends State<ExploreFeed> {
  // 1. Logic for Category Switching
  String activeCategory = "Crafts";

  void _onCategoryTap(String category) {
    setState(() {
      activeCategory = category;
    });
    // Optional: Redirect to specialized screens based on category
    if (category == "Crafts") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const ArtisanMarketplace()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF9F3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFF007A85)),
          onPressed: () { /* Open Drawer logic */ },
        ),
        title: const Text("Sanskriti Hub", 
          style: TextStyle(color: Color(0xFF007A85), fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 2. Search Bar Functionality
            TextField(
              onSubmitted: (value) { /* Implement Search Logic */ },
              decoration: InputDecoration(
                hintText: "Search crafts, stories, or performers",
                prefixIcon: const Icon(Icons.search, color: Color(0xFF007A85)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15), 
                  borderSide: BorderSide.none
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // 3. Category Buttons (Crafts, Stories, Learn)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
              children: [
                _categoryBtn(Icons.palette, "Crafts"),
                _categoryBtn(Icons.menu_book, "Stories"),
                _categoryBtn(Icons.school, "Learn"),
              ]
            ),
            const SizedBox(height: 25),
            
            // 4. Spotlight Banner Button
            _buildSpotlight(),
            const SizedBox(height: 30),
            
            // 5. Trending Stories (Navigate to Player)
            _sectionHeader("Trending Stories", () {}),
            _buildTrendingRow(),
            const SizedBox(height: 30),
            
            // 6. Featured Artisans (Navigate to Profile)
            _sectionHeader("Featured Artisans", () {}),
            _buildArtisanRow(),
            const SizedBox(height: 30),
            
            // 7. Masterclass Button
            _buildMasterClassBanner(),
          ],
        ),
      ),
    );
  }

  Widget _categoryBtn(IconData icon, String label) {
    bool isActive = activeCategory == label;
    return GestureDetector(
      onTap: () => _onCategoryTap(label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF007A85) : Colors.white, 
          borderRadius: BorderRadius.circular(15),
          boxShadow: [if(!isActive) BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)]
        ),
        child: Row(
          children: [
            Icon(icon, color: isActive ? Colors.white : Colors.black, size: 18),
            Text(" $label", 
              style: TextStyle(color: isActive ? Colors.white : Colors.black, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildSpotlight() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: const DecorationImage(
          image: AssetImage('assets/images/mandala_header.png'), // Using your generated asset
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black.withOpacity(0.1), Colors.black.withOpacity(0.7)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              color: const Color(0xFFD48F52),
              child: const Text("SPOTLIGHT OF THE DAY", 
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10)),
            ),
            const SizedBox(height: 60),
            const Text("The Weaver's Song:\nDiscover Maheshwari Silk", 
              style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ArtisanMarketplace()));
              }, 
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: const Text("Explore Tradition →", style: TextStyle(color: Color(0xFF007A85))),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title, VoidCallback onSeeAll) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, 
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: onSeeAll,
          child: const Text("SEE ALL", style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold))
        ),
      ]
    );
  }

  Widget _buildTrendingRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _storyCard("The Legend of the Sun Temple", "Oral tradition • 8 mins", 'assets/images/story_padmini.png'),
          _storyCard("Whispers of the Thar", "Folk tales • 12 mins", 'assets/images/mandala_header.png'),
        ],
      ),
    );
  }

  Widget _storyCard(String title, String info, String imgPath) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const OralTraditionsPlayer())),
      child: Container(
        width: 220, 
        margin: const EdgeInsets.only(top: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(imgPath, height: 140, width: 220, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            Text(info, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ]
        ),
      ),
    );
  }

  Widget _buildArtisanRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          _artisanProfileCard("Meera Bai", "ZARDOSI EXPERT"),
          const SizedBox(width: 15),
          _artisanProfileCard("Rajesh Kumar", "PATTACHITRA ARTIST"),
        ],
      ),
    );
  }

  Widget _artisanProfileCard(String name, String job) {
    return Expanded(
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ArtisanProfile())),
        child: Container(
          padding: const EdgeInsets.all(15), 
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]
          ),
          child: Column(
            children: [
              const Stack(
                children: [
                  CircleAvatar(radius: 35, backgroundImage: AssetImage('assets/images/artisan_arjun.png')),
                  Positioned(bottom: 0, right: 0, child: Icon(Icons.stars, color: Color(0xFFD48F52), size: 20)),
                ]
              ),
              const SizedBox(height: 10),
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(job, textAlign: TextAlign.center, 
                style: const TextStyle(color: Color(0xFFD48F52), fontSize: 9, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMasterClassBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25), 
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C), 
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: const AssetImage('assets/images/course_kathak.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.darken)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          const Text("Master the Craft", 
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const Text("Join our live masterclasses with national award-winning artisans.", 
            style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {}, 
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF007A85)), 
            child: const Text("View Workshops", style: TextStyle(color: Colors.white))
          ),
        ]
      ),
    );
  }
}