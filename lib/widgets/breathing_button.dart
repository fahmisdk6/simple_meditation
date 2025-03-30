import 'package:flutter/material.dart';

class BreathingButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool isActive;

  const BreathingButton({
    super.key,
    required this.onPressed,
    required this.isActive,
  });

  @override
  State<BreathingButton> createState() => _BreathingButtonState();
}

class _BreathingButtonState extends State<BreathingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _scaleAnimation2;
  late Animation<double> _scaleAnimation3;
  late Animation<double> _scaleAnimation4;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    final curve = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(curve);
    _scaleAnimation2 = Tween<double>(begin: 1.0, end: 1.4).animate(curve);
    _scaleAnimation3 = Tween<double>(begin: 1.0, end: 1.6).animate(curve);
    _scaleAnimation4 = Tween<double>(begin: 1.0, end: 1.8).animate(curve);
  }

  @override
  void didUpdateWidget(BreathingButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive) {
      _animationController.repeat(reverse: true);
    } else {
      _animationController.stop();
      _animationController.reset();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (widget.isActive) ...[
          // Outermost circle
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation4.value,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
          // Third circle
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation3.value,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
          // Second circle
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation2.value,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
          // Innermost circle
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
        ],
        // Main static button
        Ink(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: BorderRadius.circular(100),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  widget.isActive ? 'Stop' : 'Start Meditation',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
