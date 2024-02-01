class CheckTokenRequest {
  const CheckTokenRequest({
    required this.otp,
    required this.username,
  });
  final String otp;
  final String username;
}
