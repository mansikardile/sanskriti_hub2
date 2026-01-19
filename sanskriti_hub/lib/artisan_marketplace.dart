import 'package:flutter/material.dart';

class ArtisanMarketplace extends StatelessWidget {
  const ArtisanMarketplace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("ARTISAN MARKETPLACE", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Discover the hands behind the craft",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 20),
            _buildFilterTabs(),
            const SizedBox(height: 20),
            _buildGridHeader(),
            const SizedBox(height: 15),
            _buildProductGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        _filterChip("All Crafts", isSelected: true),
        _filterChip("Madhubani"),
        _filterChip("Blue Pottery"),
        _filterChip("Pashmina"),
      ]),
    );
  }

  Widget _filterChip(String label, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.teal : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.teal.withOpacity(0.1)),
      ),
      child: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
    );
  }

  Widget _buildGridHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text("Handpicked for you", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text("VIEW ALL", style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold, fontSize: 12)),
      ],
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return _productCard();
      },
    );
  }

  Widget _productCard() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.grey[300]),
          child: const Stack(children: [
            Positioned(top: 10, right: 10, child: Icon(Icons.verified, color: Colors.teal, size: 20)),
          ]),
        ),
      ),
      const SizedBox(height: 8),
      const Text("Blue Pottery Vase", style: TextStyle(fontWeight: FontWeight.bold)),
      const Text("Jaipur, Rajasthan", style: TextStyle(fontSize: 10, color: Colors.grey)),
      const Text("₹3,450", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal)),
    ]);
  }
}