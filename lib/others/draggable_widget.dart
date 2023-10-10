import 'package:flutter/material.dart';

class DraggableCard extends StatefulWidget {
  final Widget child;

  const DraggableCard({super.key, required this.child});

  @override
  DraggableCardState createState() => DraggableCardState();
}

class DraggableCardState extends State<DraggableCard>
    with TickerProviderStateMixin {
  double xPosition = 0.0;
  double yPosition = 0.0;
  double startDX = 0.0;
  double startDY = 0.0;
  bool isBeingDragged = false;

  void _onPanStart(DragStartDetails details) {
    startDX = details.globalPosition.dx - xPosition;
    startDY = details.globalPosition.dy - yPosition;
    isBeingDragged = true;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      xPosition = details.globalPosition.dx - startDX;
      yPosition = details.globalPosition.dy - startDY;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    isBeingDragged = false;
    _resetPosition();
  }

  void _resetPosition() {
    if (xPosition != 0 || yPosition != 0) {
      final animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300), // Animation duration
      );

      final animation = Tween<Offset>(
        begin: Offset(xPosition, yPosition),
        end: const Offset(0, 0),
      ).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut, // Animation curve
      ));

      animationController.addListener(() {
        setState(() {
          xPosition = animation.value.dx;
          yPosition = animation.value.dy;
        });
      });

      animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _onPanStart,
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Transform.translate(
        offset: Offset(xPosition, yPosition),
        child: widget.child,
      ),
    );
  }
}
