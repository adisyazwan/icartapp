import 'package:icartapp/home_page/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'NavBar.dart';
import 'ImageCarousel.dart';

class SearchResultsPageWidget extends StatefulWidget {
  SearchResultsPageWidget({
    Key key,
    this.searchTerm,
    this.id,
  }) : super(key: key);

  final String searchTerm;
  final dynamic id;

  @override
  _SearchResultsPageWidgetState createState() =>
      _SearchResultsPageWidgetState();
}

class _SearchResultsPageWidgetState extends State<SearchResultsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        title: Text('Supermarket Map'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        HomePageWidget() /*masukkan class untuk main page, then import class tu sekali dlm ni */),
              );
            },
          ),
        ],
      ),
      body: ImageCarousel(),
    );
  }
}
