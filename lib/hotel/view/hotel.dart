import 'package:flutter/material.dart';
import 'package:overnites/app/widgets/header.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({super.key});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: HeaderWidget(),
      ),
    );
  }
}
