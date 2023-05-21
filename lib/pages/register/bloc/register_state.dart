class RegisterState {
  final String userName;
  final String email;
  final String password;
  final String rePassword;
  RegisterState(
    this.userName,
    this.email,
    this.password,
    this.rePassword,
  );

  RegisterState copyWith({
    String? userName,
    String? email,
    String? password,
    String? rePassword,
  }) {
    return RegisterState(
      userName ?? this.userName,
      email ?? this.email,
      password ?? this.password,
      rePassword ?? this.rePassword,
    );
  }
}
