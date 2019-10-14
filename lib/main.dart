import 'package:flutter/material.dart';
import 'box.dart';
import 'ctext.dart';
import 'circle.dart';
import 'cicon.dart';
//import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:

      <String,WidgetBuilder>
      {
        'home': (BuildContext) => App(),

      },
      home: Scaffold(
        body: App(),
      ),
    );
  }
}

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  Color caughtColor = Colors.grey;
  List<Widget> list= [
    DragBox(Offset(300.0, 0.0), 'Box Three', Colors.lightGreen),
  ];

  


  List<Widget> ListMyWidgets() {

    return list;
  }
  
  void addText()
  {
    setState(() {
      list.add(TextBox(Offset(200.0, 0.0), 'Text Box', Colors.pink));
    });
    print(list.length);
  //  Navigator.of(context).pushReplacementNamed('home');
  }

  void addBox()
  {
    setState(() {
      list.add(DragBox(Offset(0.0, 0.0), 'Box', Colors.blueAccent),);
    });
    print(list.length);
    //  Navigator.of(context).pushReplacementNamed('home');
  }

  void addCircle()
  {
    setState(() {
      list.add(Circle(Offset(0.0, 0.0), 'Circle', Colors.blueAccent));
    });
    print(list.length);
    //  Navigator.of(context).pushReplacementNamed('home');
  }

  void addIcon()
  {
    setState(() {
      list.add(cIcon(Offset(0.0, 0.0), 'Circle', Colors.blueAccent));
    });
    print(list.length);
    //  Navigator.of(context).pushReplacementNamed('home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,


          children: <Widget>[

            ListTile(
              onTap: (){addBox();},
              title: Text('Box',
                style: TextStyle(
                    fontSize: 20.0
                ),
              ),


            ),

            ListTile(
              title: Text('Text',
                style: TextStyle(
                    fontSize: 20.0
                ),
              ),
              onTap: (){addText();},

            ),

            ListTile(
              onTap: (){addCircle();},
              title: Text('Circle',
                style: TextStyle(
                    fontSize: 20.0
                ),),


            ),

            ListTile(
              onTap: (){addIcon();},
              title: Text('Icon',
                style: TextStyle(
                    fontSize: 20.0
                ),),


            ),

            ListTile(
              onTap: (){addCircle();},
              title: Text('Image',
                style: TextStyle(
                    fontSize: 20.0
                ),),


            ),

            ListTile(
              onTap: (){addCircle();},
              title: Text('Slider',
                style: TextStyle(
                    fontSize: 20.0
                ),),


            ),

            ListTile(
              onTap: (){addCircle();},
              title: Text('Radiobutton',
                style: TextStyle(
                    fontSize: 20.0
                ),),


            ),

          ],
        ),
      ),


      body: Stack(
        children: ListMyWidgets()
        /* <Widget>[

          Positioned(
            left: 100.0,
            bottom: 0.0,
            child: DragTarget(
              onAccept: (Color color) {
                caughtColor = color;
              },
              builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                  ) {
                return Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: accepted.isEmpty ? caughtColor : Colors.grey.shade200,
                  ),
                  child: Center(
                    child: Text("Drag Here!"),
                  ),
                );
              },
            ),
          )
        ],*/
      ),
    );
  }
}


/*
class ZoomableWidget extends StatefulWidget {
  final Widget child;

  const ZoomableWidget({Key key, this.child}) : super(key: key);
  @override
  _ZoomableWidgetState createState() => _ZoomableWidgetState();
}

class _ZoomableWidgetState extends State<ZoomableWidget> {
  Matrix4 matrix = Matrix4.identity();

  @override
  Widget build(BuildContext context) {
    return MatrixGestureDetector(
      onMatrixUpdate: (Matrix4 m, Matrix4 tm, Matrix4 sm, Matrix4 rm) {
        setState(() {
          matrix = m;
        });
      },
      child: Transform(
        transform: matrix,
        child: widget.child,
      ),
    );
  }
}*/
