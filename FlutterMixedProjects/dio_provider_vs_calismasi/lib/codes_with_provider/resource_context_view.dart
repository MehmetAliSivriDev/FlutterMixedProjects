import 'package:dio_provider_vs_calismasi/product/global/resource_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ResourceContextView extends StatefulWidget {
  const ResourceContextView({super.key});

  @override
  State<ResourceContextView> createState() => _ResourceContextViewState();
}

class _ResourceContextViewState extends State<ResourceContextView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            context.read<ResourceContext>().model?.data?.length.toString() ??
                ""),
      ),
    );
  }
}
