part of 'bottom_navigation_bloc.dart';

@immutable
sealed class BottomNavigationState {
  final int  tabIndex;

  const BottomNavigationState({required this.tabIndex});
}

final class BottomNavigationInitial extends BottomNavigationState {
  const BottomNavigationInitial({required super.tabIndex});
}