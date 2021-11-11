import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_sing/models/basket_model.dart';
import 'package:food_delivery_sing/models/menu_item_model.dart';
import 'package:food_delivery_sing/models/voucher_model.dart';

part 'basket_event.dart';

part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketLoading());

  @override
  Stream<BasketState> mapEventToState(
    BasketEvent event,
  ) async* {
    if (event is StartBasket) {
      yield* _mapStartBasketToState();
    } else if (event is AddItem) {
      yield* _mapAddBasketToState(event, state);
    } else if (event is RemoveItem) {
      yield* _mapRemoveBasketToState(event, state);
    } else if (event is RemoveAllItem) {
      yield* _mapRemoveAllBasketToState(event, state);
    } else if (event is ToggleSwitch) {
      yield* _mapToggleSwitchToState(event, state);
    } else if (event is AddVoucher) {
      yield* _mapAddVoucherToState(event, state);
    }
  }

  Stream<BasketState> _mapStartBasketToState() async* {
    yield BasketLoading();
    try {
      await Future<void>.delayed(Duration(seconds: 1));
      yield BasketLoaded(basket: Basket());
    } catch (_) {}
  }

  Stream<BasketState> _mapAddBasketToState(
    AddItem event,
    BasketState state,
  ) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
          basket: state.basket.copyWith(
            items: List.from(state.basket.items)..add(event.item),
          ),
        );
      } catch (_) {}
    }
  }

  Stream<BasketState> _mapRemoveBasketToState(
    RemoveItem event,
    BasketState state,
  ) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
          basket: state.basket.copyWith(
            items: List.from(state.basket.items)..remove(event.item),
          ),
        );
      } catch (_) {}
    }
  }

  Stream<BasketState> _mapRemoveAllBasketToState(
    RemoveAllItem event,
    BasketState state,
  ) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
          basket: state.basket.copyWith(
            items: List.from(state.basket.items)
              ..removeWhere((item) => item == event.item),
          ),
        );
      } catch (_) {}
    }
  }

  Stream<BasketState> _mapToggleSwitchToState(
    ToggleSwitch event,
    BasketState state,
  ) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
          basket: state.basket.copyWith(
            cutlery: !state.basket.cutlery,
          ),
        );
      } catch (_) {}
    }
  }

  Stream<BasketState> _mapAddVoucherToState(
    AddVoucher event,
    BasketState state,
  ) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
          basket: state.basket.copyWith(
            voucher: event.voucher,
          ),
        );
      } catch (_) {}
    }
  }
}
