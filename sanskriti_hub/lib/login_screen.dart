import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'signup_screen.dart'; 
import 'main_navigation.dart'; // Redirect target

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLearner = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _handleLogin() async {
    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (response.user != null && mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainNavigation()),
        );
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
            _buildHeader("Namaste", "Preserving Heritage, Empowering Artists"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  _buildToggleButtons(),
                  const SizedBox(height: 30),
                  _buildInputLabel("Email or Phone"),
                  _buildTextField(_emailController, "e.g. aditi@sanskriti.com", Icons.person_outline, false),
                  const SizedBox(height: 20),
                  _buildInputLabel("Password", hasForgot: true),
                  _buildTextField(_passwordController, "Your secure password", Icons.lock_outline, true),
                  const SizedBox(height: 30),
                  _buildSignInButton(),
                  const SizedBox(height: 25),
                  const Text("OR CONTINUE WITH", style: TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 20),
                  _buildSocialLogins(),
                  const SizedBox(height: 30),
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
          height: 320,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://www.shutterstock.com/shutterstock/photos/2657976007/display_1500/stock-vector-colorful-and-vibrant-pattern-mandala-vintage-ornament-colorful-and-intricate-vector-design-2657976007.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 320,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Color(0xFFFDF9F3)],
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          child: Column(
            children: [
              Text(title, style: GoogleFonts.philosopher(fontSize: 48, fontWeight: FontWeight.bold, color: const Color(0xFF2C3E50))),
              Text(subtitle, style: GoogleFonts.lato(fontSize: 14, color: Colors.black54)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildToggleButtons() {
    return Container(
      decoration: BoxDecoration(color: const Color(0xFFEFE5D8), borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          Expanded(child: _toggleItem("I am a Learner", isLearner)),
          Expanded(child: _toggleItem("I am a Creator", !isLearner)),
        ],
      ),
    );
  }

  Widget _toggleItem(String title, bool active) {
    return GestureDetector(
      onTap: () => setState(() => isLearner = !isLearner),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(color: active ? const Color(0xFFE67E22) : Colors.transparent, borderRadius: BorderRadius.circular(30)),
        child: Center(child: Text(title, style: TextStyle(color: active ? Colors.white : Colors.black54, fontWeight: FontWeight.bold))),
      ),
    );
  }

  Widget _buildInputLabel(String label, {bool hasForgot = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        if (hasForgot) const Text("Forgot?", style: TextStyle(color: Color(0xFF16A085), fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, IconData icon, bool isPass) {
    return TextField(
      controller: controller,
      obscureText: isPass,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.brown[300]),
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildSignInButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: _handleLogin,
        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE67E22), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        child: const Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildSocialLogins() {
    return Row(children: [
      Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.g_mobiledata), label: const Text("Google"))),
      const SizedBox(width: 15),
      Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.apple), label: const Text("Apple"))),
    ]);
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("New to Sanskriti Hub? "),
        GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen())),
          child: const Text("Create Account", style: TextStyle(color: Color(0xFFE67E22), fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}