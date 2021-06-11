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
          'ในการกู้คืนรหัสผ่าน ทางระบบจะส่งอีเมลล์สำหรับกู้คืนรหัสผ่านไปยัง\nอีเมลล์ที่ท่านใช้สมัครสมาชิกโปรดระบุอีเมลล์หรือชื่อผู้ใช้ของท่านและตรวจสอบที่กล่องข้อความ หลังจากกดปุ่มกู้คืนรหัสผ่าน',
      this.hintLoginUser = 'Username or email',
      this.login = 'เข้าสู่ระบบ',
      this.exploreApp = 'เข้าสู่ระบบแบบไม่ระบุตัวตน',
      this.notAccount = 'หากยังไม่มีบัญชีผู้ใช้',
      this.signUp = 'สมัครสมาชิก',
      this.textLoading = 'กรุณารอสักครู่ ...'});
}
