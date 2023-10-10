import 'package:flutter/material.dart';

class LikesWidget extends StatelessWidget {
  const LikesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: const Color(0xFF212121),
          width: 2,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/ic_star.png'),
          const SizedBox(width: 8),
          const Text(
            "323,333",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
