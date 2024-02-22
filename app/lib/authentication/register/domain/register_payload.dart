class RegisterPayload {
  RegisterPayload({
    this.name = '',
    this.lastName = '',
    this.phoneNumber = '',
    this.email = '',
  });
  
  final String name;
  final String lastName;
  final String phoneNumber;
  final String email;

  RegisterPayload copyWith(
    {
      String? name,
      String? lastName,
      String? phoneNumber,
      String? email,
    }
  ) {
    return RegisterPayload(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email:  email ?? this.email,
    );
  }
}