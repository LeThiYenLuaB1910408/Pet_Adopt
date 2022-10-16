import 'package:pet_adopt/models/managers/accounts_manager.dart';
import 'package:pet_adopt/models/accounts_model.dart';
import 'package:pet_adopt/models/owner_model.dart';

var accountsManager = AccountsManager();

class OwnerManager {
  final List<Owner> _owners = [
    Owner(
      name: 'Sophia',
      image: 'assets/owners/woman-with-cat1.png',
      accounts: accountsManager.accounts[0],
    ),
    Owner(
      name: 'Annie',
      image: 'assets/owners/woman-with-cat2.png',
      accounts: accountsManager.accounts[1],
    ),
    Owner(
      name: 'Jessica',
      image: 'assets/owners/woman-with-cat3.png',
      accounts: accountsManager.accounts[2],
    ),
  ];
  List<Owner> get owners {
    return [..._owners];
  }

  Owner? auth(String username, String password) {
    var res = accountsManager
        .findAccount(Accounts(username: username, password: password));
    if (res != null) {
      return _owners
          .firstWhere((element) => element.accounts.username == res.username);
    }
    return null;
  }
}
