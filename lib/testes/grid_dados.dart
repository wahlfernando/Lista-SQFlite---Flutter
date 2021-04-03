import 'package:flutter/material.dart';

class GridDados extends StatelessWidget {
  GridDados(this.text1, this.text2);

  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            color: Colors.grey,
            child: Text(text1,
                style: TextStyle(fontSize: 14.0, color: Colors.black)),
          ),
          Container(
            color: Colors.greenAccent,
            child: Text(text2,
                style: TextStyle(fontSize: 14.0, color: Colors.black)),
          ),
        ],
      ),
    );

  }
}


// Padding(
// padding: const EdgeInsets.all(8.0),
// child: TextFormField(
// textCapitalization: TextCapitalization.characters,
// style: TextStyle(color: Colors.blue),
// decoration: InputDecoration(
// border: OutlineInputBorder(
// borderRadius:
// BorderRadius.circular(16)),
// //labelText: '',
// suffixText: text3,
// labelStyle: TextStyle(
// fontSize: 18, color: Colors.grey),
// ),
// ),
// ),
