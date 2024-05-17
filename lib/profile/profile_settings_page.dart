import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/constants.dart';
import '../core/theme_notifier.dart';
import '../data/firebase_service/firebase_auth.dart';

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({super.key});

  Future<void> _confirmAndLogout(BuildContext context) async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cerrar sesión'),
        content: const Text('¿Estás seguro de que quieres cerrar la sesión?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Cerrar sesión'),
          ),
        ],
      ),
    );

    if (shouldLogout == true) Authentication().logout();
  }

  @override
  Widget build(BuildContext context) {
    var isDarkTheme =
        context.select((ThemeNotifier notifier) => notifier.isDarkTheme);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes y configuraciones'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Modo oscuro',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SwitchListTile(
              title: const Text('Activar'),
              value: isDarkTheme,
              onChanged: (value) {
                context
                    .read<ThemeNotifier>()
                    .setTheme(value ? AppTheme.dark : AppTheme.light);
              },
              activeColor: icons,
              inactiveTrackColor: icons2,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () => _confirmAndLogout(context),
            child: const Text('Cerrar sesión'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
