import 'package:app/authentication/checkLogin/domain/check_token_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../domain/check_token_interactor.dart';
import 'check_login_status.dart';

@injectable
class CheckLoginBloc extends Bloc<CheckLoginEvent, CheckLoginState> {
  CheckLoginBloc(
    this.interactor,
  ) : super(
          const CheckLoginState(
            status: CheckLoginStatus.idle,
          ),
        ) {
    on<ValidateOTP>(validateOtp);
  }

  final CheckTokenInteractor interactor;

  void validateOtp(ValidateOTP event, Emitter<CheckLoginState> emit) async {
    try {
      emit(
        state.copyWith(
          status: CheckLoginStatus.validatingOTP,
        ),
      );

      await interactor.checkToken(CheckTokenRequest(
        otp: event.otp,
        username: event.username,
      ));

      emit(
        state.copyWith(
          status: CheckLoginStatus.validationSuccess,
        ),
      );
    } catch (exception) {
      print(
        exception,
      );
    } finally {
      emit(
        state.copyWith(
          status: CheckLoginStatus.idle,
        ),
      );
    }
  }
}

class CheckLoginState {
  const CheckLoginState({
    required this.status,
  });

  final CheckLoginStatus status;

  CheckLoginState copyWith({CheckLoginStatus? status}) {
    return CheckLoginState(
      status: status ?? this.status,
    );
  }
}

abstract class CheckLoginEvent {}

class ValidateOTP extends CheckLoginEvent {
  ValidateOTP({
    required this.otp,
    required this.username,
  });

  final String otp;
  final String username;
}
