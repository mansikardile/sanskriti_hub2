import 'package:flutter/material.dart';

class OralTraditionsPlayer extends StatelessWidget {
  const OralTraditionsPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF007A85)),
        title: Column(
          children: const [
            Text("NOW PLAYING", style: TextStyle(fontSize: 10, color: Colors.grey, letterSpacing: 2)),
            Text("Oral Traditions", style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
        centerTitle: true,
        actions: const [Icon(Icons.share_outlined, color: Colors.white), SizedBox(width: 15)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              height: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: NetworkImage('https://via.placeholder.com/400'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(color: Colors.orange.withOpacity(0.5), width: 2),
              ),
            ),
            const SizedBox(height: 30),
            const Text("The Legend of Padmini", 
              style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
            const Text("Narrated by Kishan Lal", 
              style: TextStyle(color: Color(0xFF007A85), fontSize: 18)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _tag("RAJASTHAN"),
                const SizedBox(width: 10),
                _tag("MARWARI DIALECT"),
                const SizedBox(width: 10),
                _tag("12:45"),
              ],
            ),
            const SizedBox(height: 40),
            _progressBar(),
            const SizedBox(height: 40),
            _controls(),
            const Spacer(),
            _buildTranscript(),
          ],
        ),
      ),
    );
  }

  Widget _tag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(15)),
      child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }

  Widget _progressBar() {
    return Column(
      children: [
        Stack(
          children: [
            Container(height: 4, decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(2))),
            Container(width: 150, height: 4, decoration: BoxDecoration(color: const Color(0xFF007A85), borderRadius: BorderRadius.circular(2))),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("05:42", style: TextStyle(color: Colors.grey, fontSize: 12)),
            Text("-07:03", style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ],
    );
  }

  Widget _controls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Icon(Icons.shuffle, color: Colors.white54),
        const Icon(Icons.skip_previous, color: Colors.white, size: 40),
        CircleAvatar(radius: 40, backgroundColor: const Color(0xFF007A85), child: Icon(Icons.pause, color: Colors.white, size: 40)),
        const Icon(Icons.skip_next, color: Colors.white, size: 40),
        const Icon(Icons.repeat, color: Colors.white54),
      ],
    );
  }

  Widget _buildTranscript() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("AI TRANSCRIPT", style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
              Row(children: [const Text("Translation ", style: TextStyle(color: Colors.grey, fontSize: 10)), Switch(value: true, onChanged: (v){}, activeColor: const Color(0xFF007A85))])
            ],
          ),
          const Text("Long ago, in the golden sands of Chittorgarh, there lived a queen...", 
            style: TextStyle(color: Colors.white38, fontSize: 18)),
          const SizedBox(height: 10),
          const Text("Her beauty was not just of the face, but of a spirit that...", 
            style: TextStyle(color: Color(0xFF007A85), fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}