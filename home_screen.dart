import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/matches_provider.dart';
import '../widgets/match_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MatchesProvider>(context, listen: false).loadMatches();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CricGo - Live Scores'),
        backgroundColor: Colors.green,
      ),
      body: Consumer<MatchesProvider>(
        builder: (context, matchesProvider, child) {
          if (matchesProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (matchesProvider.error.isNotEmpty) {
            return Center(child: Text('Error: ${matchesProvider.error}'));
          }

          return ListView.builder(
            itemCount: matchesProvider.matches.length,
            itemBuilder: (context, index) {
              final match = matchesProvider.matches[index];
              return MatchCard(match: match);
            },
          );
        },
      ),
    );
  }
}