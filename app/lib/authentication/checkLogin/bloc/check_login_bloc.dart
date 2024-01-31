import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'check_login_status.dart';

@injectable
class CheckLoginBloc extends Bloc<CheckLoginEvent, CheckLoginState> {
  CheckLoginBloc()
      : super(
          CheckLoginState(
            status: CheckLoginStatus.Idle,
          ),
        ) {
    on<ValidateOTP>(validateOtp);
  }

  void validateOtp(ValidateOTP event, Emitter<CheckLoginState> emit) async {
    try {
      emit(
        state.copyWith(
          status: CheckLoginStatus.VALIDATING_OTP,
        ),
      );

      await Future.delayed(
        Duration(
          seconds: 2,
        ),
      );

      emit(
        state.copyWith(
          status: CheckLoginStatus.VALIDATION_SUCCESS,
        ),
      );

      emit(
        state.copyWith(
          status: CheckLoginStatus.Idle,
        ),
      );
    } catch (exception) {}
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
  });

  final String otp;
}
