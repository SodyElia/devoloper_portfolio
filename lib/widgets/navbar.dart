
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final VoidCallback onHome;
  final VoidCallback onAbout;
  final VoidCallback onProjects;
  final VoidCallback onServices;
  final VoidCallback onContact;

  const NavBar({
    super.key,
    required this.onHome,
    required this.onAbout,
    required this.onProjects,
    required this.onServices,
    required this.onContact,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _menuOpen = false;

  @override
  Widget build(BuildContext context) {
    final links = [
      _navItem('Home', _navigate(widget.onHome)),
      _navItem('About', _navigate(widget.onAbout)),
      _navItem('Projects', _navigate(widget.onProjects)),
      _navItem('Services', _navigate(widget.onServices)),
      _navItem('Contact', _navigate(widget.onContact)),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 760;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isCompact ? 24 : 60,
            vertical: 20,
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: isCompact
              ? Column(
                  children: [
                    Row(
                      children: [
                        _brand(context),
                        const Spacer(),
                        IconButton(
                          tooltip: _menuOpen
                              ? 'Close navigation'
                              : 'Open navigation',
                          onPressed: () {
                            setState(() => _menuOpen = !_menuOpen);
                          },
                          icon: Icon(
                            _menuOpen ? Icons.close : Icons.menu,
                          ),
                        ),
                      ],
                    ),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 180),
                      curve: Curves.easeInOut,
                      child: _menuOpen
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: links,
                            )
                          : const SizedBox(width: double.infinity),
                    ),
                  ],
                )
              : Row(
                  children: [
                    _brand(context),
                    const Spacer(),
                    ...links,
                  ],
                ),
        );
      },
    );
  }

  VoidCallback _navigate(VoidCallback callback) {
    return () {
      setState(() => _menuOpen = false);
      callback();
    };
  }

  Widget _brand(BuildContext context) {
    return Text(
      'Elia Sody.',
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Widget _navItem(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
      ),
      child: TextButton(
        onPressed: onTap,
        child: Text(title),
      ),
    );
  }
}