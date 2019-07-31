import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final String text;

  const TextWidget({Key key, this.title, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.20,
            child: Text(
              title,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.65,
              child: Text(
                text,
                style: TextStyle(fontSize: 16.0),
              ))
        ],
      ),
    );
  }
}
