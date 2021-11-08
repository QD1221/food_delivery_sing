part of 'basket_bloc.dart';

abstract class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object> get props => [];
}

class StartBasket extends BasketEvent{
  @override
  List<Object> get props => [];
}

class AddItem extends BasketEvent{
  final MenuItem item;

  AddItem(this.item);

  @override
  List<Object> get props => [];
}

class RemoveItem extends BasketEvent{
  final MenuItem item;

  RemoveItem(this.item);
  @override
  List<Object> get props => [];
}

class RemoveAllItem extends BasketEvent{
  final MenuItem item;

  RemoveAllItem(this.item);
  @override
  List<Object> get props => [];
}

class ToggleSwitch extends BasketEvent{
  ToggleSwitch();

  @override
  List<Object> get props => [];
}
