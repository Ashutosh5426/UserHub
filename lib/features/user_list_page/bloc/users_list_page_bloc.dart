import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_hub/features/user_list_page/bloc/users_list_page_events.dart';
import 'package:user_hub/features/user_list_page/bloc/users_list_page_states.dart';
import 'package:user_hub/features/user_list_page/data/repository/users_list_repository.dart';
import 'package:user_hub/features/user_list_page/data/repository/users_list_repository_impl.dart';

class UsersListPageBloc extends Bloc<UsersListPageEvents, UsersListPageStates>{
  final UsersListRepository _repository = UsersListRepositoryImpl();

  UsersListPageBloc() : super(UsersListPageStates.initial()) {
    on<UsersListPageEvents>(_mapUsersListPageEvents);
  }

  FutureOr<void> _mapUsersListPageEvents(UsersListPageEvents events, Emitter<UsersListPageStates> emit) async {
    emit(UsersListPageStates.loading());
    var response = await _repository.getUsersList(page: events.page);
    if(response!=null){
      emit(UsersListPageStates.success(usersListModel: response));
    } else {
      emit(UsersListPageStates.error());
    }
  }
}