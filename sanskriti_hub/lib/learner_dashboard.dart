import 'package:flutter/material.dart';

class LearnerDashboard extends StatelessWidget {
  const LearnerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7F2),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 25),
              const Text("My Courses", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              _buildCourseGrid(),
              const SizedBox(height: 25),
              _buildAIFeedbackSection(),
              const SizedBox(height: 25),
              const Text("Upcoming Masterclasses", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              _buildMasterclassCard("Pt. Birju's Disciples", "LIVE IN 2H"),
              const SizedBox(height: 30),
              _buildActionButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          const CircleAvatar(backgroundImage: NetworkImage('https://via.placeholder.com/150')),
          const SizedBox(width: 10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("NAMASTE, ANANYA", style: TextStyle(color: Colors.grey, fontSize: 12)),
            Row(children: const [
              Icon(Icons.local_fire_department, color: Colors.teal, size: 16),
              Text(" 12 Day Riaz Streak", style: TextStyle(fontWeight: FontWeight.bold)),
            ]),
          ]),
        ]),
        const CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.notifications_none, color: Colors.black)),
      ],
    );
  }

  Widget _buildCourseGrid() {
    return Row(
      children: [
        _courseCard("Kathak Level 1", "DANCE", "65%", Colors.redAccent),
        const SizedBox(width: 15),
        _courseCard("Sitar Basics", "MUSIC", "20%", Colors.orangeAccent),
      ],
    );
  }

  Widget _courseCard(String title, String tag, String progress, Color color) {
    return Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 180,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: color.withOpacity(0.2)),
          child: Center(child: Text(tag, style: const TextStyle(fontWeight: FontWeight.bold))),
        ),
        const SizedBox(height: 10),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        LinearProgressIndicator(value: 0.6, color: Colors.teal, backgroundColor: Colors.teal.withOpacity(0.1)),
        Text("Progress $progress", style: const TextStyle(fontSize: 10, color: Colors.grey)),
      ]),
    );
  }

  Widget _buildAIFeedbackSection() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: const Color(0xFFEDF2F2), borderRadius: BorderRadius.circular(20)),
      child: Row(children: [
        const Icon(Icons.analytics_outlined, color: Colors.teal, size: 40),
        const SizedBox(width: 15),
        const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("LAST AI FEEDBACK", style: TextStyle(fontSize: 10, color: Colors.teal, fontWeight: FontWeight.bold)),
          Text("85% Rhythm Accuracy", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text("Focus on 'Teental' transitions", style: TextStyle(color: Colors.grey, fontSize: 12)),
        ]),
        const Spacer(),
        const Icon(Icons.chevron_right, color: Colors.grey),
      ]),
    );
  }

  Widget _buildMasterclassCard(String title, String time) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(children: [
        Row(children: [
          Container(width: 50, height: 50, decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(10))),
          const SizedBox(width: 15),
          Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold))),
          Text(time, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 10)),
        ]),
        const SizedBox(height: 15),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, shape: StadiumBorder()), child: const Text("Join Now", style: TextStyle(color: Colors.white))),
        )
      ]),
    );
  }

  Widget _buildActionButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.teal, borderRadius: BorderRadius.circular(15)),
      child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.auto_awesome, color: Colors.white),
        SizedBox(width: 10),
        Text("Upload Practice for AI Feedback", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ]),
    );
  }
}