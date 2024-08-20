import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase core
import 'auth/auth_service.dart';
import 'chat/chat_screen.dart';
import 'auth/login_screen.dart';
import 'auth/signup_screen.dart';
import 'auth/auth_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp()); // Run the app
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        // Add other providers if needed
      ],
      child: MaterialApp(
        title: 'Chat App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AuthWrapper(),
        routes: {
          '/login_screen': (context) => LoginScreen(),
          '/signup_screen': (context) => SignupScreen(),
          '/chat_screen': (context) => ChatScreen(),
          // Add other routes if needed
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(title: Text('Unknown Route')),
              body: Center(child: Text('Unknown route')),
            ),
          );
        },
      ),
    );
  }
}
