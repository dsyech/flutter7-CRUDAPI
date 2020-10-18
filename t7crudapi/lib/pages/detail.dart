import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:t7crudapi/pages/home.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  var dataJSON;
  TextEditingController name = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController email = new TextEditingController();

  postData() {
    var jsonData = {
      "name": name.text,
      "address": address.text,
      "email": email.text,
    };

    var dataJSON = json.encode(jsonData);
    print(dataJSON);
    http
        .post(
            "https://script.google.com/macros/s/AKfycbyb7fjSjSdviltbeDkGCaqzVdUbayoTBToPy5yItN3BKrcPI8J-/exec",
            body: dataJSON)
        .then((response) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (BuildContext context) => new Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Detail"),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(5.0),
            child: new TextField(
              controller: name,
              decoration: new InputDecoration(labelText: "Nama"),
            ),
          ),
          new Container(
            padding: new EdgeInsets.all(5.0),
            child: new TextField(
              controller: address,
              decoration: new InputDecoration(labelText: "Alamat"),
            ),
          ),
          new Container(
            padding: new EdgeInsets.all(5.0),
            child: new TextField(
              controller: email,
              decoration: new InputDecoration(labelText: "Email"),
            ),
          ),
          new Container(
            padding: new EdgeInsets.all(5.0),
            child: new FlatButton(
              onPressed: () {
                postData();
              },
              color: Colors.orange,
              child: new Text("Tambah Data",
                  style: new TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
