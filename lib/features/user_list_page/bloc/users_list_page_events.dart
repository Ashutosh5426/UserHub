import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_list_page_events.freezed.dart';

@freezed
abstract class UsersListPageEvents with _$UsersListPageEvents{
  factory UsersListPageEvents.getUsersList({required int page}) = GetUsersListEvent;
}