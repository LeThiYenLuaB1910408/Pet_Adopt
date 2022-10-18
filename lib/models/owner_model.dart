import 'package:pet_adopt/models/accounts_model.dart';

class Owner {
  final String name, image;
  final Accounts accounts;

  Owner({
    required this.name,
    required this.image,
    required this.accounts,
  });
}
