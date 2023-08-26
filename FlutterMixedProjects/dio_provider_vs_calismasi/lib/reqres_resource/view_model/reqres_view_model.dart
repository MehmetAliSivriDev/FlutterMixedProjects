import 'package:dio_provider_vs_calismasi/product/Generics/loading_state.dart';
import 'package:dio_provider_vs_calismasi/product/service/project_dio.dart';
import 'package:dio_provider_vs_calismasi/reqres_resource/model/resource_model.dart';
import 'package:dio_provider_vs_calismasi/reqres_resource/service/reqres_service.dart';
import 'package:dio_provider_vs_calismasi/reqres_resource/view/reqres_view.dart';

abstract class ReqResViewModel extends LoadingState<ReqResView>
    with ProjectDioMixin {
  late final IReqresService reqresService;
  List<Data> resources = [];

  @override
  void initState() {
    reqresService = ReqresService(service);
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await reqresService.fetchResourceItems())?.data ?? [];
    changeLoading();
  }
}
