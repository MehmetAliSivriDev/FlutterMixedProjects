import 'package:flutter/material.dart';
import 'package:image_picker_with_mobx/utility/image_upload_manager.dart';
import 'package:image_picker_with_mobx/view_model/image_upload_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final _imageUploadViewModel = ImageUploadViewModel();
  final _imageUploadManager = ImageUploadManager();

  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _imageUploadViewModel.saveDataToService();
            animationController
              ..duration = const Duration(seconds: 1)
              ..forward(from: _imageUploadViewModel.send.toDouble());
          },
          child: const Icon(Icons.save),
        ),
        appBar: AppBar(
          title: const Text("Image Upload"),
          actions: [
            Observer(builder: (_) {
              return _imageUploadViewModel.isLoading
                  ? const CircularProgressIndicator()
                  : const SizedBox.shrink();
            }),
            Observer(builder: (_) {
              return Text(_imageUploadViewModel.downloadText);
            })
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Card(
                elevation: 20,
                child: Row(
                  children: [
                    Expanded(
                      child: IconButton(
                          onPressed: () async {
                            _imageUploadViewModel.saveLocal(
                                await _imageUploadManager.fetchFromLibrary());
                          },
                          icon: const Icon(Icons.upload)),
                    ),
                    Expanded(
                      child: Observer(builder: (context) {
                        return _imageUploadViewModel.file != null
                            ? Image.file(_imageUploadViewModel.file!)
                            : const SizedBox();
                      }),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            Expanded(
                flex: 4,
                child: Lottie.asset('assets/lottie/lottie_upload_bar.json',
                    animate: false,
                    repeat: false,
                    controller: animationController))
          ],
        ));
  }
}
