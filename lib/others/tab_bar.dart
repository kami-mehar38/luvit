import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final int noOfTabs;
  final int currentIndex;
  const CustomTabBar(
      {super.key, required this.noOfTabs, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          noOfTabs, (index) => CustomTab(isSelected: index == currentIndex)),
    );
  }
}

class CustomTab extends StatelessWidget {
  final bool isSelected;
  const CustomTab({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 3,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.5),
          color: isSelected ? const Color(0xFFFF0E73) : Colors.black,
        ),
      ),
    );
  }
}
