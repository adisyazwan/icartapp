import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'search_results_page_widget.dart';

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SearchResultsPageWidget()),
            );
          },
        ),
        backgroundColor: Colors.amber[700],
        title: Text("Supermarket Map"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(24.4, 42.0, 24.4, 42.0),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 34.0),
              constraints: BoxConstraints.expand(height: 300.0),
              width: MediaQuery.of(context).size.width * 0.65,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/map_beverage.png"),
                    fit: BoxFit.fitWidth),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              width: MediaQuery.of(context).size.width * 0.60,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  "Welcome to MSA Supermarket!",
                  style: TextStyle(
                      fontSize: 50.0,
                      fontFamily: 'Merienda',
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
