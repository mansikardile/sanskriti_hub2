import 'package:flutter/material.dart';

class ExploreFeed extends StatelessWidget {
  const ExploreFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF9F3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu, color: Color(0xFF007A85)),
        title: const Text("Sanskriti Hub", style: TextStyle(color: Color(0xFF007A85), fontWeight: FontWeight.bold)),
        actions: const [Icon(Icons.notifications, color: Colors.black), SizedBox(width: 15)],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
             TextField(
              decoration: InputDecoration(
                hintText: "Search crafts, stories, or performers",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              _categoryBtn(Icons.palette, "Crafts", true),
              _categoryBtn(Icons.menu_book, "Stories", false),
              _categoryBtn(Icons.school, "Learn", false),
            ]),
            const SizedBox(height: 25),
            _buildSpotlight(),
            const SizedBox(height: 30),
            _sectionHeader("Trending Stories"),
            _buildTrendingRow(),
            const SizedBox(height: 30),
            _sectionHeader("Featured Artisans"),
            _buildArtisanRow(),
            const SizedBox(height: 30),
            _buildMasterClassBanner(),
          ],
        ),
      ),
    );
  }

  Widget _categoryBtn(IconData icon, String label, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(color: active ? const Color(0xFF007A85) : Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(children: [Icon(icon, color: active ? Colors.white : Colors.black), Text(" $label", style: TextStyle(color: active ? Colors.white : Colors.black, fontWeight: FontWeight.bold))]),
    );
  }

  Widget _buildSpotlight() {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.grey[300]),
      child: Stack(
        children: [
          Positioned(top: 20, left: 20, child: Container(padding: const EdgeInsets.all(8), color: Colors.orange, child: const Text("SPOTLIGHT OF THE DAY", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10)))),
          Positioned(bottom: 30, left: 20, right: 20, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("The Weaver's Song:\nDiscover Maheshwari Silk", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("An ancient art form from the banks of the Narmada...", style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 15),
            ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.teal), child: const Text("Explore Tradition →")),
          ]))
        ],
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), const Text("SEE ALL", style: TextStyle(color: Colors.grey, fontSize: 10))]);
  }

  Widget _buildTrendingRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        _storyCard("The Legend of the Sun Temple", "Oral tradition • 8 mins"),
        _storyCard("Whispers of the Thar", "Folk tales • 12 mins"),
      ]),
    );
  }

  Widget _storyCard(String title, String info) {
    return Container(
      width: 250, margin: const EdgeInsets.only(top: 15, right: 15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(height: 150, decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(20))),
        const SizedBox(height: 10),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(info, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ]),
    );
  }

  Widget _buildArtisanRow() {
    return Row(children: [
       _artisanCircle("Meera Bai", "ZARDOSI EXPERT"),
       const SizedBox(width: 20),
       _artisanCircle("Rajesh Kumar", "PATTACHITRA ARTIST"),
    ]);
  }

  Widget _artisanCircle(String name, String job) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(children: [
          const Stack(children: [CircleAvatar(radius: 40), Positioned(bottom: 0, right: 0, child: Icon(Icons.star, color: Colors.orange))]),
          const SizedBox(height: 10),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(job, style: const TextStyle(color: Colors.orange, fontSize: 8, fontWeight: FontWeight.bold)),
        ]),
      ),
    );
  }

  Widget _buildMasterClassBanner() {
    return Container(
      padding: const EdgeInsets.all(25), decoration: BoxDecoration(color: const Color(0xFF2C2C2C), borderRadius: BorderRadius.circular(25)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text("Master the Craft", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        const Text("Join our live masterclasses with national award-winning artisans.", style: TextStyle(color: Colors.white70)),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF007A85)), child: const Text("View Workshops", style: TextStyle(color: Colors.white))),
      ]),
    );
  }
}