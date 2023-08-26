import 'package:flutter/material.dart';

import '../models/comment_model.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
    Key? key,
    required CommentModel? commentModel,
  })  : _commentModel = commentModel,
        super(key: key);

  final CommentModel? _commentModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _commentModel?.name ?? "",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(_commentModel?.email ?? ""),
            SizedBox(
              height: 10,
            ),
            Text(_commentModel?.body ?? ""),
          ],
        ),
      ),
    );
  }
}
