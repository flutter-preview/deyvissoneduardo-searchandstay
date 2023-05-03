// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Item {
  final int id;
  final String name;
  final int active;
  final int order;

  Item({
    required this.id,
    required this.name,
    required this.active,
    required this.order,
  });

  Item copyWith({
    int? id,
    String? name,
    int? active,
    int? order,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      active: active ?? this.active,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'active': active,
      'order': order,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      active: map['active'],
      order: map['order'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return '$name $id';
  }

  String toName(){
    return name;
  }
}
