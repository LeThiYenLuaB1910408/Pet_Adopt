import 'package:pet_adopt/models/auth_token.dart';
import 'package:pet_adopt/models/managers/auth_manager.dart';
import 'package:pet_adopt/models/owner_model.dart';
import 'package:flutter/foundation.dart';
import 'package:pet_adopt/services/owner_service.dart';

var accountsManager = AuthManager();

class OwnerManager with ChangeNotifier {
  List<Owner> _owners = [
    // Owner(
    //   id: 'owner1',
    //   name: 'Sophia',
    //   image: 'assets/owners/woman-with-cat1.png',
    // ),
    // Owner(
    //   id: 'owner2',
    //   name: 'Annie',
    //   image: 'assets/owners/woman-with-cat2.png',
    // ),
    // Owner(
    //   id: 'owner3',
    //   name: 'Jessica',
    //   image: 'assets/owners/woman-with-cat3.png',
    // ),
    // Owner(
    //   id: 'owner4',
    //   name: 'Julie',
    //   image: 'assets/owners/woman-with-dog1.png',
    // ),
    // Owner(
    //   id: 'owner5',
    //   name: 'Jackson',
    //   image: 'assets/owners/man-with-dog2.png',
    // ),
    // Owner(
    //   id: 'owner6',
    //   name: 'Mary',
    //   image: 'assets/owners/woman-with-dog3.png',
    // ),
    // Owner(
    //   id: 'owner7',
    //   name: 'Min',
    //   image: 'assets/owners/man-with-dog4.png',
    // ),
  ];

  final OwnersService _ownersService;

  OwnerManager([AuthToken? authToken])
      : _ownersService = OwnersService(authToken);

  set authToken(AuthToken? authToken) {
    _ownersService.authToken = authToken;
  }

  Future<void> fetchOwners([bool filterByUser = false]) async {
    _owners = await _ownersService.fetchOwners(filterByUser);
    notifyListeners();
  }

  Future<void> addOwner(Owner owner, AuthToken token) async {
    final newOwner = await _ownersService.addOwner(owner, token);
    if (newOwner != null) {
      _owners.add(newOwner);
      notifyListeners();
    }
  }

  Future<void> updateOwner(Owner owner) async {
    final index = _owners.indexWhere((item) => item.id == owner.id);
    if (index >= 0) {
      if (await _ownersService.updateOwner(owner)) {
        _owners[index] = owner;
        notifyListeners();
      }
    }
  }

  int get itemCount {
    return _owners.length;
  }

  List<Owner> get owners {
    return [..._owners];
  }

  Owner findById(String id) {
    return _owners.firstWhere((prod) => prod.id == id);
  }

  // Owner? auth(String username, String password) {
  //   var res = accountsManager
  //       .findAccount(Accounts(username: username, password: password));
  //   if (res != null) {
  //     return _owners
  //         .firstWhere((element) => element.accounts.username == res.username);
  //   }
  //   return null;
  // }

  // bool addOwner(String username, String password) {
  //   var res = accountsManager
  //       .addAccount(Accounts(username: username, password: password));
  //   if (res == true) {
  //     return true;
  //   }
  //   return false;
  // }
}
