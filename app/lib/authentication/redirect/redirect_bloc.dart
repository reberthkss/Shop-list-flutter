import 'package:app/authentication/tools/token_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RedirectBloc extends Bloc<RedirectEvent, RedirectState> {
  RedirectBloc(
    this.tokenPreferences,
  ) : super(const RedirectState()) {
    on<RequestRedirect>(onRequestRedirect);
  }

  final TokenPreferences tokenPreferences;

  void onRequestRedirect(
      RedirectEvent event, Emitter<RedirectState> emit) async {
    try {
      final accessToken = await tokenPreferences.getAccessToken();

      emit(
        state.copyWith(
          accessToken.isNotEmpty
              ? RedirectDestination.Home
              : RedirectDestination.Login,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          RedirectDestination.Login,
        ),
      );
    }
  }
}

abstract class RedirectEvent {}

class RequestRedirect extends RedirectEvent {}

class RedirectState {
  const RedirectState({this.destination});

  final RedirectDestination? destination;

  RedirectState copyWith(RedirectDestination? destination) {
    return RedirectState(destination: destination ?? this.destination);
  }
}

enum RedirectDestination { Login, Home }
