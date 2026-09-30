import 'package:flutter/material.dart';

import 'pages/portfolio_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const DeveloperPortfolioApp());
}

class DeveloperPortfolioApp extends StatelessWidget {
  const DeveloperPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elia Mgeu Anyimike Sody | Flutter Developer',

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      home: const PortfolioPage(),
    );
  }
}
