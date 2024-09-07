import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_qty_cubit.freezed.dart';
part 'counter_qty_state.dart';

class CounterQtyCubit extends Cubit<CounterQtyState> {
  CounterQtyCubit() : super(const CounterQtyState.qty(qty: 0));

  void addQty({required int qty}) {
    if (qty == 0) {
      emit(const CounterQtyState.qty(qty: 1));
    } else {
      emit(CounterQtyState.qty(qty: qty + 1));
    }
  }

  void minQty({required int qty}) {
    if (qty <= 1) {
      emit(const CounterQtyState.qty(qty: 0));
    } else {
      emit(CounterQtyState.qty(qty: qty - 1));
    }
  }
}
