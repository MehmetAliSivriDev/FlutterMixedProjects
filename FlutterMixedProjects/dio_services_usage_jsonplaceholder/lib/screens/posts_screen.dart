import 'package:dio_services_usage_jsonplaceholder/models/post_model.dart';
import 'package:dio_services_usage_jsonplaceholder/screens/add_post_screen.dart';
import 'package:dio_services_usage_jsonplaceholder/screens/comment_screen.dart';
import 'package:dio_services_usage_jsonplaceholder/services/post_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/post_card.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<PostModel>? _items;
  late final IPostService postService;
  bool _isLoading = false;

  @override
  void initState() {
    postService = PostService();
    super.initState();
    _fetchPostItems();
  }

  void _changeLoadingStatus() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _fetchPostItems() async {
    _changeLoadingStatus();
    _items = await postService.fetchPostItems();
    _changeLoadingStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddPostScreen()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Posts"),
        centerTitle: true,
        actions: [
          _isLoading ? CircularProgressIndicator.adaptive() : SizedBox.shrink()
        ],
      ),
      body: ListView.builder(
        itemCount: _items?.length ?? 0,
        itemBuilder: (context, index) {
          return PostCard(
            postModel: _items?[index],
          );
        },
      ),
    );
  }
}
