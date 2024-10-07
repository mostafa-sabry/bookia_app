part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLogInSuccess extends UserState {}

final class UserLogInLoading extends UserState {}

final class UserLogInFailure extends UserState {
  final String errorMessage;

  UserLogInFailure({required this.errorMessage});
}

final class UserRegisterSuccess extends UserState {}

final class UserRegisterLoading extends UserState {}

final class UserRegisterFailure extends UserState {
  final String errorMessage;

  UserRegisterFailure({required this.errorMessage});
}

final class UserUploadProfilePic extends UserState {}

final class GetUserSuccess extends UserState {
  final UserProfileModel user;

  GetUserSuccess({required this.user});
}

final class GetUserLoading extends UserState {}

final class GetUserFailure extends UserState {
  final String errorMessage;

  GetUserFailure({required this.errorMessage});
}
