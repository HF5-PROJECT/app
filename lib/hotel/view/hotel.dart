import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:overnites/auth/widgets/login_modal.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({super.key});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              IconButton(
                iconSize: 36,
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
                iconSize: 36,
                splashRadius: 36,
                onPressed: () => {loginModal(context)},
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
