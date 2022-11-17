import 'package:flutter/foundation.dart';
import 'package:pet_adopt/const.dart';
import 'package:pet_adopt/models/auth_token.dart';
import 'package:pet_adopt/models/managers/owner_manager.dart';
import 'package:pet_adopt/models/pets_model.dart';
import 'package:pet_adopt/services/pet_service.dart';

String desc =
    'This cat is a domestic species of small carnivorous mammal. It is the only domesticated species in the family Felidae and is often reffered to as the domestic cat to distinguish it from the wild members of the family. A cat can either be a house cat, a farm cat or a feral cat, the latter rangers freely and avoids human contacts. Domestic cats are valued by humans for companionship and their ability to kill redonts. About 60 cat breeds are recognized by various cat registries. ';
String title =
    'This dog is a domestic species of small carnivorous mammal. It is the only domesticated species in the family Felidae and is often reffered to as the domestic dog to distinguish it from the wild members of the family. A dog can either be a house dog, a farm dog or a feral dog, the latter rangers freely and avoids human contacts. Domestic dogs are valued by humans for companionship and their ability to kill redonts. About 60 dog breeds are recognized by various dog registries. ';
String tl =
    'This hamster is a domestic species of small carnivorous mammal. It is the only domesticated species in the family Felidae and is often reffered to as the domestic hamster to distinguish it from the wild members of the family. A hamster can either be a house hamster, a farm hamster or a feral hamster, the latter rangers freely and avoids human contacts. Domestic hamsters are valued by humans for companionship and their ability to kill redonts. About 60 hamster breeds are recognized by various hamster registries. ';
var ownersManager = OwnerManager();

class PetsManager with ChangeNotifier {
  // final List<Pet> _cats = [
  //   Pet(
  //       fav: true,
  //       color: orange,
  //       name: 'Leo',
  //       description: desc,
  //       location: 'Cai Rang, Can Tho',
  //       sex: 'Male',
  //       age: 2.1,
  //       weight: 4.5,
  //       image: 'assets/cats/cat1.png',
  //       distance: 5,
  //       owner: ownersManager.owners[0]),
  //   Pet(
  //       fav: true,
  //       color: green,
  //       name: 'Lily',
  //       description: desc,
  //       location: 'Binh Thuy, Can Tho',
  //       sex: 'Female',
  //       age: 1.2,
  //       image: 'assets/cats/cat2.png',
  //       weight: 2.6,
  //       distance: 15,
  //       owner: ownersManager.owners[1]),
  //   Pet(
  //       fav: false,
  //       color: blue,
  //       name: 'Cleo',
  //       image: 'assets/cats/cat3.png',
  //       description: desc,
  //       location: 'Phong Dien, Can Tho',
  //       sex: 'Male',
  //       age: 1.4,
  //       weight: 3.4,
  //       distance: 7,
  //       owner: ownersManager.owners[2]),
  //   Pet(
  //       fav: true,
  //       color: red,
  //       image: 'assets/cats/cat4.png',
  //       name: 'Milo',
  //       description: desc,
  //       location: 'Ninh Kieu, Can Tho',
  //       sex: 'Female',
  //       age: 1.1,
  //       weight: 3.2,
  //       distance: 2,
  //       owner: ownersManager.owners[0]),
  // ];

  // final List<Pet> _dogs = [
  //   Pet(
  //       fav: true,
  //       color: orange,
  //       name: 'Milo',
  //       description: title,
  //       location: 'Cai Rang, Can Tho',
  //       sex: 'Male',
  //       age: 2,
  //       weight: 5,
  //       image: 'assets/dogs/dog_1.png',
  //       distance: 5,
  //       owner: ownersManager.owners[3]),
  //   Pet(
  //       fav: true,
  //       color: green,
  //       name: 'Leon',
  //       description: title,
  //       location: 'Binh Thuy, Can Tho',
  //       sex: 'Female',
  //       age: 1.5,
  //       image: 'assets/dogs/dog_2.png',
  //       weight: 12,
  //       distance: 15,
  //       owner: ownersManager.owners[4]),
  //   Pet(
  //       fav: false,
  //       color: blue,
  //       name: 'Hus',
  //       image: 'assets/dogs/dog_3.png',
  //       description: title,
  //       location: 'Phong Dien, Can Tho',
  //       sex: 'Male',
  //       age: 1,
  //       weight: 5,
  //       distance: 7,
  //       owner: ownersManager.owners[5]),
  //   Pet(
  //       fav: true,
  //       color: red,
  //       image: 'assets/dogs/dog_4.png',
  //       name: 'Bun',
  //       description: title,
  //       location: 'Ninh Kieu, Can Tho',
  //       sex: 'Female',
  //       age: 2.5,
  //       weight: 8,
  //       distance: 2,
  //       owner: ownersManager.owners[6]),
  // ];

