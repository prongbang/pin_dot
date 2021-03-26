import 'package:flutter/material.dart';

class PinDot extends StatefulWidget {
  final double size;
  final int length;
  final double padding;
  final String text;
  final Color activeColor;
  final Color inactiveColor;
  final Color borderColor;

  const PinDot({
    Key key,
    @required this.size,
    @required this.length,
    @required this.activeColor,
    @required this.borderColor,
    this.inactiveColor,
    this.padding = 16,
    this.text = '',
  }) : super(key: key);

  @override
  _PinDotState createState() => _PinDotState();
}

class _PinDotState extends State<PinDot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildPinDot(),
      ),
    );
  }

  List<Widget> _buildPinDot() {
    var activeColor = widget.activeColor;
    var borderColor = widget.borderColor;
    List<Widget> pinDots = [];
    for (var i = 0; i < widget.length; i++) {
      var border = borderColor;
      var active = widget.inactiveColor != null
          ? widget.inactiveColor
          : Colors.transparent;
      if (widget.text.length > i) {
        border = activeColor;
        active = activeColor;
      }
      pinDots.add(Padding(
        padding: EdgeInsets.all(widget.padding),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.size),
            border: Border.all(color: border),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: active,
              borderRadius: BorderRadius.circular(widget.size),
            ),
            height: widget.size,
            width: widget.size,
          ),
        ),
      ));
    }
    return pinDots;
  }
}
