import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'login_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        final session = Supabase.instance.client.auth.currentSession;

        if (session == null) {
          return const LoginScreen();
        }

        return const SignedInHome();
      },
    );
  }
}

class SignedInHome extends StatelessWidget {
  const SignedInHome({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text(
                'CIANTIS',
                style: TextStyle(
                  fontSize: 13,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'You’re connected.',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                user?.email ?? 'Signed in',
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 10),
              const Text(
                'This account can be used by every CIANTIS app connected to the same Supabase project.',
                style: TextStyle(height: 1.5),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Supabase.instance.client.auth.signOut(),
                  child: const Text('Sign out'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
