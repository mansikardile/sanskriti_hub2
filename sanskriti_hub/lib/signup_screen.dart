import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'main_navigation.dart'; // Redirect target

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isLearner = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  Future<void> _handleSignup() async {
    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        data: {
          'full_name': _nameController.text.trim(),
          'role': isLearner ? 'learner' : 'creator',
        },
      );

      if (response.user != null && mounted) {
        // If it's a learner, go to the Learner flow
        if (isLearner) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainNavigation()),
            (route) => false,
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Creator Account Created!")));
          Navigator.pop(context);
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF9F3),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader("Join Us", "Start your journey in Indian Art"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  _buildToggleButtons(),
                  const SizedBox(height: 25),
                  _buildInputField("Full Name", "Your name", Icons.person_outline, false, _nameController),
                  const SizedBox(height: 15),
                  _buildInputField("Email", "e.g. aditi@sanskriti.com", Icons.email_outlined, false, _emailController),
                  const SizedBox(height: 15),
                  _buildInputField("Password", "Create password", Icons.lock_outline, true, _passwordController),
                  const SizedBox(height: 30),
                  _buildSignupButton(),
                  const SizedBox(height: 20),
                  _buildFooter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String title, String subtitle) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 280,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://www.shutterstock.com/shutterstock/photos/2657976007/display_1500/stock-vector-colorful-and-vibrant-pattern-mandala-vintage-ornament-colorful-and-intricate-vector-design-2657976007.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(height: 280, decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Color(0xFFFDF9F3)]))),
        Positioned(bottom: 10, child: Column(children: [Text(title, style: GoogleFonts.philosopher(fontSize: 36, fontWeight: FontWeight.bold, color: const Color(0xFF2C3E50))), Text(subtitle, style: GoogleFonts.lato(fontSize: 14, color: Colors.black54))])),
      ],
    );
  }

  Widget _buildToggleButtons() {
    return Container(
      decoration: BoxDecoration(color: const Color(0xFFEFE5D8), borderRadius: BorderRadius.circular(30)),
      child: Row(children: [
        Expanded(child: _toggleItem("Learner", isLearner)),
        Expanded(child: _toggleItem("Creator", !isLearner)),
      ]),
    );
  }

  Widget _toggleItem(String title, bool active) {
    return GestureDetector(
      onTap: () => setState(() => isLearner = !isLearner),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(color: active ? const Color(0xFFE67E22) : Colors.transparent, borderRadius: BorderRadius.circular(30)),
        child: Center(child: Text(title, style: TextStyle(color: active ? Colors.white : Colors.black54, fontWeight: FontWeight.bold))),
      ),
    );
  }

  Widget _buildInputField(String label, String hint, IconData icon, bool isPass, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isPass,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.brown[300]),
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }

  Widget _buildSignupButton() {
    return SizedBox(
      width: double.infinity, height: 55,
      child: ElevatedButton(
        onPressed: _handleSignup,
        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE67E22), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        child: const Text("Create Account", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account? "),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Text("Login", style: TextStyle(color: Color(0xFFE67E22), fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}