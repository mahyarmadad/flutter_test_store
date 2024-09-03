import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.20,
      child: Stack(
        children: [
          Image.asset(
            "/icons/searchBanner.jpeg",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 48,
            top: 68,
            child: SizedBox(
              width: 250,
              height: 50,
              child: TextField(
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      hintText: "Search...",
                      hintStyle:
                          const TextStyle(fontSize: 14, color: Colors.black87),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: const Icon(Icons.camera_alt_outlined),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)))),
            ),
          ),
          Positioned(
            left: 311,
            top: 78,
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.notifications_none)),
          ),
          Positioned(
            left: 354,
            top: 78,
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.chat)),
          ),
        ],
      ),
    );
  }
}
