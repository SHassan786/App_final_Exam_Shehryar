import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/item.dart';
import '../../repository/item_repository.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository itemrepository;

  ItemBloc({required this.itemrepository}) : super(ItemLoading()) {
    on<LoadItems>(_onLoadItem);
    on<AddItem>(_onAddItem);
    on<UpdateItem>(_onUpdateItem);
    on<DeleteItem>(_onDeleteItem);
  }

  void _onLoadItem(LoadItems event, Emitter<ItemState> emit) async {
    try {
      print("load items");
      final item = await itemrepository.getItems();
      emit(ItemLoaded(item));
    } catch (_) {
      emit(ItemOperationFailure());
    }
  }

  void _onAddItem(AddItem event, Emitter<ItemState> emit) async {
    try {
      await itemrepository.addItem(event.item);
      // Optionally, reload profiles after adding
      add(LoadItems());
    } catch (_) {
      emit(ItemOperationFailure());
    }
  }

  void _onUpdateItem(UpdateItem event, Emitter<ItemState> emit) async {
    try {
      await itemrepository.updateItem(event.item);
      // Optionally, reload profiles after adding
      add(LoadItems());
    } catch (_) {
      emit(ItemOperationFailure());
    }
  }

  void _onDeleteItem(DeleteItem event, Emitter<ItemState> emit) async {
    try {
      await itemrepository.deleteItem(event.id);
      // Optionally, reload profiles after adding
      add(LoadItems());
    } catch (_) {
      emit(ItemOperationFailure());
    }
  }
}
