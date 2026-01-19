import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isLearner = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _handleSignup() async {
    try {
      await Supabase.instance.client.auth.signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Signup Successful! Check Email.")));
        Navigator.pop(context);
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
            _buildHeader("Join Us", "Empowering the future of Indian Art"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  _buildToggleButtons(),
                  const SizedBox(height: 30),
                  _buildTextField(_emailController, "Enter Email", Icons.email_outlined, false),
                  const SizedBox(height: 15),
                  _buildTextField(_passwordController, "Create Password", Icons.lock_outline, true),
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

  // Use identical UI logic as Login for the header, toggles, and textfields...
  // (Include the _buildHeader, _buildToggleButtons, and _buildTextField methods here)

  Widget _buildHeader(String title, String subtitle) {
     return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 320,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://www.shutterstock.com/shutterstock/photos/2657976007/display_1500/stock-vector-colorful-and-vibrant-pattern-mandala-vintage-ornament-colorful-and-intricate-vector-design-2657976007.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(height: 320, decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, const Color(0xFFFDF9F3)]))),
        Positioned(bottom: 10, child: Column(children: [Text(title, style: GoogleFonts.philosopher(fontSize: 48, fontWeight: FontWeight.bold, color: const Color(0xFF2C3E50))), Text(subtitle, style: GoogleFonts.lato(fontSize: 14, color: Colors.black54))])),
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

  Widget _buildTextField(TextEditingController controller, String hint, IconData icon, bool isPass) {
    return TextField(
      controller: controller,
      obscureText: isPass,
      decoration: InputDecoration(prefixIcon: Icon(icon, color: Colors.brown[300]), hintText: hint, filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none)),
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