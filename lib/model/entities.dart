// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:searchandstay/model/item.dart';

class Entities {
  List<Item> itens;

  Entities({required this.itens});

  Entities copyWith({List<Item>? itens}) {
    return Entities(itens: itens ?? this.itens);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'itens': itens.map((x) => x.toMap()).toList()};
  }

  factory Entities.fromMap(Map<String, dynamic> map) {
    return Entities(
      itens: List<Item>.from(
        (map['data']['entities'])
            .map<Item>((x) => Item.fromMap(x as Map<String, dynamic>)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Entities.fromJson(String source) =>
      Entities.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Entities(itens: $itens)';
}
