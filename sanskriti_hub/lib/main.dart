import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'login_screen.dart'; // Ensure this matches your login file name

void main() async {
  // 1. Mandatory for async main functions
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Initialize Supabase (Replace with your actual project details)
  await Supabase.initialize(
    url: 'https://fhqsyimxxozzfynbewtz.supabase.co', 
    anonKey: 'sb_publishable_VWK1wJSp6DcIdZXgHObl5A_VRvlh3Rl',
  );

  // 3. Call the runApp function
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanskriti Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.orange,
      ),
      home: const LoginScreen(), // This points to the code I gave you earlier
    );
  }
}