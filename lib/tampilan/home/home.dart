import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:muhamadfikri_finalproject_flutter/models/informasi.dart';
import 'package:muhamadfikri_finalproject_flutter/tampilan/detail_home/detail_info.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Final Project Flutter"),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () => _exitbtn(context))
            ],
          ),
          body: Container(
            child: FutureBuilder(
              future: getData(http.Client()),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(snapshot.data[index].name),
                          subtitle: Text(snapshot.data[index].type),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapshot.data[index].cardImages[0].imageUrl),
                          ),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      Detail(snapshot.data[index])),
                            );
                          },
                        );
                      });
                }
              },
            ),
          ),
        ),
        onWillPop: () => _exitbtn(context));
  }

  // Alert with multiple and custom buttons
  _exitbtn(context) {
    Alert(
      context: context,
      title: "Pemberitahuan",
      desc: "Apakah anda yakin ingin keluar dari aplikasi?",
      buttons: [
        DialogButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.of(context).pop(),
          color: Color.fromRGBO(59, 0, 244, 1.0),
        ),
        DialogButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () =>
                SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
            color: Color.fromRGBO(59, 0, 244, 1.0))
      ],
    ).show();
  }
}

List<Informasi> parseCard(String responBody) {
  final parsed = json.decode(responBody).cast<Map<String, dynamic>>();
  return parsed.map<Informasi>((json) => Informasi.fromJson(json)).toList();
}

Future<List<Informasi>> getData(http.Client client) async {
  final response =
      await client.get('https://db.ygoprodeck.com/api/v5/cardinfo.php?num=50');
  return compute(parseCard, response.body);
}
