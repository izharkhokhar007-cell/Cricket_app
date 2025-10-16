class AppConfig {
  // Cricket API Configuration
  static const String cricketApiKey = '4d235da0-0e26-4feb-b06b-66506748c815';
  static const String cricketApiUrl = 'https://api.cricapi.com/v1/currentMatches';
  
  // Admin Credentials
  static const String adminEmail = 'admin@cricgo.com';
  static const String adminPassword = 'Admin@123';
  
  // App Information
  static const String appName = 'CricGo';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Live Cricket Scores App';
  
  // API Endpoints
  static const String matchesEndpoint = '$cricketApiUrl?apikey=$cricketApiKey';
  static const String matchDetailsEndpoint = 'https://api.cricapi.com/v1/match_info';
  
  // App Settings
  static const int cacheDurationMinutes = 5;
  static const int matchesRefreshInterval = 30; // seconds
  static const bool isDemoMode = true;
  
  // Demo Data (if API fails)
  static Map<String, dynamic> get demoMatch => {
    'id': 'demo_1',
    'name': 'India vs Australia - Demo Match',
    'team1': 'India',
    'team2': 'Australia',
    'score1': '245/3 (40.2)',
    'score2': '180/5 (35.0)',
    'status': 'Live',
    'date': DateTime.now().toIso8601String(),
  };
}