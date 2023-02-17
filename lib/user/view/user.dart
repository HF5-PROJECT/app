import 'package:flutter/material.dart';
import 'package:overnites/app/factories/auth_service_factory.dart';
import 'package:overnites/app/util/snack_bar.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40),
                ),
                child: const Text('Go back'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  final navigator = Navigator.of(context);
                  final scaffoldMessengerState = ScaffoldMessenger.of(context);

                  if (await (await AuthServiceFactory.make()).logout()) {
                    showSnackBar(
                      scaffoldMessengerState,
                      const Text('Logged Out'),
                    );

                    navigator.pop();
                  } else {
                    showSnackBar(
                      scaffoldMessengerState,
                      const Text('Error logging out'),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40),
                ),
                child: const Text('Log out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
