import 'package:flutter/material.dart';

class ArtisanProfile extends StatelessWidget {
  const ArtisanProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF9F3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
        title: const Text("Artisan Profile", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: const [Icon(Icons.share, color: Colors.black), SizedBox(width: 15)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("My Heritage", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text(
                    "I come from a lineage of nine generations of weavers. My craft is not just a skill, but a preservation of my ancestors' soul.",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 25),
                  _buildSupportBar(),
                  const SizedBox(height: 25),
                  _buildImpactScore(),
                  const SizedBox(height: 30),
                  _buildSectionHeader("Curated Work"),
                  _buildCuratedWorkGrid(),
                  const SizedBox(height: 30),
                  _buildCommunityVoices(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(height: 250, color: Colors.grey[300]),
        Positioned(
          bottom: -80,
          child: Container(
            width: 320,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: [
                const CircleAvatar(radius: 50, backgroundImage: NetworkImage('https://via.placeholder.com/100')),
                const SizedBox(height: 10),
                const Text("Arjun Solanki", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const Text("Master Weaver from Kutch, Gujarat", style: TextStyle(color: Color(0xFF007A85))),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: const [Icon(Icons.location_on, size: 14, color: Colors.grey), Text(" Bhuj, India", style: TextStyle(color: Colors.grey))]),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF007A85), shape: StadiumBorder()), child: const Text("Follow", style: TextStyle(color: Colors.white))),
                    const SizedBox(width: 10),
                    Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(border: Border.all(color: Colors.grey[300]!), shape: BoxShape.circle), child: const Icon(Icons.email_outlined, color: Color(0xFF007A85))),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildImpactScore() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFF007A85), borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Impact Score", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              Icon(Icons.auto_graph, color: Colors.white),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _impactBox("12", "FAMILIES SUPPORTED"),
              const SizedBox(width: 15),
              _impactBox("4", "APPRENTICES TRAINED"),
            ],
          ),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [Text("Craft Preservation Goal", style: TextStyle(color: Colors.white70, fontSize: 12)), Text("85%", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))]),
          const SizedBox(height: 8),
          LinearProgressIndicator(value: 0.85, color: Colors.white, backgroundColor: Colors.white24),
        ],
      ),
    );
  }

  Widget _impactBox(String val, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(15)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(val, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)), Text(label, style: const TextStyle(color: Colors.white60, fontSize: 8))]),
      ),
    );
  }

  Widget _buildSupportBar() {
    return Row(
      children: [
        const Text("STARTS FROM\n₹2,499", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const Spacer(),
        ElevatedButton.icon(onPressed: (){}, icon: const Text("Support Creator"), label: const Icon(Icons.arrow_forward), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF007A85), shape: const StadiumBorder())),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), const Text("View All", style: TextStyle(color: Colors.grey))]);
  }

  Widget _buildCuratedWorkGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: List.generate(4, (i) => Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.grey[200]))),
    );
  }

  Widget _buildCommunityVoices() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(children: const [Icon(Icons.star, color: Colors.orange, size: 16), Icon(Icons.star, color: Colors.orange, size: 16), Icon(Icons.star, color: Colors.orange, size: 16), Icon(Icons.star, color: Colors.orange, size: 16), Icon(Icons.star, color: Colors.orange, size: 16)]),
          const SizedBox(height: 10),
          const Text("The quality of the Ajrakh shawl is unmatched. Knowing this purchase helps Arjun's village keep this craft alive makes it even more special."),
          const SizedBox(height: 15),
          Row(children: const [CircleAvatar(radius: 12), SizedBox(width: 8), Text("Elena Kapoor", style: TextStyle(fontWeight: FontWeight.bold)), Spacer(), Icon(Icons.check_circle, color: Colors.green, size: 14), Text(" VERIFIED BUYER", style: TextStyle(color: Colors.green, fontSize: 8))]),
        ],
      ),
    );
  }
}