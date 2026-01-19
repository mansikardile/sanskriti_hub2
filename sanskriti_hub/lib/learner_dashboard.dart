import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              const SizedBox(height: 10),
              _buildHeader(),
              const SizedBox(height: 30),
              _buildSectionHeader("My Courses", "View All"),
              const SizedBox(height: 15),
              _buildCourseGrid(),
              const SizedBox(height: 30),
              _buildAIFeedbackCard(),
              const SizedBox(height: 30),
              const Text("Upcoming Masterclasses", 
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1D2939))),
              const SizedBox(height: 15),
              _buildMasterclassCard(
                "Pt. Birju's Disciples: Abhinaya Deep Dive", 
                "Master the art of facial expressions.",
                "LIVE IN 2H",
                true
              ),
              const SizedBox(height: 15),
              _buildMasterclassCard(
                "The Art of Meend with Ustad Zakir", 
                "Gliding techniques for advanced Sitar players.",
                "TOMORROW",
                false
              ),
              const SizedBox(height: 25),
              _buildAIActionButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundColor: Color(0xFFEFE5D8),
          child: Icon(Icons.person, color: Colors.brown),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("NAMASTE, ANANYA", 
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF667085))),
            Row(
              children: [
                const Icon(Icons.local_fire_department, color: Color(0xFF007A85), size: 18),
                Text(" 12 Day Riaz Streak", 
                  style: GoogleFonts.lato(fontWeight: FontWeight.bold, color: const Color(0xFF1D2939))),
              ],
            ),
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: const Icon(Icons.notifications_none, color: Color(0xFF1D2939)),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1D2939))),
        Text(action, style: const TextStyle(color: Color(0xFF007A85), fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildCourseGrid() {
    return Row(
      children: [
        _courseCard("Kathak Level 1: Tatkar Basics", "DANCE", "65%", const Color(0xFF007A85)),
        const SizedBox(width: 15),
        _courseCard("Sitar Basics: Raag Bilaval", "MUSIC", "20%", const Color(0xFF007A85)),
      ],
    );
  }

  Widget _courseCard(String title, String tag, String progress, Color color) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[300],
              image: const DecorationImage(
                image: NetworkImage('https://via.placeholder.com/150'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 12, left: 12, right: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: const Color(0xFFD48F52), borderRadius: BorderRadius.circular(4)),
                        child: Text(tag, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 8),
                      Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text("Progress", style: TextStyle(fontSize: 10, color: Color(0xFF667085))),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: 0.65,
                    color: color,
                    backgroundColor: color.withOpacity(0.1),
                    minHeight: 6,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(progress, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: color)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAIFeedbackCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF2F2),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(color: Color(0xFFB9D1D3), shape: BoxShape.circle),
            child: const Icon(Icons.analytics_outlined, color: Color(0xFF007A85)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("LAST AI FEEDBACK", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF007A85))),
                const Text("85% Rhythm Accuracy", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("Focus on 'Teental' transitions", style: GoogleFonts.lato(fontSize: 12, color: const Color(0xFF667085))),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Color(0xFF667085)),
        ],
      ),
    );
  }

  Widget _buildMasterclassCard(String title, String sub, String time, bool isLive) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF2F4F7)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60, height: 60,
                decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    Text(sub, style: const TextStyle(fontSize: 12, color: Color(0xFF667085))),
                  ],
                ),
              ),
              Text(time, style: TextStyle(color: isLive ? Colors.red : Colors.grey, fontWeight: FontWeight.bold, fontSize: 10)),
            ],
          ),
          if (isLive) ...[
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007A85),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Join Now", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ] else ...[
             const SizedBox(height: 16),
             SizedBox(
              width: double.infinity,
              height: 44,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFD0D5DD)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Set Reminder", style: TextStyle(color: Color(0xFF007A85), fontWeight: FontWeight.bold)),
              ),
            ),
          ]
        ],
      ),
    );
  }

  Widget _buildAIActionButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF007A85),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: const Color(0xFF007A85).withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.auto_awesome, color: Colors.white, size: 20),
          SizedBox(width: 10),
          Text("Upload Practice for AI Feedback", 
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }
}