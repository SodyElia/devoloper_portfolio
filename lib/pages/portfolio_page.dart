import 'package:flutter/material.dart';

import '../widgets/navbar.dart';
import '../widgets/project_card.dart';
import '../widgets/service_card.dart';
import 'about_page.dart';
import 'contact_page.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _homeKey = GlobalKey();
  final _servicesKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final targetContext = key.currentContext;
    if (targetContext == null) return;

    Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBar(
              onHome: () => _scrollTo(_homeKey),
              onAbout: () => _scrollTo(_aboutKey),
              onProjects: () => _scrollTo(_projectsKey),
              onServices: () => _scrollTo(_servicesKey),
              onContact: () => _scrollTo(_contactKey),
            ),
            Container(
              key: _homeKey,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 64,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final compact = constraints.maxWidth < 800;
                      final intro = Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'FLUTTER DEVELOPER',
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Apps that help businesses grow.',
                            style: theme.textTheme.displayLarge,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'I build mobile and web apps that make everyday '
                            'business work simpler, from managing products '
                            'and sales to understanding performance.',
                            style: theme.textTheme.bodyLarge,
                          ),
                          const SizedBox(height: 28),
                          Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () => _scrollTo(_projectsKey),
                                icon: const Icon(Icons.work_outline),
                                label: const Text('View projects'),
                              ),
                              OutlinedButton.icon(
                                onPressed: () => _scrollTo(_contactKey),
                                icon: const Icon(Icons.mail_outline),
                                label: const Text('Contact me'),
                              ),
                            ],
                          ),
                        ],
                      );

                      final preview = ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          'assets/images/dashboard.jpg',
                          height: 360,
                          width: double.infinity,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 360,
                              color: theme.colorScheme.primaryContainer,
                              child: Icon(
                                Icons.code,
                                size: 120,
                                color: theme.colorScheme.primary,
                              ),
                            );
                          },
                        ),
                      );

                      if (compact) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            intro,
                            const SizedBox(height: 36),
                            preview,
                          ],
                        );
                      }

                      return Row(
                        children: [
                          Expanded(child: intro),
                          const SizedBox(width: 48),
                          Expanded(child: preview),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(
              key: _servicesKey,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 72,
              ),
              color: theme.colorScheme.surfaceContainerHighest,
              child: Column(
                children: [
                  Text('WHAT I DO',
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(height: 12),
                  Text(
                    'Services I Offer',
                    style: theme.textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 36),
                  const Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      ServiceCard(
                        icon: Icons.phone_android,
                        title: 'Mobile App Development',
                        description:
                            'Cross-platform Android and iOS apps built '
                            'with Flutter.',
                      ),
                      ServiceCard(
                        icon: Icons.web,
                        title: 'Web Development',
                        description:
                            'Responsive websites and web applications '
                            'for businesses.',
                      ),
                      ServiceCard(
                        icon: Icons.cloud_outlined,
                        title: 'Firebase Integration',
                        description:
                            'Authentication, cloud databases and backend '
                            'services.',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              key: _projectsKey,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 72,
              ),
              child: Column(
                children: [
                  Text('SELECTED WORK',
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(height: 12),
                  Text(
                    'Projects I Have Built',
                    style: theme.textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  ProjectCard(
                    title: 'Biashara',
                    description:
                        'A business management app that brings products, '
                        'sales, customers, expenses and reports into one '
                        'workflow.',
                    technologies: [
                      'Flutter',
                      'Dart',
                      'Firebase',
                      'Cloud Firestore',
                    ],
                    icon: Icons.storefront,
                    imageAssets: [
                      'assets/images/dashboard.jpg',
                      'assets/images/products.jpg',
                      'assets/images/reports.jpg',
                      'assets/images/salehistory.jpg',
                      'assets/images/sales.jpg',
                    ],
                    logoAsset: 'assets/icons/app_icon.png',
                    onContact: () => _scrollTo(_contactKey),
                    projectUrl: 'https://github.com/SodyElia/biashara_pro',
                  ),
                ],
              ),
            ),
            Container(
              key: _aboutKey,
              child: const AboutPage(),
            ),
            Container(
              key: _contactKey,
              child: const ContactPage(),
            ),
          ],
        ),
      ),
    );
  }
}