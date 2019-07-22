import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
import 'package:pet/models/circle/circle.dart';

import 'cache_picture.dart';

class WebViewPage extends StatefulWidget {
  String url;

  String title;

  CircleModel model;

  WebViewPage({this.url, this.title, this.model});

  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  InAppWebViewController webView;
  double progress = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black54,
        ),
        backgroundColor: Colors.white,
        title: Text(
          '${widget.title}',
          style: TextStyle(color: Colors.black54),
        ),
        automaticallyImplyLeading: true,
        elevation: 0.5,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _buildItemAuthor(context, widget.model),
            (progress != 1.0) ? LinearProgressIndicator(value: progress) : null,
            Container(
              height: 600,
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(),
              child: InAppWebView(
                initialUrl: "http://www.baidu.com",
                initialHeaders: {},
                initialOptions: {},
                onWebViewCreated: (InAppWebViewController controller) {
                  webView = controller;
                },
                onLoadStart: (InAppWebViewController controller, String url) {},
                onProgressChanged:
                    (InAppWebViewController controller, int progress) {
                  setState(() {
                    this.progress = progress / 100;
                  });
                },
              ),
            ),
            _buildItemAuthor(context, widget.model),
          ].where((Object o) => o != null).toList(),
        ),
      ),
    );
  }

  Widget _buildItemAuthor(BuildContext context, CircleModel model) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            child: CachePicture(
              url: '${model.userPic}',
              width: 40,
              height: 40,
              borderRadius: 40,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                '${model.userName}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          Container(
            width: 65,
            height: 35,
//            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            child: FlatButton(
                onPressed: null,
                child: Text(
                  '关注',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Color(0xffB4EEB4),
                ),
                borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
    );
  }
}
