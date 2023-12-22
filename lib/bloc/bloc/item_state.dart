part of 'item_bloc.dart';

@immutable
abstract class ItemState {}

class ItemLoading extends ItemState {}

class ItemLoaded extends ItemState {
  final List<Item> item;

  ItemLoaded(this.item);
}

class ItemOperationSuccess extends ItemState {}

class ItemOperationFailure extends ItemState {}
