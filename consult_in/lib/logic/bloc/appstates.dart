abstract class ConsultAppStates {}

class InitialState extends ConsultAppStates {}

class ChangeFavouritState extends ConsultAppStates {}

class LoadingLoginState extends ConsultAppStates {}

class SuccessLoginState extends ConsultAppStates {}

class ErrorLoginState extends ConsultAppStates {
  final error;
  ErrorLoginState(this.error);
}

class LoadingExpertRegisterState extends ConsultAppStates {}

class SuccessExpertRegisterState extends ConsultAppStates {}

class ErrorExpertRegisterState extends ConsultAppStates {
  final error;
  ErrorExpertRegisterState(this.error);
}

class LoadingUserRegisterState extends ConsultAppStates {}

class SuccessUserRegisterState extends ConsultAppStates {}

class ErrorUserRegisterState extends ConsultAppStates {
  final error;
  ErrorUserRegisterState(this.error);
}

class GetExpertsLoadingState extends ConsultAppStates {}

class GetExpertsSuccessState extends ConsultAppStates {}

class GetExpertsErrorState extends ConsultAppStates {}

class SearchExpertsLoadingState extends ConsultAppStates {}

class SearchExpertsSuccessState extends ConsultAppStates {}

class SearchExpertsErrorState extends ConsultAppStates {}

class LoadingLogoutState extends ConsultAppStates {}

class SuccessLogoutState extends ConsultAppStates {}

class ErrorLogoutState extends ConsultAppStates {
  final error;
  ErrorLogoutState(this.error);
}
