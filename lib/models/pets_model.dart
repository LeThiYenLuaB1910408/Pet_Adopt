import 'package:flutter/material.dart';
import 'package:pet_adopt/models/owner_model.dart';

class Pet {
  final Color color;
  final String name, location, sex, image, description;
  final double age, weight;
  final int distance;
  final Owner owner;
  final ValueNotifier<bool> _fav;

  Pet({
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
    fav = false,
  }) : _fav = ValueNotifier(fav);

  set isFavorite(bool newValue) {
    _fav.value = newValue;
  }

  bool get isFavorite {
    return _fav.value;
  }

  ValueNotifier<bool> get isFavoriteListenable {
    return _fav;
  }
}
