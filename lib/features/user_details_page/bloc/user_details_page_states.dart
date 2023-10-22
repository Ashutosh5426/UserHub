import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_hub/features/user_details_page/data/model/user_details_model.dart';

part 'user_details_page_states.freezed.dart';

@freezed
abstract class UserDetailsPageStates with _$UserDetailsPageStates {
  factory UserDetailsPageStates.initial() = InitialState;

  factory UserDetailsPageStates.loading() = LoadingState;

  factory UserDetailsPageStates.error() = ErrorState;

  factory UserDetailsPageStates.success({required UserDetailsModel userDetailsModel}) = SuccessState;
}