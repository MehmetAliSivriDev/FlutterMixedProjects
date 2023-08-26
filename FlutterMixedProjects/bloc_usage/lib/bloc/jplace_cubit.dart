import 'package:bloc_usage/bloc/jplace_repository.dart';
import 'package:bloc_usage/bloc/jplace_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JplaceCubit extends Cubit<JplaceState> {
  JplaceCubit(this._jplaceRepository) : super(const JplaceInitial());

  final JplaceRepository _jplaceRepository;

  Future<void> fetchData() async {
    try {
      emit(const JplaceLoading());
      await Future.delayed(const Duration(seconds: 1));
      final response = await _jplaceRepository.fetchData();
      emit(JplaceCompleted(response));
    } on CustomError catch (e) {
      emit(JplaceError(e.toString()));
    }
  }
}
