import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  final String id;
  final String name;
  final String pictureUrl;
  final Timestamp dateCreated;
  final String price;

  Item(
      {this.id = '',
      required this.name,
      required this.pictureUrl,
      required this.dateCreated,
      required this.price});

  // Convert a Profile object into a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'dateCreated': dateCreated,
      'pictureUrl': pictureUrl,
      'price': price,
    };
  }

  // Convert a map into a Profile object
  factory Item.fromMap(Map<String, dynamic> map, String documentId) {
    return Item(
      id: documentId,
      name: map['name'] ?? '',
      dateCreated: map['dateCreated'],
      pictureUrl: map['pictureUrl'] ?? '',
      price: map['price'] ?? '',
    );
  }
}
