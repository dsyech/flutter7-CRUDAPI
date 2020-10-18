import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:t7crudapi/pages/detail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var dataJSON;

  getData() async {
    http.Response hasil = await http.get(
        "https://script.google.com/macros/s/AKfycbyb7fjSjSdviltbeDkGCaqzVdUbayoTBToPy5yItN3BKrcPI8J-/exec",
        headers: {"Accept": "application/json"});

    this.setState(() {
      dataJSON = json.decode(hasil.body);
      dataJSON = dataJSON['users'];
      print(dataJSON);
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: new Text("Home"),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new Detail()));
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          FlatButton(
            onPressed: () {
              getData();
            },
            child: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: dataJSON == null ? 0 : dataJSON.length,
        itemBuilder: (context, i) {
          if (dataJSON.length > 0) {
            return Container(
                padding: EdgeInsets.all(2.0),
                child: Card(
                  child: Container(
                      padding: EdgeInsets.all(5.0),
                      child: ListTile(
                        title: Text(dataJSON[i]['name']),
                        subtitle: Text(dataJSON[i]['email']),
                        trailing: Text(dataJSON[i]['address']),
                      )),
                ));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
