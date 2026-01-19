import 'package:flutter/material.dart';
import 'oral_traditions_player.dart';

class LearnerDashboard extends StatelessWidget {
  const LearnerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF9F3),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildHeader(),
              const SizedBox(height: 30),
              const Text("My Courses", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              Row(
                children: [
                  _courseCard(context, "Kathak Level 1", "DANCE", "65%", "course_kathak.png"),
                  const SizedBox(width: 15),
                  _courseCard(context, "Sitar Basics", "MUSIC", "20%", "course_sitar.png"),
                ],
              ),
              const SizedBox(height: 30),
              _buildAIFeedbackCard(),
              const SizedBox(height: 30),
              const Text("Upcoming Masterclasses", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              _masterclassTile("Pt. Birju's Disciples", "LIVE IN 2H", true),
              _masterclassTile("The Art of Meend", "TOMORROW", false),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const CircleAvatar(radius: 25, backgroundImage: AssetImage('assets/images/artisan_arjun.png')),
        const SizedBox(width: 12),
        const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("NAMASTE, ANANYA", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
          Text("12 Day Riaz Streak", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF007A85))),
        ]),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
      ],
    );
  }

  Widget _courseCard(BuildContext context, String title, String tag, String progress, String img) {
    return Expanded(
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const OralTraditionsPlayer())),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: AssetImage('assets/images/$img'), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            LinearProgressIndicator(value: 0.6, color: const Color(0xFF007A85), backgroundColor: Colors.teal.withOpacity(0.1)),
          ],
        ),
      ),
    );
  }

  Widget _buildAIFeedbackCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFFEEF2F2), borderRadius: BorderRadius.circular(20)),
      child: const Row(children: [
        Icon(Icons.analytics, color: Color(0xFF007A85), size: 40),
        SizedBox(width: 15),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("85% Rhythm Accuracy", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text("Focus on 'Teental' transitions", style: TextStyle(color: Colors.grey)),
        ]),
      ]),
    );
  }

  Widget _masterclassTile(String title, String time, bool isLive) {
    return Card(
      margin: const EdgeInsets.only(top: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: Text(time, style: TextStyle(color: isLive ? Colors.red : Colors.grey, fontWeight: FontWeight.bold)),
      ),
    );
  }
}