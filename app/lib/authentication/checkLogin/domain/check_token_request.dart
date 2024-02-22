class CheckTokenRequest {
  const CheckTokenRequest({
    required this.otp,
    required this.username,
    required this.url,
  });
  final String otp;
  final String username;
  final String url;
}
