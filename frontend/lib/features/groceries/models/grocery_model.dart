import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Grocery {
  int id;
  String name;
  int quantity;
  Grocery({
    required this.id,
    required this.name,
    required this.quantity,
  });

  Grocery copyWith({
    int? id,
    String? name,
    int? quantity,
  }) {
    return Grocery(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'quantity': quantity,
    };
  }

  factory Grocery.fromMap(Map<String, dynamic> map) {
    return Grocery(
      id: map['id'] as int,
      name: map['name'] as String,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Grocery.fromJson(String source) =>
      Grocery.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Grocery(id: $id, name: $name, quantity: $quantity)';

  @override
  bool operator ==(covariant Grocery other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.quantity == quantity;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ quantity.hashCode;
}
