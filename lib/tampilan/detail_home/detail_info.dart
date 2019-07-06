import 'package:flutter/material.dart';
import 'package:muhamadfikri_finalproject_flutter/models/informasi.dart';

class Detail extends StatelessWidget {
  final Informasi info;

  Detail(this.info);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverOverlapAbsorber(
                    child: SliverSafeArea(
                      top: false,
                      sliver: SliverAppBar(
                        expandedHeight: 500,
                        pinned: true,
                        flexibleSpace: FlexibleSpaceBar(
                          title: Text(
                            info.name,
                            overflow: TextOverflow.ellipsis,
                          ),
                          background: Image.network(
                            info.cardImages[0].imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context))
              ],
          body: SingleChildScrollView(
              child: Container(
                  margin:
                      EdgeInsets.only(top: 20, bottom: 10, right: 5, left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          info.desc,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  )))),
    );
  }
}
