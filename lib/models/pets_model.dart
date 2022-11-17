import 'package:flutter/material.dart';
import 'package:pet_adopt/models/owner_model.dart';

class Pet {
  final String? id;
  final String color;
  final String name, location, type, sex, image, description;
  final double age, weight;
  final int distance;
  final String idOwner;
  final ValueNotifier<bool> _fav;

  Pet({
    this.id,
    required this.image,
    required this.color,
    required this.description,
    required this.type,
    required this.name,
    required this.location,
    required this.sex,
    required this.age,
    required this.weight,
    required this.distance,
    required this.idOwner,
    fav = false,
  }) : _fav = ValueNotifier(fav);

  set isFavorite(bool newValue) {
    _fav.value = newValue;
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'color': color,
      'description': description,
      'type': type,
      'name': name,
      'location': location,
      'sex': sex,
      'age': age,
      'weight': weight,
      'distance': distance,
      'idOwner': idOwner,
    };
  }

  static Pet fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'],
      image: json['image'],
      color: json['color'],
      description: json['description'],
      type: json['type'],
      name: json['name'],
      location: json['location'],
      sex: json['sex'],
      age: json['age'],
      weight: json['weight'],
      distance: json['distance'],
      idOwner: json['idOwner'],
    );
  }

  bool get isFavorite {
    return _fav.value;
  }

  ValueNotifier<bool> get isFavoriteListenable {
    return _fav;
  }

  Pet copyWith({
    String? id,
    String? image,
    String? color,
    String? description,
    String? type,
    String? name,
    String? location,
    String? sex,
    double? age,
    double? weight,
    int? distance,
    String? idOwner,
    bool? fav,
  }) {
    return Pet(
      id: id ?? this.id,
      image: image ?? this.image,
      color: color ?? this.color,
      description: description ?? this.description,
      type: type ?? this.type,
      name: name ?? this.name,
      location: location ?? this.location,
      sex: sex ?? this.sex,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      distance: distance ?? this.distance,
      idOwner: idOwner ?? this.idOwner,
      fav: fav ?? isFavorite,
    );
  }
}
