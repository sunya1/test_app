import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}
class InitialState extends AuthState{}
class LoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final String accessToken;

  AuthSuccessState({required this.accessToken});
  @override
  List<Object> get props => [accessToken];
}

class ErrorState extends AuthState {
  final String error;

  ErrorState({required this.error});
  @override
  List<Object> get props => [error];
}

class FillAllFieldsState extends AuthState {}

class ShowPasswordState extends AuthState{
   final bool isObscureText;

  ShowPasswordState({required this.isObscureText});
  @override
  List<Object> get props => [isObscureText];
}
