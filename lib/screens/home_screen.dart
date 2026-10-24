
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color cyan = Color(0xFF00F5FF);
  static const Color purple = Color(0xFFB44CFF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.bolt, color: cyan, size: 28),
            SizedBox(width: 10),
            Text(
              'FOCUSFLOW',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: const Text(
              'LOGIN',
              style: TextStyle(
                color: cyan,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.7, -0.6),
            radius: 1.2,
            colors: [
              Color(0xFF182344),
              Color(0xFF080B14),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 850),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: cyan.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: cyan.withValues(alpha: 0.5),
                      ),
                    ),
                    child: const Text(
                      'MariList Activity',
                      style: TextStyle(
                        color: cyan,
                        letterSpacing: 2,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'WELCOME TO THE',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                      letterSpacing: 4,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'One task at a time.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      height: 1.1,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Manage your task with ease, '
                    'stay on track, and build better '
                    'habits with FocusFlow.',
                    style: TextStyle(
                      color: Color(0xFFADB8D0),
                      fontSize: 16,
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Wrap(
                    spacing: 14,
                    runSpacing: 14,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text('GET STARTED'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cyan,
                          foregroundColor: const Color(0xFF080B14),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 20,
                          ),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Focus.Flow.Finish',
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.info_outline),
                        label: const Text('LEARN MORE'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: purple),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFF121827),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: cyan.withValues(alpha: 0.35),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: cyan.withValues(alpha: 0.07),
                          blurRadius: 30,
                        ),
                      ],
                    ),
                    child: const Wrap(
                      spacing: 35,
                      runSpacing: 20,
                      children: [
                        _Feature(
                          icon: Icons.dark_mode,
                          title: 'DARK',
                          subtitle: 'Modern appearance',
                        ),
                        _Feature(
                          icon: Icons.bolt,
                          title: 'YOUR STYLE',
                          subtitle: 'Bright accents',
                        ),
                        _Feature(
                          icon: Icons.web,
                          title: 'MY WEB',
                          subtitle: 'Browser-based',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Feature extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _Feature({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Row(
        children: [
          const SizedBox(width: 2),
          Icon(icon, color: const Color(0xFF00F5FF), size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
