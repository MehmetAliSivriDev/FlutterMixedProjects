import 'package:bloc_usage/model/jplace_model.dart';

abstract class JplaceState {
  const JplaceState();
}

class JplaceInitial extends JplaceState {
  const JplaceInitial();
}

class JplaceLoading extends JplaceState {
  const JplaceLoading();
}

class JplaceCompleted extends JplaceState {
  final List<Jplace> response;
  const JplaceCompleted(this.response);
}

class JplaceError extends JplaceState {
  final String message;
  const JplaceError(this.message);
}
