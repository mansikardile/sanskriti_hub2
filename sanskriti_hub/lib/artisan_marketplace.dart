import 'package:flutter/material.dart';

class ArtisanMarketplace extends StatelessWidget {
  const ArtisanMarketplace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF9F3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Color(0xFF1D2939)),
        title: Column(
          children: const [
            Text("ARTISAN MARKETPLACE", 
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1D2939), letterSpacing: 1)),
            Text("SANSKRITI HUB", style: TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
        centerTitle: true,
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              const Icon(Icons.shopping_bag_outlined, color: Color(0xFF007A85), size: 28),
              Positioned(
                top: 12, right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: const Text("1", style: TextStyle(color: Colors.white, fontSize: 8)),
                ),
              )
            ],
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "Discover the hands behind the craft",
                prefixIcon: const Icon(Icons.search, color: Color(0xFF007A85)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _chip("All Crafts", true),
                const SizedBox(width: 10),
                _filterChip("Madhubani"),
                const SizedBox(width: 10),
                _filterChip("Blue Pottery"),
              ],
            ),
            const SizedBox(height: 30),
            _sectionHeader("Handpicked for you"),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 20,
              crossAxisSpacing: 15,
              childAspectRatio: 0.65,
              children: [
                _productCard("Hand-Painted Blue Pottery Vase", "JAIPUR, RAJASTHAN", "₹3,450"),
                _productCard("Tree of Life Madhubani Painting", "MADHUBANI, BIHAR", "₹5,200"),
                _productCard("Pure Pashmina Hand-Woven Shawl", "SRINAGAR, KASHMIR", "₹12,999"),
                _productCard("Bankura Terracotta Horse (Pair)", "BANKURA, WEST BENGAL", "₹1,850"),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF4B3C35),
          borderRadius: BorderRadius.circular(35),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.favorite, color: Colors.white),
            SizedBox(width: 10),
            Text("Support an Artisan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _chip(String label, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF007A85) : Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(label, style: TextStyle(color: selected ? Colors.white : Colors.black, fontWeight: FontWeight.bold)),
    );
  }

  Widget _filterChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          const Icon(Icons.keyboard_arrow_down, size: 18),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const Text("VIEW ALL", style: TextStyle(color: Color(0xFF007A85), fontWeight: FontWeight.bold, fontSize: 12)),
      ],
    );
  }

  Widget _productCard(String title, String location, String price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[200],
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 10, left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                    child: Row(children: const [Icon(Icons.verified, color: Colors.teal, size: 14), Text(" FAIR TRADE", style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold))]),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(backgroundColor: const Color(0xFF007A85), child: Icon(Icons.play_arrow, color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 4),
        Row(children: [const Icon(Icons.location_on, size: 12, color: Colors.teal), Text(" $location", style: const TextStyle(fontSize: 10, color: Colors.teal, fontWeight: FontWeight.bold))]),
        Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }
}