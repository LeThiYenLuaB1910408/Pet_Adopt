import 'package:pet_adopt/const.dart';
import 'package:pet_adopt/models/managers/owner_manager.dart';
import 'package:pet_adopt/models/pets_model.dart';

String desc =
    'This cat is a domestic species of small carnivorous mammal. It is the only domesticated species in the family Felidae and is often reffered to as the domestic cat to distinguish it from the wild members of the family. A cat can either be a house cat, a farm cat or a feral cat, the latter rangers freely and avoids human contacts. Domestic cats are valued by humans for companionship and their ability to kill redonts. About 60 cat breeds are recognized by various cat registries.';
var ownersManager = OwnerManager();

class PetsManager {
  final List<Pet> _cats = [
    Pet(
        fav: true,
        color: orange,
        name: 'Leo',
        description: desc,
        location: 'Dumai, Riau',
        sex: 'Male',
        age: 2.1,
        weight: 4.5,
        image: 'assets/cats/cat1.png',
        distance: 7,
        owner: ownersManager.owners[0]),
    Pet(
        fav: false,
        color: green,
        name: 'Lily',
        description: desc,
        location: 'Siak, Riau',
        sex: 'Female',
        age: 1.2,
        image: 'assets/cats/cat2.png',
        weight: 2.6,
        distance: 5,
        owner: ownersManager.owners[1]),
    Pet(
        fav: true,
        color: blue,
        name: 'Cleo',
        image: 'assets/cats/cat3.png',
        description: desc,
        location: 'Pekanbaru, Riau',
        sex: 'Male',
        age: 1.4,
        weight: 3.4,
        distance: 7,
        owner: ownersManager.owners[2]),
    Pet(
        fav: true,
        color: red,
        image: 'assets/cats/cat4.png',
        name: 'Milo',
        description: desc,
        location: 'Kampar, Riau',
        sex: 'Female',
        age: 1.1,
        weight: 3.2,
        distance: 11,
        owner: ownersManager.owners[0]),
  ];

  final List<Pet> _dogs = [
    Pet(
        fav: true,
        color: orange,
        name: 'Leo',
        description: desc,
        location: 'Dumai, Riau',
        sex: 'Male',
        age: 2.1,
        weight: 4.5,
        image: 'assets/dogs/dog_1.png',
        distance: 7,
        owner: ownersManager.owners[0]),
    Pet(
        fav: false,
        color: green,
        name: 'Lily',
        description: desc,
        location: 'Siak, Riau',
        sex: 'Female',
        age: 1.2,
        image: 'assets/dogs/dog_2.png',
        weight: 2.6,
        distance: 5,
        owner: ownersManager.owners[1]),
    Pet(
        fav: true,
        color: blue,
        name: 'Cleo',
        image: 'assets/dogs/dog_3.png',
        description: desc,
        location: 'Pekanbaru, Riau',
        sex: 'Male',
        age: 1.4,
        weight: 3.4,
        distance: 7,
        owner: ownersManager.owners[2]),
    Pet(
        fav: true,
        color: red,
        image: 'assets/dogs/dog_4.png',
        name: 'Milo',
        description: desc,
        location: 'Kampar, Riau',
        sex: 'Female',
        age: 1.1,
        weight: 3.2,
        distance: 11,
        owner: ownersManager.owners[0]),
  ];

  final List<Pet> _hamsters = [
    Pet(
        fav: true,
        color: orange,
        name: 'Leo',
        description: desc,
        location: 'Dumai, Riau',
        sex: 'Male',
        age: 2.1,
        weight: 4.5,
        image: 'assets/hamsters/hamster1.png',
        distance: 7,
        owner: ownersManager.owners[0]),
    Pet(
        fav: false,
        color: green,
        name: 'Lily',
        description: desc,
        location: 'Siak, Riau',
        sex: 'Female',
        age: 1.2,
        image: 'assets/hamsters/hamster2.png',
        weight: 2.6,
        distance: 5,
        owner: ownersManager.owners[1]),
    Pet(
        fav: true,
        color: blue,
        name: 'Cleo',
        image: 'assets/hamsters/hamster3.png',
        description: desc,
        location: 'Pekanbaru, Riau',
        sex: 'Male',
        age: 1.4,
        weight: 3.4,
        distance: 7,
        owner: ownersManager.owners[2]),
    Pet(
        fav: true,
        color: red,
        image: 'assets/hamsters/hamster4.png',
        name: 'Milo',
        description: desc,
        location: 'Kampar, Riau',
        sex: 'Female',
        age: 1.1,
        weight: 3.2,
        distance: 11,
        owner: ownersManager.owners[0]),
  ];

  List<Pet> get cats {
    return [..._cats];
  }

  List<Pet> getListPet(String name) {
    if (name == "Cats") {
      return _cats;
    } else if (name == "Dogs") {
      return _dogs;
    } else if (name == "Hamsters") {
      return _hamsters;
    }
    return _cats;
  }

  List<Pet> get favoriteCats {
    return _cats.where((prodItem) => prodItem.fav).toList();
  }

  List<Pet> get favoriteDogs {
    return _dogs.where((prodItem) => prodItem.fav).toList();
  }

  List<Pet> get favoriteHamsters {
    return _hamsters.where((prodItem) => prodItem.fav).toList();
  }
}
