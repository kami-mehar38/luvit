import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String label;
  final bool primary;
  const Tag({super.key, required this.label, this.primary = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: primary
            ? Color.fromARGB(255, 139, 0, 58).withOpacity(0.3)
            : const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: primary ? const Color(0xFFFF016B) : const Color(0xFF3A3A3A),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
                color: primary ? const Color(0xFFFF016B) : Colors.white,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
