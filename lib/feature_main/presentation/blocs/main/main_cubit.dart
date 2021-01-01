import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitialState(previousIndex: 0, currentIndex: 0));

  int _navSelectedIndex = 0;

  int get navSelectedItemIndex => _navSelectedIndex;

  navItemSelected(int index,{Equatable args}) {
    log('[MainCubit] Navigation item selected: $index');
    emit(MainNavItemSelectionChangedState(
        currentIndex: index, previousIndex: _navSelectedIndex,args:args));
    this._navSelectedIndex = index;
  }
}
