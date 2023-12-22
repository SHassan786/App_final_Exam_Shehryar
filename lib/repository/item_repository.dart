import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/item.dart';

class ItemRepository {
  final CollectionReference itemCollection;

//Define firebase collection name to use
  ItemRepository()
      : itemCollection = FirebaseFirestore.instance.collection('items');

  // Fetch all profiles from Firestore
  Future<List<Item>> getItems() async {
    try {
      QuerySnapshot querySnapshot = await itemCollection.get();
      return querySnapshot.docs
          .map(
              (doc) => Item.fromMap(doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    } catch (e) {
      // Handle exceptions
      throw Exception('Error fetching profiles');
    }
  }

  // Add a new profile to Firestore
  Future<void> addItem(Item item) async {
    try {
      await itemCollection.add(item.toMap());
    } catch (e) {
      // Handle exceptions
      throw Exception('Error adding profile');
    }
  }

  // Update an existing profile in Firestore
  Future<void> updateItem(Item item) async {
    try {
      await itemCollection.doc(item.id).update(item.toMap());
    } catch (e) {
      // Handle exceptions
      throw Exception('Error updating profile');
    }
  }

  // Delete a profile from Firestore
  Future<void> deleteItem(String id) async {
    try {
      await itemCollection.doc(id).delete();
    } catch (e) {
      // Handle exceptions
      throw Exception('Error deleting profile');
    }
  }
}
