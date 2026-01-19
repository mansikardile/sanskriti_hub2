import 'package:flutter/material.dart';

class OralTraditionsPlayer extends StatelessWidget {
  const OralTraditionsPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: const Icon(Icons.expand_more, color: Colors.white), onPressed: () => Navigator.pop(context)),
        title: const Text("ORAL TRADITIONS", style: TextStyle(color: Colors.white, fontSize: 14)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              height: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(image: AssetImage('assets/images/story_padmini.png'), fit: BoxFit.cover),
                border: Border.all(color: Colors.orange.withOpacity(0.5), width: 2),
              ),
            ),
            const SizedBox(height: 30),
            const Text("The Legend of Padmini", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
            const Text("Narrated by Kishan Lal", style: TextStyle(color: Color(0xFF007A85), fontSize: 16)),
            const Spacer(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.shuffle, color: Colors.white54),
                Icon(Icons.skip_previous, color: Colors.white, size: 40),
                CircleAvatar(radius: 35, backgroundColor: Color(0xFF007A85), child: Icon(Icons.pause, color: Colors.white, size: 35)),
                Icon(Icons.skip_next, color: Colors.white, size: 40),
                Icon(Icons.repeat, color: Colors.white54),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}