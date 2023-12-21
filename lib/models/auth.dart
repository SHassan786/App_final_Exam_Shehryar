class AuthUser {
  final String email;
  final String password;
  final String retypePassword;

  AuthUser({
    required this.email,
    required this.password,
    required this.retypePassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'retypePassword': retypePassword,
    };
  }

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
      email: json['email'],
      password: json['password'],
      retypePassword: json['retypePassword'],
    );
  }
}
