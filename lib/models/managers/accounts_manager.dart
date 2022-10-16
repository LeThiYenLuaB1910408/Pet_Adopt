import 'package:pet_adopt/models/accounts_model.dart';

class AccountsManager {
  final List<Accounts> _accounts = [
    Accounts(username: "quoctrang", password: "123456"),
    Accounts(username: "quoctrang", password: "123456"),
    Accounts(username: "quoctrang", password: "123456"),
  ];
  List<Accounts> get accounts {
    return _accounts;
  }

  Accounts? findAccount(Accounts account) {
    var result = _accounts.firstWhere(
        (props) => props.username == account.username,
        orElse: () => Accounts(username: '', password: ''));
    if (result.password == account.password) {
      return result;
    }
    return null;
  }
}
