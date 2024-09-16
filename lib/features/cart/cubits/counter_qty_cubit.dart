import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_qty_cubit.freezed.dart';

part 'counter_qty_state.dart';

class CounterQtyCubit extends Cubit<CounterQtyState> {
  var qtyValue = 1;

  CounterQtyCubit() : super(const CounterQtyState.qty(qty: 1));

  void initialQty({required int qty}) {
    emit(CounterQtyState.qty(qty: qty));
  }

  void addQty({required int qty}) {
    qtyValue = qty + 1;
    emit(CounterQtyState.qty(qty: qtyValue));
  }

  void minQty({required int qty}) {
    if (qty <= 1) {
      emit(const CounterQtyState.qty(qty: 1));
    } else {
      qtyValue = qty - 1;
      emit(CounterQtyState.qty(qty: qtyValue));
    }
  }
}
