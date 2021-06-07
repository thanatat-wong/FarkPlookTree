class LoginFreshWords {
  String loginWith;
  String login;
  String exploreApp;
  String notAccount;
  String signUp;
  String textLoading;
  String hintLoginUser;
  String hintLoginPassword;
  String hintSignUpRepeatPassword;
  String hintName;
  String hintSurname;

  String recoverPassword;

  String messageRecoverPassword;

  LoginFreshWords(
      {this.loginWith = 'เข้าสู่ระบบด้วย',
      this.hintName = 'Name',
      this.hintSurname = 'Surname',
      this.hintSignUpRepeatPassword = 'Repeat Password',
      this.hintLoginPassword = 'Password',
      this.recoverPassword = 'ลืมรหัสผ่าน',
      this.messageRecoverPassword =
          'To recover the password, enter the email and press send email, you will receive an email so you can update your password. Only available for accounts created by username and password',
      this.hintLoginUser = 'Username or email',
      this.login = 'Login',
      this.exploreApp = 'เข้าสู่ระบบแบบไม่ระบุตัวตน',
      this.notAccount = 'หากยังไม่มีบัญชีผู้ใช้',
      this.signUp = 'สมัครสมาชิก',
      this.textLoading = 'please wait ...'});
}
