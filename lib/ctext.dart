import 'package:flutter/material.dart';

class TextBox extends StatefulWidget {
  final Offset initPos;
  final String label;
  final Color itemColor;

  TextBox(this.initPos, this.label, this.itemColor);

  @override
  TextBoxState createState() => TextBoxState();
}

class TextBoxState extends State<TextBox> {
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
    myController.text='Enter text here';
  }

  TextEditingController myController = TextEditingController();



  /*@override
  void dispose() {
    myController.dispose();
    super.dispose();
    myController.text='Enter text here';
  }*/


  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable(
        data: widget.itemColor,
        child: Container(
            width: 100.0,
            height: 60.0,
             //color: Colors.black,
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.edit,
                size: 10.0,), onPressed: null),
                Text(
                  widget.label,
                  style: TextStyle(
                    color: widget.itemColor,
                    fontSize: 30.0,
                  )
                ),
              ],
            )
        ),
        onDraggableCanceled: (velocity, offset) {
          setState(() {
            position = offset;
          });
        },
        feedback: Container(
          width: 100.0,
          height: 60.0,
          color: Colors.black.withOpacity(0.5),
          child: Center(
            child: Text(
              'Textfield',
              style: TextStyle(
                color: widget.itemColor,
                decoration: TextDecoration.none,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}