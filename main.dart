import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cricgo/providers/matches_provider.dart';
import 'package:cricgo/providers/favorites_provider.dart';
import 'package:cricgo/providers/admin_provider.dart';
import 'package:cricgo/screens/home_screen.dart';
import 'package:cricgo/screens/admin_login_screen.dart';

void main() {
  runApp(const CricGoApp());
}

class CricGoApp extends StatelessWidget {
  const CricGoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MatchesProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => AdminProvider()),
      ],
      child: MaterialApp(
        title: 'CricGo',
        theme: ThemeData(
          primarySwatch: Colors.green,
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/admin': (context) => const AdminLoginScreen(),
        },
      ),
    );
  }
}```

---

### **`lib/config/app_config.dart`**

// SAVE: lib/config/app_config.dart
```dart
class AppConfig {
  static const String cricketApiKey = '4d235da0-0e26-4feb-b06b-66506748c815';
  static const String cricketApiUrl = 'https://api.cricapi.com/v1/currentMatches';

  // Demo Admin Credentials
  static const String adminEmail = 'admin@example.com';
  static const String adminPassword = 'Admin@1234';
}