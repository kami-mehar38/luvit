import 'package:flutter/material.dart';

class DraggableCard extends StatefulWidget {
  final Widget child;
  final void Function(int) removeCard;
  final int index;
  const DraggableCard(
      {super.key,
      required this.child,
      required this.removeCard,
      required this.index});

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

  bool cancelled = false;

  void _onPanStart(DragStartDetails details) {
    startDX = details.globalPosition.dx - xPosition;
    startDY = details.globalPosition.dy - yPosition;
    isBeingDragged = true;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    final dx = details.globalPosition.dx - startDX;
    final dy = details.globalPosition.dy - startDY;

    // Calculate bounds to restrict dragging
    const minX = double.negativeInfinity; // Minimum left-bound
    const minY = 0.0; // Minimum bottom-bound

    // Update the position within bounds
    setState(() {
      xPosition = dx.clamp(minX, 0); // Restrict left dragging
      yPosition = dy.clamp(minY, double.infinity); // Restrict bottom dragging
    });
  }

  void _onPanEnd(DragEndDetails details) {
    isBeingDragged = false;
    _resetPosition();
  }

  void _resetPosition() {
    if (xPosition <= -120 || yPosition >= 120) {
      if (!isBeingDragged) {
        widget.removeCard(widget.index);
      }
    }
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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    print("RESETTINGGGGG");

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