  // final List<Pet> _hamsters = [
  //   Pet(
  //       fav: true,
  //       color: orange,
  //       name: 'ChuChi',
  //       description: tl,
  //       location: 'Cai Rang, Can Tho',
  //       sex: 'Male',
  //       age: 1,
  //       weight: 1.2,
  //       image: 'assets/hamsters/hamster1.png',
  //       distance: 5,
  //       owner: ownersManager.owners[0]),
  //   Pet(
  //       fav: true,
  //       color: green,
  //       name: 'Piu',
  //       description: tl,
  //       location: 'Binh Thuy, Can Tho',
  //       sex: 'Female',
  //       age: 1,
  //       image: 'assets/hamsters/hamster2.png',
  //       weight: 0.4,
  //       distance: 15,
  //       owner: ownersManager.owners[5]),
  //   Pet(
  //       fav: false,
  //       color: blue,
  //       name: 'Pin',
  //       image: 'assets/hamsters/hamster3.png',
  //       description: tl,
  //       location: 'Phong Dien, Can Tho',
  //       sex: 'Male',
  //       age: 1.5,
  //       weight: 0.8,
  //       distance: 7,
  //       owner: ownersManager.owners[4]),
  //   Pet(
  //       fav: true,
  //       color: red,
  //       image: 'assets/hamsters/hamster4.png',
  //       name: 'Mina',
  //       description: tl,
  //       location: 'Ninh Kieu, Can Tho',
  //       sex: 'Female',
  //       age: 1,
  //       weight: 1,
  //       distance: 2,
  //       owner: ownersManager.owners[6]),
  // ];

  // List<Pet> get pets {
  //   return [..._cats, ..._dogs, ..._hamsters];
  // }

  // List<Pet> get petIsfav{
  //   List <Pet> _pets = [..._cats, ..._dogs, ..._hamsters];
  //  return _pets.where((petItem) => petItem.isFavorite).toList();

  // }

  List<Pet> _pets = [];

  final PetsService _petsService;

  PetsManager([AuthToken? authToken]) : _petsService = PetsService(authToken);

  set authToken(AuthToken? authToken) {
    _petsService.authToken = authToken;
  }

  Future<void> fetchPets([bool filterByUser = false]) async {
    print(filterByUser);
    _pets = await _petsService.fetchPets(filterByUser);
    notifyListeners();
  }

  Future<void> addPet(Pet pet) async {
    final newPet = await _petsService.addPet(pet);
    if (newPet != null) {
      _pets.add(newPet);
      notifyListeners();
    }
  }

  Future<void> updatePet(Pet pet) async {
    final index = _pets.indexWhere((item) => item.id == pet.id);
    if (index >= 0) {
      if (await _petsService.updatePet(pet)) {
        _pets[index] = pet;
        notifyListeners();
      }
    }
  }

  Future<void> deletePet(String id) async {
    final index = _pets.indexWhere((item) => item.id == id);
    Pet? existingPet = _pets[index];
    _pets.removeAt(index);
    notifyListeners();

    if (!await _petsService.deletePet(id)) {
      _pets.insert(index, existingPet);
      notifyListeners();
    }
  }

  int get itemCount {
    return _pets.length;
  }

  List<Pet> get pets {
    return [..._pets];
  }

  List<Pet> get petIsfav {
    return _pets.where((pet) => pet.isFavorite).toList();
  }

  List<Pet> getListPet(String name) {
    return _pets.where((pet) => pet.type == name).toList();
  }

  Pet findById(String id) {
    return _pets.firstWhere((prod) => prod.id == id);
  }

  Future<void> toggleFavoriteStatus(Pet pet) async {
    final savedStatus = pet.isFavorite;
    pet.isFavorite = !savedStatus;

    if (!await _petsService.saveFavoriteStatus(pet)) {
      pet.isFavorite = savedStatus;
    }
  }
}
