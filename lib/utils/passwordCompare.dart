///return true if password and confirmpassword is equal
///
///return fasle if password and confirmpassword is notequal
bool comparePassword(
    {required String password, required String comfirmPassword}) {
  if (password == comfirmPassword) {
    return true;
  } else
    return false;
}
