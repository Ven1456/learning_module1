class AuthRepository
{
  Future<void> login() async
  {
    print("attempting Login");
    Future.delayed(const Duration(seconds: 3));
    print("Logged In");
  }
}