part of 'expiry_date_cubit.dart';

@immutable
sealed class ExpiryDateState {}

final class ExpiryDateInitial extends ExpiryDateState {}

final class ExpiryDateLoading extends ExpiryDateState {}

final class ExpiryDateLoaded extends ExpiryDateState {
  final String expiryDate;

  ExpiryDateLoaded(this.expiryDate);
}

final class ExpiryDateError extends ExpiryDateState {
  final String errorMessage;

  ExpiryDateError(this.errorMessage);
}
