abstract class RegisterEvent {
  const RegisterEvent();
}

class UserNameEvent extends RegisterEvent {
  final String userName;
  const UserNameEvent(this.userName);
}
