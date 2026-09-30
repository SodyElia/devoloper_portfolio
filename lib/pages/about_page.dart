import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 840;
        final compactContentWidth = constraints.maxWidth - 48;
        final copy = SizedBox(
          width: compact ? compactContentWidth : 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ABOUT ME',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Building Digital Solutions for Businesses',
                style: theme.textTheme.headlineLarge,
              ),
              const SizedBox(height: 24),
              Text(
                'I am Elia Mgeu Anyimike Sody, a Flutter developer '
                'focused on building mobile and web applications that '
                'solve real-world business problems.',
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              Text(
                'My work includes developing Biashara, a business '
                'management application built with Flutter and Firebase. '
                'I enjoy turning ideas into practical, user-friendly '
                'software.',
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 28),
              const Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _SkillChip(label: 'Flutter'),
                  _SkillChip(label: 'Dart'),
                  _SkillChip(label: 'Firebase'),
                  _SkillChip(label: 'Cloud Firestore'),
                  _SkillChip(label: 'Git & GitHub'),
                ],
              ),
            ],
          ),
        );
        final visual = ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/profile.jpg',
            width: compact ? compactContentWidth : 420,
            height: compact ? 340 : 525,
            fit: BoxFit.cover,
            semanticLabel: 'Portrait of Elia Sody',
          ),
        );

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 72,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: compact
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        visual,
                        const SizedBox(height: 36),
                        copy,
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        visual,
                        const SizedBox(width: 56),
                        Expanded(child: copy),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;

  const _SkillChip({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Chip(
      label: Text(label),
      backgroundColor: colors.primaryContainer,
      labelStyle: TextStyle(
        color: colors.onPrimaryContainer,
        fontWeight: FontWeight.w600,
      ),
      side: BorderSide.none,
    );
  }
}