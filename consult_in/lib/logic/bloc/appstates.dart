abstract class ConsultAppStates {}

class InitialState extends ConsultAppStates {}

class ChangeFavouritState extends ConsultAppStates {}

class LoadingLoginState extends ConsultAppStates {}

class SuccessLoginState extends ConsultAppStates {}

class ErrorLoginState extends ConsultAppStates {
  final error;
  ErrorLoginState(this.error);
}
