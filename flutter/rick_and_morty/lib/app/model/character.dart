// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Character {
  final String id;
  final String gender;
  final String type;
  final String species;
  final String image;
  final String name;
  final String status;
  final String location;
  
  Character({
    required this.id,
    required this.gender,
    required this.type,
    required this.species,
    required this.image,
    required this.name,
    required this.status,
    required this.location,
  });

  Character copyWith({
    String? id,
    String? gender,
    String? type,
    String? species,
    String? image,
    String? name,
    String? status,
    String? location,
  }) {
    return Character(
      id: id ?? this.id,
      gender: gender ?? this.gender,
      type: type ?? this.type,
      species: species ?? this.species,
      image: image ?? this.image,
      name: name ?? this.name,
      status: status ?? this.status,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'gender': gender,
      'type': type,
      'species': species,
      'image': image,
      'name': name,
      'status': status,
      'location': location,
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      id: map['id'] as String,
      gender: map['gender'] as String,
      type: map['type'] as String,
      species: map['species'] as String,
      image: map['image'] as String,
      name: map['name'] as String,
      status: map['status'] as String,
      location: map['location']?['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Character.fromJson(String source) =>
      Character.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Character(id: $id, gender: $gender, type: $type, species: $species, image: $image, name: $name, status: $status, location: $location)';
  }

  @override
  bool operator ==(covariant Character other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.gender == gender &&
        other.type == type &&
        other.species == species &&
        other.image == image &&
        other.name == name &&
        other.status == status &&
        other.location == location;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        gender.hashCode ^
        type.hashCode ^
        species.hashCode ^
        image.hashCode ^
        name.hashCode ^
        status.hashCode ^
        location.hashCode;
  }
}
