import 'package:dio_services_usage_jsonplaceholder/models/comment_model.dart';
import 'package:dio_services_usage_jsonplaceholder/services/post_service.dart';
import 'package:dio_services_usage_jsonplaceholder/widgets/comment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key, this.postId});
  final int? postId;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  List<CommentModel>? _commentItems;
  late final IPostService postService;
  bool _isLoading = false;

  @override
  void initState() {
    postService = PostService();
    super.initState();
    _fetchCommentItems(widget.postId ?? 0);
  }

  void _changeLoadingStatus() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _fetchCommentItems(int postId) async {
    _changeLoadingStatus();
    _commentItems = await postService.fetchCommentItems(postId);
    _changeLoadingStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
        centerTitle: true,
        actions: [
          _isLoading ? CircularProgressIndicator.adaptive() : SizedBox.shrink()
        ],
      ),
      body: ListView.builder(
        itemCount: _commentItems?.length ?? 0,
        itemBuilder: (context, index) {
          return CommentCard(commentModel: _commentItems?[index]);
        },
      ),
    );
  }
}
