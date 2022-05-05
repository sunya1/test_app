import 'package:equatable/equatable.dart';

abstract class LauncherState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends LauncherState {
  @override
  List<Object> get props => [];
}

class AuthorizedState extends LauncherState {}
class NotYetAuthorizedState extends LauncherState {}

class LoadingState extends LauncherState{}