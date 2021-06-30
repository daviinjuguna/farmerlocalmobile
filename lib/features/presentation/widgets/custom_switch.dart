import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.activeColor = Colors.green,
    this.inactiveColor = Colors.lightGreen,
    this.activeText = "BUCK",
    this.activeTextColor = Colors.white,
    this.inactiveText = "DOE",
    this.inactiveTextColor = Colors.white,
  }) : super(key: key);
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final String activeText;
  final String inactiveText;
  final Color activeTextColor;
  final Color inactiveTextColor;

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late final _animationController =
      AnimationController(vsync: this, duration: Duration(milliseconds: 60));
  late final _circleAnimation = AlignmentTween(
          begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
          end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
      .animate(
          CurvedAnimation(parent: _animationController, curve: Curves.linear));
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 130.0,
            height: 35.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: _circleAnimation.value == Alignment.centerLeft
                    ? widget.inactiveColor
                    : widget.activeColor),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleAnimation.value == Alignment.centerRight
                      ? Padding(
                          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                          child: Text(
                            widget.activeText,
                            style: TextStyle(
                                color: widget.activeTextColor,
                                fontWeight: FontWeight.w900,
                                fontSize: 16.0),
                          ),
                        )
                      : Opacity(opacity: 0),
                  Expanded(
                    child: Align(
                      alignment: _circleAnimation.value,
                      child: Container(
                        width: 25.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                    ),
                  ),
                  _circleAnimation.value == Alignment.centerLeft
                      ? Padding(
                          padding: const EdgeInsets.only(left: 4.0, right: 5.0),
                          child: Text(
                            widget.inactiveText,
                            style: TextStyle(
                                color: widget.inactiveTextColor,
                                fontWeight: FontWeight.w900,
                                fontSize: 16.0),
                          ),
                        )
                      : Opacity(opacity: 0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
