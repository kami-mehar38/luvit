import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(),
      child: SizedBox(
        height: 90,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF2F2F2F).withOpacity(0.5),
                        const Color(0xFF2F2F2F),
                      ],
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.black.withOpacity(0.5), width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF2F2F2F).withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: Center(
                    child: Image.asset('assets/images/ic_star_menu.png'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    onPressed: () {},
                    icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/ic_home.png'),
                        const Text(
                          '홈',
                          style: TextStyle(
                              color: Color(0xFFFF016B),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    onPressed: () {},
                    icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/ic_location_menu.png'),
                        const Text(
                          '스팟',
                          style: TextStyle(
                              color: Color(0xFF3A3A3A),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    onPressed: () {},
                    icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/ic_chat.png'),
                        const Text(
                          '채팅',
                          style: TextStyle(
                              color: Color(0xFF3A3A3A),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    onPressed: () {},
                    icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/ic_profile.png'),
                        const Text(
                          '마이',
                          style: TextStyle(
                              color: Color(0xFF3A3A3A),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final startingPoint =
        Offset(0, size.height); // Start from the bottom-left corner

    return Path()
      ..moveTo(startingPoint.dx, startingPoint.dy)
      ..lineTo(size.width, size.height) // Move to bottom-right corner
      ..lineTo(size.width, 12 + 25)
      ..quadraticBezierTo(
          size.width, 25, size.width - 12, 25) // Move to top-right - 12 corner
      ..lineTo((size.width / 2) + 25, 25)
      ..quadraticBezierTo(size.width / 2, 0, (size.width / 2) - 25, 25)
      ..lineTo(12, 15)
      ..quadraticBezierTo(0, 25, 0, 12 + 25)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black;

    final startingPoint =
        Offset(0, size.height); // Start from the bottom-left corner

    final path = Path()
      ..moveTo(startingPoint.dx, startingPoint.dy)
      ..lineTo(size.width, size.height) // Move to bottom-right corner
      ..lineTo(size.width, 12 + 25)
      ..quadraticBezierTo(
          size.width, 25, size.width - 12, 25) // Move to top-right - 12 corner
      ..lineTo((size.width / 2) + 25, 25)
      ..quadraticBezierTo(size.width / 2, 0, (size.width / 2) - 25, 25)
      ..lineTo(12, 25)
      ..quadraticBezierTo(0, 25, 0, 12 + 25);

    canvas.drawPath(path, paint);

    final strokePath = Path()
      ..moveTo(-2, startingPoint.dy + 2)
      ..lineTo(size.width + 2, size.height + 2) // Move to bottom-right corner
      ..lineTo(size.width + 2, 14 + 24)
      ..quadraticBezierTo(
          size.width, 24, size.width - 14, 24) // Move to top-right - 12 corner
      ..lineTo((size.width / 2) + 24, 24)
      ..quadraticBezierTo(size.width / 2, 0, (size.width / 2) - 24, 24)
      ..lineTo(14, 24)
      ..quadraticBezierTo(0, 24, -2, 14 + 24);

    final shader = const LinearGradient(
        colors: [Color(0xFF101010), Color(0xFF101010)], // Gradient colors
        begin: Alignment.topCenter, // Gradient start point
        end: Alignment.bottomCenter,
        stops: [
          0.1,
          0.3,
        ] // Gradient end point
        ).createShader(strokePath.getBounds());

    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..shader = shader;

    canvas.drawPath(strokePath, strokePaint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(MyPainter oldDelegate) => true;
}
