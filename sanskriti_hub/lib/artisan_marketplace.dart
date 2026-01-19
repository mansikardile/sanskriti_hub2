import 'package:flutter/material.dart';
import 'artisan_profile.dart';

class ArtisanMarketplace extends StatefulWidget {
  const ArtisanMarketplace({super.key});

  @override
  State<ArtisanMarketplace> createState() => _ArtisanMarketplaceState();
}

class _ArtisanMarketplaceState extends State<ArtisanMarketplace> {
  String selectedCategory = "All Crafts";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF9F3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.menu, color: Color(0xFF1D2939)), onPressed: () {}),
        title: Column(
          children: const [
            Text("ARTISAN MARKETPLACE", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF1D2939))),
            Text("SANSKRITI HUB", style: TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Color(0xFF007A85)),
            onPressed: () { /* Navigate to Cart */ },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _filterChip("All Crafts"),
                  _filterChip("Madhubani"),
                  _filterChip("Blue Pottery"),
                  _filterChip("Pashmina"),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Handpicked for you", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {}, child: const Text("VIEW ALL", style: TextStyle(color: Color(0xFF007A85), fontSize: 12))),
              ],
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 20,
              crossAxisSpacing: 15,
              childAspectRatio: 0.65,
              children: [
                _productCard("Hand-Painted Vase", "JAIPUR", "₹3,450", 'assets/images/product_vase.png'),
                _productCard("Tree of Life Painting", "BIHAR", "₹5,200", 'assets/images/product_painting.png'),
              ],
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ArtisanProfile())),
        backgroundColor: const Color(0xFF4B3C35),
        label: const Text("Support an Artisan", style: TextStyle(color: Colors.white)),
        icon: const Icon(Icons.favorite, color: Colors.white),
      ),
    );
  }

  Widget _filterChip(String label) {
    bool isSelected = selectedCategory == label;
    return GestureDetector(
      onTap: () => setState(() => selectedCategory = label),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF007A85) : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: isSelected ? Colors.transparent : Colors.grey[300]!),
        ),
        child: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _productCard(String title, String loc, String price, String img) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ArtisanProfile())),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(img, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(loc, style: const TextStyle(color: Color(0xFF007A85), fontSize: 10, fontWeight: FontWeight.bold)),
          Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }
}