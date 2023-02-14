import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              IconButton(
                iconSize: 48,
                splashRadius: 36,
                onPressed: () => {},
                icon: SvgPicture.asset(
                  'assets/small-logo.svg',
                  height: 128,
                  width: 128,
                  fit: BoxFit.fill,
                ),
              ),
              const Spacer(),
              IconButton(
                iconSize: 48,
                splashRadius: 36,
                onPressed: () => {},
                icon: SvgPicture.asset(
                  'assets/user.svg',
                  height: 128,
                  width: 128,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 86, 72, 62),
        onPressed: () => {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
