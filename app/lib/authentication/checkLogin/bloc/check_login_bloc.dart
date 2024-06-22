import 'package:shop_list/authentication/checkLogin/domain/check_token_request.dart';
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
    String? accessToken;
    try {
      emit(
        state.copyWith(
          status: CheckLoginStatus.validatingOTP,
        ),
      );

      accessToken = await interactor.checkToken(
        CheckTokenRequest(
          otp: event.otp,
          username: event.username,
          url: event.url,
        ),
      );

      emit(
        state.copyWith(
          status: CheckLoginStatus.validationSuccess,
          accessToken: accessToken,
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
          accessToken: accessToken,
        ),
      );
    }
  }
}

class CheckLoginState {
  const CheckLoginState({
    required this.status,
    this.accessToken,
  });

  final CheckLoginStatus status;
  final String? accessToken;

  CheckLoginState copyWith({CheckLoginStatus? status, String? accessToken}) {
    return CheckLoginState(
      status: status ?? this.status,
      accessToken: accessToken ?? this.accessToken,
    );
  }
}

abstract class CheckLoginEvent {}

class ValidateOTP extends CheckLoginEvent {
  ValidateOTP({required this.otp, required this.username, required this.url});

  final String otp;
  final String username;
  final String url;
}
