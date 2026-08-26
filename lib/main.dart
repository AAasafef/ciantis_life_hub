import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth/auth_gate.dart';
import 'core/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  const supabaseKey = String.fromEnvironment('SUPABASE_PUBLISHABLE_KEY');

  if (supabaseUrl.isEmpty || supabaseKey.isEmpty) {
    runApp(const MissingSupabaseConfigApp());
    return;
  }

  await Supabase.initialize(
    url: supabaseUrl,
    publishableKey: supabaseKey,
  );

  runApp(const CiantisApp());
}

class CiantisApp extends StatelessWidget {
  const CiantisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ciantis Life Hub',
      theme: CiantisTheme.light,
      home: const AuthGate(),
    );
  }
}

class MissingSupabaseConfigApp extends StatelessWidget {
  const MissingSupabaseConfigApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'CIANTIS',
                    style: TextStyle(fontSize: 13, letterSpacing: 5),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Connect Supabase to turn on login.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 14),
                  Text(
                    'Run the app with SUPABASE_URL and SUPABASE_PUBLISHABLE_KEY supplied as --dart-define values.',
                    textAlign: TextAlign.center,
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
