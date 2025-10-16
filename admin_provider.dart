import 'package:flutter/foundation.dart';
import '../config/app_config.dart';

class AdminProvider with ChangeNotifier {
  bool _isAdminLoggedIn = false;
  bool _isLoading = false;
  String _errorMessage = '';

  // Getters
  bool get isAdminLoggedIn => _isAdminLoggedIn;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Admin login function
  Future<bool> loginAdmin(String email, String password) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 2));

      // Check credentials against demo admin credentials
      if (email == AppConfig.adminEmail && password == AppConfig.adminPassword) {
        _isAdminLoggedIn = true;
        _errorMessage = '';
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _isAdminLoggedIn = false;
        _errorMessage = 'Invalid email or password';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _isAdminLoggedIn = false;
      _errorMessage = 'Login failed. Please try again.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Admin logout function
  void logoutAdmin() {
    _isAdminLoggedIn = false;
    _errorMessage = '';
    notifyListeners();
  }

  // Clear error message
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }

  // Check if admin session is valid (for auto-login)
  void checkAdminSession() async {
    // Here you can check shared preferences for stored admin session
    // For now, we'll keep it simple
    _isAdminLoggedIn = false;
    notifyListeners();
  }
}