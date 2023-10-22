import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_hub/features/user_details_page/bloc/user_details_page_events.dart';
import 'package:user_hub/features/user_details_page/bloc/user_details_page_states.dart';
import 'package:user_hub/features/user_details_page/data/repository/user_details_repository.dart';
import 'package:user_hub/features/user_details_page/data/repository/user_details_repository_impl.dart';

class UsersDetailsPageBloc extends Bloc<UserDetailsPageEvents, UserDetailsPageStates> {
  final UserDetailsRepository _repository = UserDetailsRepositoryImpl();

  UsersDetailsPageBloc() : super(UserDetailsPageStates.initial()) {
    on<UserDetailsPageEvents>(_userDetailsEventsMapper);
  }

  FutureOr<void> _userDetailsEventsMapper(UserDetailsPageEvents events, Emitter<UserDetailsPageStates> emit) async {
    emit(UserDetailsPageStates.loading());
    var response = await _repository.getUserDetails(userId: events.userId);
    if(response!=null){
      emit(UserDetailsPageStates.success(userDetailsModel: response));
    } else {
      emit(UserDetailsPageStates.error());
    }
  }
}