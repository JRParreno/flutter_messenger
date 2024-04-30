// import 'package:flutter/material.dart';
// import 'package:flutter_messenger/gen/colors.gen.dart';

// class SlidingDrawer extends StatefulWidget {
//   const SlidingDrawer({
//     super.key,
//     required this.drawer,
//     required this.child,
//     required this.drawerWidth,
//     this.swipeSensitivity = 20,
//     this.overlayColor = ColorName.placeHolder,
//     this.overlayOpacity = 0.5,
//   });

//   final Widget drawer;
//   final Widget child;
//   final double drawerWidth;
//   final int swipeSensitivity;
//   final Color overlayColor;
//   final double overlayOpacity;

//   @override
//   State<SlidingDrawer> createState() => SlidingDrawerState();
// }

// class SlidingDrawerState extends State<SlidingDrawer>
//     with SingleTickerProviderStateMixin {
//   bool _opened = false;
//   final drawerKey = GlobalKey();
//   final mainKey = GlobalKey();
//   late AnimationController _animationController;
//   late Animation<double> _animation;

//   bool _isDragging = false;
//   bool _isMenuOpen = false;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );
//     _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           GestureDetector(
//             onTap: () {
//               if (_isMenuOpen) {
//                 _animationController.reverse();
//                 _isMenuOpen = false;
//               }
//             },
//             onHorizontalDragStart: (_) {
//               _isDragging = true;
//             },
//             onHorizontalDragUpdate: (details) {
//               if (!_isDragging) return;

//               _animationController.value += details.primaryDelta! /
//                   (MediaQuery.of(context).size.width * 0.75);
//             },
//             onHorizontalDragEnd: (details) {
//               _isDragging = false;

//               if (_isMenuOpen) {
//                 if (_animationController.value <= 0.5) {
//                   _animationController.reverse();
//                   _isMenuOpen = false;
//                 } else {
//                   _animationController.forward();
//                 }
//               } else {
//                 if (_animationController.value >= 0.5) {
//                   _animationController.forward();
//                   _isMenuOpen = true;
//                 } else {
//                   _animationController.reverse();
//                 }
//               }
//             },
//             child: AnimatedBuilder(
//               animation: _animation,
//               builder: (context, child) {
//                 return Transform.translate(
//                   offset: Offset(
//                       0.75 *
//                           _animation.value *
//                           MediaQuery.of(context).size.width,
//                       0),
//                   child: Transform.scale(
//                     scale: 1,
//                     child: child,
//                   ),
//                 );
//               },
//               child: widget.child,
//             ),
//           ),
//           if (_isMenuOpen)
//             Positioned.fill(
//               child: GestureDetector(
//                 onTap: () {
//                   _animationController.reverse();
//                   setState(() {
//                     _isMenuOpen =
//                         false; // Update _isMenuOpen state when overlay is tapped
//                   });
//                 },
//                 child: Container(
//                   color: Colors.black.withOpacity(0.3),
//                 ),
//               ),
//             ),
//           AnimatedBuilder(
//             animation: _animation,
//             builder: (context, child) {
//               return Positioned(
//                 left: -0.25 * MediaQuery.of(context).size.width +
//                     _animation.value * 0.25 * MediaQuery.of(context).size.width,
//                 width:
//                     MediaQuery.of(context).size.width * 0.75 * _animation.value,
//                 height: MediaQuery.of(context).size.height,
//                 child: GestureDetector(
//                   onHorizontalDragStart: (_) {
//                     _isDragging = true;
//                   },
//                   onHorizontalDragUpdate: (details) {
//                     if (!(_isDragging && details.delta.dx > 0)) {
//                       return;
//                     }
//                     _animationController.value += details.primaryDelta! /
//                         (MediaQuery.of(context).size.width * 0.75);
//                   },
//                   onHorizontalDragEnd: (details) {
//                     _isDragging = false;

//                     if (_isMenuOpen) {
//                       if (_animationController.value <= 0.5) {
//                         _animationController.reverse();
//                         _isMenuOpen = false;
//                       } else {
//                         _animationController.forward();
//                       }
//                     }
//                   },
//                   child: widget.drawer,
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   void open() {
//     setState(() {
//       _opened = true;
//     });
//   }

//   void close() {
//     setState(() {
//       _opened = false;
//     });
//   }

//   void toggleDrawer() {
//     setState(() {
//       _isMenuOpen = !_isMenuOpen;
//       if (_isMenuOpen) {
//         _animationController.forward();
//       } else {
//         _animationController.reverse();
//       }
//     });
//   }
// }
