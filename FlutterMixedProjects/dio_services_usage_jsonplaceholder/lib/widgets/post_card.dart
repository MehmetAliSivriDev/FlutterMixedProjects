import 'package:dio_services_usage_jsonplaceholder/services/post_service.dart';
import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../screens/comment_screen.dart';

class PostCard extends StatefulWidget {
  const PostCard({
    Key? key,
    required PostModel? postModel,
  })  : _postModel = postModel,
        super(key: key);

  final PostModel? _postModel;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late final IPostService postService;

  @override
  void initState() {
    postService = PostService();
    super.initState();
  }

  Future<void> _detelePostItems(int id) async {
    var response = await postService.deleteItemToService(id);

    if (response) {
      AlertDialog alertDialog = AlertDialog(
        title: Text("Delete Post Item"),
        content: Text("The Post Item Deleted Successfully!"),
      );
      showDialog(context: context, builder: (_) => alertDialog);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CommentScreen(
                    postId: widget._postModel?.id,
                  )));
        },
        title: Text(widget._postModel?.title ?? ""),
        subtitle: Text(widget._postModel?.body ?? ""),
        trailing: IconButton(
            onPressed: () {
              _detelePostItems(widget._postModel?.id ?? 0);
            },
            icon: Icon(Icons.delete)),
      ),
    );
  }
}
