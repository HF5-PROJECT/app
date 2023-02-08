import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:overnites/l10n/l10n.dart';
import 'package:overnites/login/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          loginModal(context);
        },
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 24),
        ),
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<LoginCubit>().increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => context.read<LoginCubit>().decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  Future<dynamic> loginModal(BuildContext context) {
    return showMaterialModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      builder: (context) => Material(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        color: Theme.of(context).colorScheme.surface,
        child: SafeArea(
          top: false,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(35, 50, 35, 35),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('Login'),
                  const Text('Udfyld dine login oplysninger'),
                  Container(
                    child: TextField(
                      cursorColor: Theme.of(context).colorScheme.onPrimary,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.onPrimary,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('Move'),
                    leading: Icon(Icons.folder_open),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  ListTile(
                    title: Text('Delete'),
                    leading: Icon(Icons.delete),
                    onTap: () => Navigator.of(context).pop(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
