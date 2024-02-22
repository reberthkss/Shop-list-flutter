import 'package:app/authentication/register/presentation/register_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../domain/register_interactor.dart';
import '../domain/register_payload.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(
    this.interactor,
  ) : super(
          const RegisterState(
            status: RegisterStatus.idle,
          ),
        ) {
    on<Register>(register);
  }

  final RegisterInteractor interactor;

  void register(Register event, Emitter<RegisterState> emit) async {
    try {
      emit(
        state.copyWith(
          status: RegisterStatus.sendingForm,
          payload: event.payload,
        ),
      );
      await interactor.register(
        event.payload,
      );
      emit(
        state.copyWith(
          status: RegisterStatus.goToOtp,
        ),
      );
    } catch (exception) {
      print(exception);
    } finally {
      emit(
        state.copyWith(
          status: RegisterStatus.idle,
        ),
      );
    }
  }
}

abstract class RegisterEvent {}

class Register extends RegisterEvent {
  Register({
    required this.payload,
  });

  final RegisterPayload payload;
}

class RegisterState {
  const RegisterState({
    required this.status,
    this.payload,
  });

  final RegisterStatus status;
  final RegisterPayload? payload;

  RegisterState copyWith({
    RegisterStatus? status,
    RegisterPayload? payload,
  }) {
    return RegisterState(
      status: status ?? this.status,
      payload: payload ?? this.payload,
    );
  }
}
