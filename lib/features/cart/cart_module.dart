import 'package:get_it/get_it.dart';
import 'package:tavada_eats/features/cart/presentation/bloc/cart_bloc.dart';

/// The cart is app-scoped: a single [CartBloc] lives for the whole session.
void registerCartModule(GetIt sl) {
  sl.registerLazySingleton<CartBloc>(CartBloc.new);
}
