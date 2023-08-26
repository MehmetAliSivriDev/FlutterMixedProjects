import 'package:dio_provider_vs_calismasi/product/global/resource_context.dart';
import 'package:dio_provider_vs_calismasi/reqres_resource/service/reqres_service.dart';
import 'package:flutter/widgets.dart';

import '../reqres_resource/model/resource_model.dart';

class ReqResProvider extends ChangeNotifier {
  final IReqresService reqresService;
  List<Data> resources = [];
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  ReqResProvider(this.reqresService) {
    _fetch();
  }

  Future<void> _fetch() async {
    _changeLoading();
    resources = (await reqresService.fetchResourceItems())?.data ?? [];
    _changeLoading();
  }

  void saveToLocale(ResourceContext resourceContext) {
    resourceContext.saveModel(ResourceModel(data: resources));
  }
}
