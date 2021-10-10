import 'package:booksynation/loading.dart';
import 'package:booksynation/splash.dart';
import 'package:booksynation/web_pages/weblogin.dart';
import 'package:flutter/foundation.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return AlertDialog(
        title: const Text('Encountered Error!'),
      );
    }
    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return MaterialApp(home: Loading());
    }
    if (kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android)) {
      return MaterialApp(home: SplashScreen());
    } else if (kIsWeb) {
      return MaterialApp(home: WebLogin());
    } else {
      return MaterialApp(home: SplashScreen());
    }
  }
}
