
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  Future<void> _openLink(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 80,
      ),
      color: const Color(0xFF0F172A),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 900,
          ),
          child: Column(
            children: [
              const Text(
                'GET IN TOUCH',
                style: TextStyle(
                  color: Color(0xFF14B8A6),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Let's Work Together",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Have a business idea or need a '
                'mobile app or website? Get in touch '
                'and let us discuss your project.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  height: 1.7,
                  color: Color(0xFFCBD5E1),
                ),
              ),

              const SizedBox(height: 40),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      _openLink(
                        'https://wa.me/255764820101',
                      );
                    },
                    icon: const Icon(
                      Icons.chat,
                    ),
                    label: const Text(
                      'Contact on WhatsApp',
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF0D9488),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 20,
                      ),
                    ),
                  ),

                  OutlinedButton.icon(
                    onPressed: () {
                      _openLink(
                        'mailto:eliamgeusody@yahoo.com'
                        '?subject=Project%20Inquiry',
                      );
                    },
                    icon: const Icon(
                      Icons.email_outlined,
                    ),
                    label: const Text(
                      'Send Me an Email',
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(
                        color: Colors.white54,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 20,
                      ),
                    ),
                  ),

                  OutlinedButton.icon(
                    onPressed: () {
                      _openLink('https://github.com/SodyElia');
                    },
                    icon: const Icon(Icons.code),
                    label: const Text('GitHub'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(
                        color: Colors.white54,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 20,
                      ),
                    ),
                  ),

                  OutlinedButton.icon(
                    onPressed: () {
                      _openLink(
                        'https://www.linkedin.com/in/elia-sody-37876a184',
                      );
                    },
                    icon: const Icon(Icons.work_outline),
                    label: const Text('LinkedIn'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(
                        color: Colors.white54,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 20,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 50),

              const Divider(
                color: Colors.white24,
              ),

              const SizedBox(height: 24),

              const Text(
                'Elia Mgeu Anyimike Sody | Flutter Developer',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Building digital solutions for businesses.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}