import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void increment() {
    int newCount = state.count + 1;
    int newTotal = state.totalCount + 1;
    emit(HomeUpdated(newCount, newTotal));
    HapticFeedback.lightImpact();
  }

  void reset() {
    emit(HomeUpdated(0, state.totalCount));
    HapticFeedback.mediumImpact();
  }

  void stepBack() {
    if (state.count > 0) {
      int newCount = state.count - 1;
      int newTotal = state.totalCount - 1;
      emit(HomeUpdated(newCount, newTotal));
      HapticFeedback.lightImpact();
    }
  }
}