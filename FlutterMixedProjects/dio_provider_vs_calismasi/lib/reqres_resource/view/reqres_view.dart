import 'package:dio_provider_vs_calismasi/product/extensions/string_extensions.dart';
import 'package:dio_provider_vs_calismasi/reqres_resource/view_model/reqres_view_model.dart';
import 'package:flutter/material.dart';

class ReqResView extends StatefulWidget {
  const ReqResView({super.key});

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

class _ReqResViewState extends ReqResViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading ? const CircularProgressIndicator() : null,
      ),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (context, index) {
          return Card(
              color: Color(resources[index].color.colorValue),
              child: Text(resources[index].name ?? ''));
        },
      ),
    );
  }
}
