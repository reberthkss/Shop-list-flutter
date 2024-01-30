import 'package:app/authentication/checkLogin/domain/sign_in_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../route/route_list.dart';
import 'navigation_action.dart';

@injectable
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(
    this.routeList,
  ) : super(
          const SignInState(
            status: SignInStatus.IDLE,
          ),
        ) {
    on<SubmitFormEvent>(doLogin);
  }

  final RouteList routeList;

  void doLogin(SubmitFormEvent event, Emitter<SignInState> emit) async {
    try {
      emit(
        state.copyWith(
          status: SignInStatus.SIGNING,
        ),
      );
      await Future.delayed(
        Duration(
          seconds: 2,
        ),
      );
      emit(
        state.copyWith(
          navigationAction: NavigationAction(
            action: NavigationActionType.PUSH_TO,
            value: routeList.authenticationList.goToSignInOtp(),
          ),
          status: SignInStatus.IDLE,
        ),
      );
    } catch (exception) {}
  }
}

abstract class SignInEvent {}

class SignInState {
  const SignInState({
    required this.status,
    this.navigationAction,
  });

  final SignInStatus status;
  final NavigationAction? navigationAction;

  SignInState copyWith({
    SignInStatus? status,
    NavigationAction? navigationAction,
  }) {
    return SignInState(
      status: status ?? this.status,
      navigationAction: navigationAction ?? this.navigationAction,
    );
  }
}

class SubmitFormEvent extends SignInEvent {}
