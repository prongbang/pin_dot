import 'package:flutter/material.dart';

class PinDot extends StatefulWidget {
  final double size;
  final int length;
  final double padding;
  final Color activeColor;
  final Color? inactiveColor;
  final Color borderColor;
  final TextEditingController? controller;

  const PinDot({
    Key? key,
    required this.size,
    required this.length,
    required this.activeColor,
    required this.borderColor,
    this.inactiveColor,
    this.padding = 16,
    this.controller,
  }) : super(key: key);

  @override
  _PinDotState createState() => _PinDotState();
}

class _PinDotState extends State<PinDot> {
  String _text = '';

  @override
  void initState() {
    widget.controller?.addListener(() {
      setState(() {
        _text = widget.controller?.text ?? '';
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size + (widget.padding * 2),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.length,
        itemBuilder: (context, index) {
          return _PinDotItemWidget(
            index: index,
            size: widget.size,
            length: widget.length,
            padding: widget.padding,
            activeColor: widget.activeColor,
            inactiveColor: widget.inactiveColor,
            borderColor: widget.borderColor,
            text: _text,
          );
        },
      ),
    );
  }
}

class _PinDotItemWidget extends StatelessWidget {
  final double size;
  final int length;
  final int index;
  final double padding;
  final Color activeColor;
  final Color? inactiveColor;
  final Color borderColor;
  final String text;

  const _PinDotItemWidget({
    Key? key,
    required this.size,
    required this.index,
    required this.length,
    required this.padding,
    required this.activeColor,
    required this.borderColor,
    required this.text,
    this.inactiveColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var border = borderColor;
    var active = inactiveColor != null ? inactiveColor : Colors.transparent;
    if (text.length > index) {
      border = activeColor;
      active = activeColor;
    } else {
      border = borderColor;
      active = inactiveColor;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size),
              border: Border.all(color: border),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: active,
                borderRadius: BorderRadius.circular(size),
              ),
              height: size,
              width: size,
            ),
          ),
        ),
      ],
    );
  }
}
