part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  final int selectedIndex;

  const NavigationState({required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];
}
