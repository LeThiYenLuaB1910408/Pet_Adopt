import 'package:flutter/material.dart';
import 'package:pet_adopt/const.dart';
import 'package:pet_adopt/models/owner_model.dart';

class Pet {
  final Color color;
  final String name, location, sex, image, description;
  final double age, weight;
  final int distance;
  final bool fav;
  final Owner owner;

  Pet({
    required this.fav,
    required this.image,
    required this.color,
    required this.description,
    required this.name,
    required this.location,
    required this.sex,
    required this.age,
    required this.weight,
    required this.distance,
    required this.owner,
  });
}

List<Pet> cats = [
  Pet(
      fav: true,
      color: orange,
      name: 'Leo',
      description: desc,
      location: 'Cai Rang, Can Tho',
      sex: 'Male',
      age: 2.1,
      weight: 4.5,
      image: 'assets/cats/cat1.png',
      distance: 5,
      owner: owners[0]),
  Pet(
      fav: true,
      color: green,
      name: 'Lily',
      description: desc,
      location: 'Binh Thuy, Can Tho',
      sex: 'Female',
      age: 1.2,
      image: 'assets/cats/cat2.png',
      weight: 2.6,
      distance: 15,
      owner: owners[1]),
  Pet(
      fav: false,
      color: blue,
      name: 'Cleo',
      image: 'assets/cats/cat3.png',
      description: desc,
      location: 'Phong Dien, Can Tho',
      sex: 'Male',
      age: 1.4,
      weight: 3.4,
      distance: 7,
      owner: owners[2]),
  Pet(
      fav: true,
      color: red,
      image: 'assets/cats/cat4.png',
      name: 'Milo',
      description: desc,
      location: 'Ninh Kieu, Can Tho',
      sex: 'Female',
      age: 1.1,
      weight: 3.2,
      distance: 2,
      owner: owners[0]),
];
String desc =
    'This cat is a domestic species of small carnivorous mammal. It is the only domesticated species in the family Felidae and is often reffered to as the domestic cat to distinguish it from the wild members of the family. A cat can either be a house cat, a farm cat or a feral cat, the latter rangers freely and avoids human contacts. Domestic cats are valued by humans for companionship and their ability to kill redonts. About 60 cat breeds are recognized by various cat registries. ';
    // 'Leo is a cat that i have found on the side of the road 1 year ago he is now a cheerful and active cat';

List<Pet> dogs = [
  Pet(
      fav: true,
      color: orange,
      name: 'Milo',
      description: title,
      location: 'Cai Rang, Can Tho',
      sex: 'Male',
      age: 2,
      weight: 5,
      image: 'assets/dogs/dog_1.png',
      distance: 5,
      owner: owners[3]),
  Pet(
      fav: true,
      color: green,
      name: 'Leon',
      description: title,
      location: 'Binh Thuy, Can Tho',
      sex: 'Female',
      age: 1.5,
      image: 'assets/dogs/dog_2.png',
      weight: 12,
      distance: 15,
      owner: owners[4]),
  Pet(
      fav: false,
      color: blue,
      name: 'Hus',
      image: 'assets/dogs/dog_3.png',
      description: title,
      location: 'Phong Dien, Can Tho',
      sex: 'Male',
      age: 1,
      weight: 5,
      distance: 7,
      owner: owners[5]),
  Pet(
      fav: true,
      color: red,
      image: 'assets/dogs/dog_4.png',
      name: 'Bun',
      description: title,
      location: 'Ninh Kieu, Can Tho',
      sex: 'Female',
      age: 2.5,
      weight: 8,
      distance: 2,
      owner: owners[6]),
];
String title =
    'This dog is a domestic species of small carnivorous mammal. It is the only domesticated species in the family Felidae and is often reffered to as the domestic dog to distinguish it from the wild members of the family. A dog can either be a house dog, a farm dog or a feral dog, the latter rangers freely and avoids human contacts. Domestic dogs are valued by humans for companionship and their ability to kill redonts. About 60 dog breeds are recognized by various dog registries. ';

List<Pet> hamsters = [
  Pet(
      fav: true,
      color: orange,
      name: 'ChuChi',
      description: tl,
      location: 'Cai Rang, Can Tho',
      sex: 'Male',
      age: 1,
      weight: 1.2,
      image: 'assets/hamsters/hamster1.png',
      distance: 5,
      owner: owners[0]),
  Pet(
      fav: true,
      color: green,
      name: 'Piu',
      description: tl,
      location: 'Binh Thuy, Can Tho',
      sex: 'Female',
      age: 1,
      image: 'assets/hamsters/hamster2.png',
      weight: 0.4,
      distance: 15,
      owner: owners[5]),
  Pet(
      fav: false,
      color: blue,
      name: 'Pin',
      image: 'assets/hamsters/hamster3.png',
      description: tl,
      location: 'Phong Dien, Can Tho',
      sex: 'Male',
      age: 1.5,
      weight: 0.8,
      distance: 7,
      owner: owners[4]),
  Pet(
      fav: true,
      color: red,
      image: 'assets/hamsters/hamster4.png',
      name: 'Mina',
      description: tl,
      location: 'Ninh Kieu, Can Tho',
      sex: 'Female',
      age: 1,
      weight: 1,
      distance: 2,
      owner: owners[6]),
];
String tl =
    'This hamster is a domestic species of small carnivorous mammal. It is the only domesticated species in the family Felidae and is often reffered to as the domestic hamster to distinguish it from the wild members of the family. A hamster can either be a house hamster, a farm hamster or a feral hamster, the latter rangers freely and avoids human contacts. Domestic hamsters are valued by humans for companionship and their ability to kill redonts. About 60 hamster breeds are recognized by various hamster registries. ';

