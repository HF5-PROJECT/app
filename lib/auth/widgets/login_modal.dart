import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                Text(
                  'Udfyld dine login oplysninger',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                Container(
                  height: 40,
                  margin: const EdgeInsets.only(top: 42),
                  child: inputField(context: context, hintText: 'Email'),
                ),
                Container(
                  height: 40,
                  margin: const EdgeInsets.only(top: 23),
                  child: inputField(
                    context: context,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                ),
                Container(
                  height: 40,
                  margin: const EdgeInsets.only(top: 43, bottom: 33),
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.5);
                          }
                          return Theme.of(context).colorScheme.secondary;
                        },
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Har du ikke en konto? Så klik her, for at blive ført til registeringssiden.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onPrimary,
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

TextField inputField({
  required BuildContext context,
  String? hintText,
  bool obscureText = false,
}) {
  return TextField(
    obscureText: obscureText,
    cursorColor: Theme.of(context).colorScheme.primary,
    style: TextStyle(
      fontSize: 16,
      color: Theme.of(context).colorScheme.secondary,
    ),
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      hintStyle: TextStyle(
        color: Theme.of(context).colorScheme.secondary,
      ),
      hintText: hintText,
      filled: true,
      fillColor: Theme.of(context).colorScheme.onPrimary,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
}
