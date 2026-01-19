import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'login_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final SupabaseClient _supabase = Supabase.instance.client;
  bool _isLoading = false;

  // Function to handle Logout
  Future<void> _handleLogout() async {
    setState(() => _isLoading = true);
    try {
      await _supabase.auth.signOut();
      if (mounted) {
        // Clear navigation stack and go to Login
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false,
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Logout failed: $e")),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get current user details from Supabase session
    final user = _supabase.auth.currentUser;
    final String email = user?.email ?? "Not logged in";
    final String fullName = user?.userMetadata?['full_name'] ?? "Guest User";
    final String role = user?.userMetadata?['role'] ?? "Learner";

    return Scaffold(
      backgroundColor: const Color(0xFFFDF9F3),
      appBar: AppBar(
        title: const Text("Artisan Profile", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: _isLoading 
          ? const Center(child: CircularProgressIndicator(color: Color(0xFF007A85)))
          : SingleChildScrollView(
              child: Column(
                children: [
                  _buildProfileHeader(fullName, email, role),
                  const SizedBox(height: 20),
                  _buildProfileOptions(context),
                  const SizedBox(height: 30),
                  _buildLogoutButton(),
                ],
              ),
            ),
    );
  }

  Widget _buildProfileHeader(String name, String email, String role) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const CircleAvatar(
          radius: 55,
          backgroundColor: Color(0xFFEFE5D8),
          backgroundImage: AssetImage('assets/images/artisan_arjun.png'), // Using your AI asset
        ),
        const SizedBox(height: 15),
        Text(name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text(email, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF007A85),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            role.toUpperCase(),
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileOptions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _menuTile(Icons.history, "My Learning History", "View courses & streaks"),
          _menuTile(Icons.shopping_bag_outlined, "My Purchases", "Track orders from Marketplace"),
          _menuTile(Icons.favorite_border, "Saved Traditions", "Stories you loved"),
          _menuTile(Icons.settings_outlined, "Account Settings", "Privacy and security"),
        ],
      ),
    );
  }

  Widget _menuTile(IconData icon, String title, String subtitle) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF007A85)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {},
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        child: TextButton.icon(
          onPressed: _handleLogout,
          icon: const Icon(Icons.logout, color: Colors.red),
          label: const Text("Log Out", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: Colors.red, width: 0.5),
            ),
          ),
        ),
      ),
    );
  }
}