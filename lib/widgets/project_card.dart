import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final IconData icon;
  final List<String> imageAssets;
  final String? logoAsset;
  final String? projectUrl;
  final VoidCallback onContact;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.technologies,
    required this.icon,
    required this.onContact,
    this.imageAssets = const [],
    this.logoAsset,
    this.projectUrl,
  });

  Future<void> _openProjectSource() async {
    final url = projectUrl;
    if (url == null) return;

    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1100),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: colors.outlineVariant),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final compact = constraints.maxWidth < 760;
            final gallery = imageAssets.isEmpty
                ? Container(
                    height: 240,
                    decoration: BoxDecoration(
                      color: colors.primaryContainer,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Icon(
                        icon,
                        size: 90,
                        color: colors.onPrimaryContainer,
                      ),
                    ),
                  )
                : Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(
                          imageAssets.first,
                          width: double.infinity,
                          height: compact ? 210 : 280,
                          fit: BoxFit.cover,
                          semanticLabel: '$title dashboard screenshot',
                        ),
                      ),
                      if (imageAssets.length > 1) ...[
                        const SizedBox(height: 8),
                        GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1.65,
                          children: imageAssets.skip(1).map((asset) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.asset(
                                asset,
                                fit: BoxFit.cover,
                                semanticLabel: '$title feature screenshot',
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ],
                  );
            final details = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CASE STUDY',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: colors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    if (logoAsset != null) ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(
                          logoAsset!,
                          width: 44,
                          height: 44,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                    Expanded(
                      child: Text(
                        title,
                        style: theme.textTheme.headlineMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(description, style: theme.textTheme.bodyLarge),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: technologies.map((technology) {
                    return Chip(
                      label: Text(technology),
                      backgroundColor: colors.primaryContainer,
                      labelStyle: TextStyle(
                        color: colors.onPrimaryContainer,
                        fontSize: 12,
                      ),
                      side: BorderSide.none,
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    FilledButton.icon(
                      onPressed: onContact,
                      icon: const Icon(Icons.chat_bubble_outline),
                      label: const Text('Discuss a similar project'),
                    ),
                    if (projectUrl != null)
                      OutlinedButton.icon(
                        onPressed: _openProjectSource,
                        icon: const Icon(Icons.code),
                        label: const Text('View source'),
                      ),
                  ],
                ),
              ],
            );

            if (compact) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  gallery,
                  const SizedBox(height: 24),
                  details,
                ],
              );
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: gallery),
                const SizedBox(width: 28),
                Expanded(flex: 2, child: details),
              ],
            );
          },
        ),
      ),
    );
  }
}