import 'package:user_hub/core/api/api_calls.dart';
import 'package:user_hub/features/user_list_page/data/mapper/users_list_mapper.dart';
import 'package:user_hub/features/user_list_page/data/model/users_list_model.dart';
import 'package:user_hub/features/user_list_page/data/model/users_list_response_model.dart';
import 'package:user_hub/features/user_list_page/data/repository/users_list_repository.dart';

class UsersListRepositoryImpl extends UsersListRepository{
  @override
  Future<UsersListModel?> getUsersList({required int page}) async {
    try{
      var response = await ApiCalls().getUsers(page: page);
      if(response.statusCode==200){
        return UsersListMapper().call(UsersListResponseModel.fromJson(response.data));
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}