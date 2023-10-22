import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_details_page_events.freezed.dart';

@freezed
abstract class UserDetailsPageEvents with _$UserDetailsPageEvents {
  factory UserDetailsPageEvents.getUserDetails({required int userId}) = GetUserDetailsEvents;
}