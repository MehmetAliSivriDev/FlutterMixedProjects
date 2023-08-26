import 'package:dio_services_usage_jsonplaceholder/models/post_model.dart';
import 'package:dio_services_usage_jsonplaceholder/screens/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../services/post_service.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final TextEditingController _titleTextEditingController =
      TextEditingController();

  final TextEditingController _bodyTextEditingController =
      TextEditingController();

  final TextEditingController _userIdTextEditingController =
      TextEditingController();

  bool _isLoading = false;
  late final IPostService postService;
  @override
  void initState() {
    postService = PostService();
    super.initState();
  }

  Future<void> _addPostItem(PostModel postModel) async {
    _changeLoadingStatus();
    var response = await postService.addItemtoService(postModel);

    if (response) {
      AlertDialog alertDialog = const AlertDialog(
        title: Text("Adding Post"),
        content: Text("Post Added Successfully!"),
      );
      showDialog(context: context, builder: (_) => alertDialog);
    }

    _changeLoadingStatus();
  }

  void _changeLoadingStatus() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _isLoading ? CircularProgressIndicator.adaptive() : SizedBox.shrink()
        ],
        title: Text("Add Post"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
        child: Column(
          children: [
            TextField(
              textInputAction: TextInputAction.next,
              controller: _titleTextEditingController,
              decoration: InputDecoration(
                  labelText: 'Title', border: OutlineInputBorder()),
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              textInputAction: TextInputAction.next,
              controller: _bodyTextEditingController,
              decoration: InputDecoration(
                  labelText: 'Body', border: OutlineInputBorder()),
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _userIdTextEditingController,
              decoration: InputDecoration(
                  labelText: 'UserId', border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : () {
                        if (_titleTextEditingController.text.isNotEmpty &&
                            _bodyTextEditingController.text.isNotEmpty &&
                            _userIdTextEditingController.text.isNotEmpty) {
                          final model = PostModel(
                              title: _titleTextEditingController.text,
                              body: _bodyTextEditingController.text,
                              userId: int.tryParse(
                                  _userIdTextEditingController.text));

                          _addPostItem(model);
                        }
                      },
                child: Text("Add Post"))
          ],
        ),
      ),
    );
  }
}
