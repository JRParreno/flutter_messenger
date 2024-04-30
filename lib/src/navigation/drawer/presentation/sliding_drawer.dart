import 'package:flutter/material.dart';
import 'package:flutter_messenger/gen/colors.gen.dart';

class SlidingDrawer extends StatefulWidget {
  const SlidingDrawer({
    super.key,
    required this.drawer,
    required this.child,
    required this.drawerWidth,
    this.swipeSensitivity = 20,
    this.overlayColor = ColorName.placeHolder,
    this.overlayOpacity = 0.5,
  });

  final Widget drawer;
  final Widget child;
  final double drawerWidth;
  final int swipeSensitivity;
  final Color overlayColor;
  final double overlayOpacity;

  @override
  State<SlidingDrawer> createState() => SlidingDrawerState();
}

class SlidingDrawerState extends State<SlidingDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool _isDragging = false;
  bool _isMenuOpen = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_isMenuOpen) {
          _animationController.reverse();
          _isMenuOpen = false;
        }
      },
      onHorizontalDragStart: (details) {
        _isDragging = true;
      },
      onHorizontalDragUpdate: (details) {
        if (!_isDragging) return;
        setState(() {
          _isMenuOpen = true;
        });
        _animationController.value +=
            details.primaryDelta! / widget.drawerWidth;
      },
      onHorizontalDragEnd: (details) {
        _isDragging = false;

        if (_isMenuOpen) {
          if (_animationController.value <= 0.5) {
            _animationController.reverse();
            setState(() {
              _isMenuOpen = false;
            });
          } else {
            _animationController.forward();
          }
        } else {
          if (_animationController.value >= 0.5) {
            _animationController.forward();
            setState(() {
              _isMenuOpen = true;
            });
          } else {
            _animationController.reverse();
          }
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Positioned(
                  right: _animation.value == 0
                      ? 0
                      : -(_animation.value * widget.drawerWidth),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: widget.child,
                );
              },
            ),
            if (_isMenuOpen)
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  double opacityValue =
                      _animation.value <= 1 && _animation.value >= 0.2
                          ? 0.2
                          : _animation.value;
                  return Positioned(
                    right: _animation.value == 0
                        ? 0
                        : -(_animation.value * widget.drawerWidth),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: GestureDetector(
                      onTap: () {
                        _animationController.reverse().whenComplete(() {
                          setState(() {
                            _isMenuOpen = false;
                          });
                        });
                      },
                      child: Container(
                        color: Colors.black.withOpacity(opacityValue),
                      ),
                    ),
                  );
                },
              ),
            AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget? child) {
                return Positioned(
                  left: _animation.value == 0
                      ? -widget.drawerWidth
                      : -widget.drawerWidth +
                          _animation.value * widget.drawerWidth,
                  width: widget.drawerWidth,
                  height: MediaQuery.of(context).size.height,
                  child: widget.drawer,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void toggleDrawer() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
      if (_isMenuOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }
}
