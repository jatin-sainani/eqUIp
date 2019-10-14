import 'package:flutter/material.dart';

class cIcon extends StatefulWidget {
  final Offset initPos;
  final String label;
  final Color itemColor;

  cIcon(this.initPos, this.label, this.itemColor);

  @override
  cIconState createState() => cIconState();
}

class cIconState extends State<cIcon> {
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: position.dx,
        top: position.dy,
        child: Draggable(
          data: widget.itemColor,
          child: Center(
            child: Icon(
              Icons.insert_emoticon,
              color: widget.itemColor,
              size: 40.0,
            )
          ),
          onDraggableCanceled: (velocity, offset) {
            setState(() {
              position = offset;
            });
          },
          feedback: Container(
            width: 120.0,
            height: 120.0,
            color: widget.itemColor.withOpacity(0.5),
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ));
  }
}
