import 'package:flutter/material.dart';
import 'package:store_app/screen/widgets/banner_widget.dart';
import 'package:store_app/screen/widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [HeaderWidget(), BannerWidget()],
      ),
    );
  }
}
