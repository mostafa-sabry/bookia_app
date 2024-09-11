part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LogInSuccess extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginError extends AuthState {

  final String errorMessage;

  LoginError({required  this.errorMessage});
}

