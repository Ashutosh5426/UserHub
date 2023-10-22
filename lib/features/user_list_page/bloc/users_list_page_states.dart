import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_hub/features/user_list_page/data/model/users_list_model.dart';

part 'users_list_page_states.freezed.dart';

@freezed
abstract class UsersListPageStates with _$UsersListPageStates {
  factory UsersListPageStates.initial() = InitialState;

  factory UsersListPageStates.loading() = LoadingState;

  factory UsersListPageStates.error() = ErrorState;

  factory UsersListPageStates.success({required UsersListModel usersListModel}) = SuccessState;
}