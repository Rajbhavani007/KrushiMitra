import 'dart:io';

import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  List<String> _comment = [];
bool require = false;
  void _addComment(String val) {
    setState(() {
      _comment.add(val);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comment"),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: _buildCommnetList(),
        ),
        TextField(
          onSubmitted : (String submit) {
            _addComment(submit);
          },
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(20),
              hintText: "Add Comment Here......",hintStyle:TextStyle(color: Colors.red),
        ))
      ]),
    );
  }



  _buildCommnetList() {
    return ListView.builder(itemBuilder: (context, index) {
      if (index < _comment.length) {
        
        return _buildCommentItem(_comment[index]);
      }
    });
  }

  _buildCommentItem(String comment) {
    return ListTile(title: Text(comment));
    
  }
}
