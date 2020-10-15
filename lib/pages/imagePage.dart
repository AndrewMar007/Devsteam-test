import 'package:flutter/material.dart';

class ImagePage extends StatefulWidget {
  final String imageSrc;
  ImagePage({this.imageSrc = ""});
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  bool _isFullscreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black,
            child: Image.network(widget.imageSrc,
                fit: _isFullscreen ? BoxFit.cover : BoxFit.fitWidth),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              centerTitle: true,
              title: Text(
                'Fullscreen page',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    _isFullscreen = !_isFullscreen;
                  });
                },
                elevation: 2,
                color: Colors.white30,
                textColor: Colors.white,
                child: Icon(
                    _isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen),
                padding: EdgeInsets.all(16),
                shape: CircleBorder(side: BorderSide(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
