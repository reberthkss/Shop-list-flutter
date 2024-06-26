import 'package:shop_list/authentication/login/domain/model/sign_in_request.dart';
import 'package:shop_list/authentication/login/domain/sign_in_interactor.dart';
import 'package:shop_list/authentication/login/domain/sign_in_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../route/route_list.dart';
import '../domain/navigation_action.dart';

@injectable
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(
    this.routeList,
    this.interactor,
  ) : super(
          const SignInState(
            status: SignInStatus.idle,
          ),
        ) {
    on<DoSignIn>(doLogin);
  }

  final RouteList routeList;
  final SignInInteractor interactor;

  void doLogin(DoSignIn event, Emitter<SignInState> emit) async {
    try {
      emit(
        state.copyWith(
          status: SignInStatus.signing,
        ),
      );
      await interactor.signIn(
        SignInRequest(
          phoneNumber: event.phoneNumber,
        ),
      );
      emit(
        state.copyWith(
          navigationAction: NavigationAction(
            action: NavigationActionType.pushTo,
            value: routeList.authenticationList.goToSignInOtp(
              event.phoneNumber,
            ),
          ),
        ),
      );
    } catch (exception) {
      print(exception);
    } finally {
      emit(
        state.copyWith(
          navigationAction: null,
          status: SignInStatus.idle,
        ),
      );
    }
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

class DoSignIn extends SignInEvent {
  DoSignIn({
    required this.phoneNumber,
  });

  final String phoneNumber;
}
