import 'package:flutter/material.dart';

class StoryPlayer extends StatelessWidget {
  const StoryPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white), onPressed: () => Navigator.pop(context)),
        title: const Text("NOW PLAYING", style: TextStyle(color: Colors.grey, fontSize: 10, letterSpacing: 2)),
        centerTitle: true,
        actions: [IconButton(icon: const Icon(Icons.share_outlined, color: Colors.white), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildArtCover(),
            const SizedBox(height: 30),
            const Text("The Legend of Padmini", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
            const Text("Narrated by Kishan Lal", style: TextStyle(color: Colors.tealAccent, fontSize: 16)),
            const SizedBox(height: 20),
            _buildTags(),
            const Spacer(),
            _buildProgressBar(),
            const SizedBox(height: 30),
            _buildControls(),
            const SizedBox(height: 40),
            _buildTranscriptSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildArtCover() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orangeAccent, width: 4),
        image: const DecorationImage(image: NetworkImage('https://via.placeholder.com/300'), fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildTags() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      _tag("RAJASTHAN"),
      const SizedBox(width: 10),
      _tag("MARWARI DIALECT"),
    ]);
  }

  Widget _tag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(15)),
      child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 10)),
    );
  }

  Widget _buildProgressBar() {
    return Column(children: [
      Slider(value: 0.4, onChanged: (v) {}, activeColor: Colors.teal, secondaryActiveColor: Colors.white24),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
        Text("05:42", style: TextStyle(color: Colors.grey, fontSize: 10)),
        Text("-07:03", style: TextStyle(color: Colors.grey, fontSize: 10)),
      ]),
    ]);
  }

  Widget _buildControls() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [
      Icon(Icons.shuffle, color: Colors.white54),
      Icon(Icons.skip_previous, color: Colors.white, size: 40),
      CircleAvatar(radius: 35, backgroundColor: Colors.teal, child: Icon(Icons.pause, color: Colors.white, size: 40)),
      Icon(Icons.skip_next, color: Colors.white, size: 40),
      Icon(Icons.repeat, color: Colors.white54),
    ]);
  }

  Widget _buildTranscriptSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: const BorderRadius.vertical(top: Radius.circular(30))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        Text("AI TRANSCRIPT", style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text("Long ago, in the golden sands of Chittorgarh, there lived a queen...", style: TextStyle(color: Colors.white70)),
      ]),
    );
  }
}