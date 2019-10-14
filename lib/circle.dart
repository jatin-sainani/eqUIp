import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Circle extends StatefulWidget {
  final Offset initPos;
  final String label;
  final Color itemColor;

  Circle(this.initPos, this.label, this.itemColor);

  @override
  CircleState createState() => CircleState();
}

class CircleState extends State<Circle> {
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  double height=100.0;
  double width=100.0;
  double x=0.0;
  double y=0.0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: position.dx,
        top: position.dy,
        child: Draggable(
          data: widget.itemColor,
          child: ClipOval(
            child: Container(
              width: width,
              height: height,
              color: widget.itemColor,
              child: Center(
                child: GestureDetector(
                  onVerticalDragUpdate: (DragUpdateDetails details){
                    details.globalPosition.dy>y?
                    height = height + (details.globalPosition.dy/100)

                        :height = height - (details.globalPosition.dy/100);



                    // height.isNegative?Navigator.pop(context):


                    y=details.globalPosition.dy;
                    ;


                    print('position dy = ${height}');
                    print('dy = ${details.globalPosition.dy}');

                  },

                  onHorizontalDragUpdate: (DragUpdateDetails details){
                    details.globalPosition.dx>x?
                    width = width + (details.globalPosition.dx/100)

                        :width = width - (details.globalPosition.dx/100);

                    x=details.globalPosition.dx;

                  },
                  child: Icon(
                      Icons.arrow_drop_down_circle
                  ),
                ),
              ),
            ),
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
