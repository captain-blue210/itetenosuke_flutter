import 'package:itete_no_suke/model/user/user_repository_interface.dart';

class UserRepositoryMock implements UserRepositoryInterface {
  @override
  String getCurrentUser() {
    return '7aBf5FD2ABiJght3jp0c';
  }
}
