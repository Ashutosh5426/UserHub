import 'package:user_hub/core/api/api_calls.dart';
import 'package:user_hub/features/user_details_page/data/mapper/user_details_mapper.dart';
import 'package:user_hub/features/user_details_page/data/model/user_details_model.dart';
import 'package:user_hub/features/user_details_page/data/model/user_details_response_model.dart';
import 'package:user_hub/features/user_details_page/data/repository/user_details_repository.dart';

class UserDetailsRepositoryImpl extends UserDetailsRepository{
  @override
  Future<UserDetailsModel?> getUserDetails({required int userId}) async {
    try{
      var response = await ApiCalls().getUserInfo(userId);
      if(response.statusCode==200){
        return UserDetailsMapper().call(UserDetailsResponseModel.fromJson(response.data));
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}