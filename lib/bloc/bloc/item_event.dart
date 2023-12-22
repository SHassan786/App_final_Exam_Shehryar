part of 'item_bloc.dart';

@immutable
abstract class ItemEvent {}

class LoadItems extends ItemEvent {}

class AddItem extends ItemEvent {
  final Item item;

  AddItem(this.item);
}

class UpdateItem extends ItemEvent {
  final Item item;

  UpdateItem(this.item);
}

class DeleteItem extends ItemEvent {
  final String id;

  DeleteItem(this.id);
}
