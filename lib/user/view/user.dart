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
                  // ignore: use_build_context_synchronously
                  showSnackBar(
                    context,
                    const Text('Logged Out'),
                  );

                  await (await AuthServiceFactory.make()).logOut();

                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
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
