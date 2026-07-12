import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Providers imports
import 'providers/auth_provider.dart';
import 'providers/marketplace_provider.dart';
import 'providers/event_provider.dart';
import 'providers/lost_found_provider.dart';

// Screens imports
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => MarketplaceProvider()),
        ChangeNotifierProvider(create: (_) => EventProvider()),
        ChangeNotifierProvider(create: (_) => LostFoundProvider()),
      ],
      child: MaterialApp(
        title: 'Campus Utility App',
        debugShowCheckedModeBanner: false,
        
        // High-end Dark Theme Configurations following "Rich Aesthetics" guidelines
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF6C63FF),       // Vibrant Indigo/Purple
            secondary: Color(0xFF0F0E17),     // Rich Dark background
            surface: Color(0xFF1F1E26),       // Elevating cards surface background
            background: Color(0xFF0F0E17),
            onPrimary: Colors.white,
            onSecondary: Colors.white,
            onSurface: Colors.white,
            error: Colors.redAccent,
          ),
          
          // Typography and font theme adjustments
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
            bodyLarge: TextStyle(fontSize: 16.0, color: Colors.white70),
            bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white60),
          ),
          
          // Card theme styling
          cardTheme: CardTheme(
            color: const Color(0xFF1F1E26),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          
          // Input field decoration theme styling
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: const Color(0xFF3F3D56).withOpacity(0.2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
            ),
          ),
        ),
        
        // Root widget checks for persisted local storage session token
        home: const SessionCheckGate(),
      ),
    );
  }
}

// Session Gate checks token presence on app bootup
class SessionCheckGate extends StatelessWidget {
  const SessionCheckGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return FutureBuilder<bool>(
      future: authProvider.tryAutoLogin(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display a premium custom splash loader during bootup token checks
          return const Scaffold(
            backgroundColor: Color(0xFF0F0E17),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.school_rounded,
                    size: 80,
                    color: Color(0xFF6C63FF),
                  ),
                  SizedBox(height: 24),
                  CircularProgressIndicator(
                    color: Color(0xFF6C63FF),
                  ),
                ],
              ),
            ),
          );
        } else {
          // If auto login succeeds (token is valid), go to Dashboard; else login screen
          if (snapshot.data == true) {
            return const DashboardScreen();
          } else {
            return const LoginScreen();
          }
        }
      },
    );
  }
}
