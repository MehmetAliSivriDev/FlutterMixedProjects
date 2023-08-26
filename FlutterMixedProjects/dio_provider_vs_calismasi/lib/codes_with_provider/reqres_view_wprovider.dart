import 'package:dio_provider_vs_calismasi/codes_with_provider/reqres_provider.dart';
import 'package:dio_provider_vs_calismasi/codes_with_provider/resource_context_view.dart';
import 'package:dio_provider_vs_calismasi/product/extensions/string_extensions.dart';
import 'package:dio_provider_vs_calismasi/product/global/resource_context.dart';
import 'package:dio_provider_vs_calismasi/product/global/theme_notifier.dart';
import 'package:dio_provider_vs_calismasi/product/service/project_dio.dart';
import 'package:dio_provider_vs_calismasi/reqres_resource/service/reqres_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../reqres_resource/model/resource_model.dart';

class ReqResViewWProvider extends StatefulWidget {
  const ReqResViewWProvider({super.key});

  @override
  State<ReqResViewWProvider> createState() => _ReqResViewWProviderState();
}

class _ReqResViewWProviderState extends State<ReqResViewWProvider>
    with ProjectDioMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReqResProvider(ReqresService(service)),
      builder: (context, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.change_circle,
              size: 45,
            ),
            onPressed: () {
              context.read<ThemeNotifier>().changeTheme();
            },
          ),
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    context
                        .read<ReqResProvider>()
                        .saveToLocale(context.read<ResourceContext>());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ResourceContextView()));
                  },
                  icon: const Icon(Icons.save_alt_rounded))
            ],
            title: context.watch<ReqResProvider>().isLoading
                ? const CircularProgressIndicator()
                : null,
          ),
          body: Column(
            children: [
              Selector<ReqResProvider, bool>(
                builder: (context, value, child) {
                  return value ? const Placeholder() : const Text("data");
                },
                selector: (context, provider) {
                  return provider.isLoading;
                },
              ),
              Expanded(
                child: _resourcesListView(
                    context, context.watch<ReqResProvider>().resources),
              ),
            ],
          ),
        );
      },
    );
  }

  ListView _resourcesListView(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemCount: context.watch<ReqResProvider>().resources.length,
      itemBuilder: (context, index) {
        return Card(
            color: Color(items[index].color?.colorValue ?? 0),
            child: Text(items[index].name ?? ''));
      },
    );
  }
}
