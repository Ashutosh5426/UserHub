import 'package:user_hub/features/user_details_page/data/model/user_details_model.dart';
import 'package:user_hub/features/user_details_page/data/model/user_details_response_model.dart';

class UserDetailsMapper {
  UserDetailsModel call(UserDetailsResponseModel userDetailsResponseModel) {
    return UserDetailsModel(
      data: Data(
        id: (userDetailsResponseModel.data?.id) ?? 0,
        email: (userDetailsResponseModel.data?.email) ?? "",
        firstName: (userDetailsResponseModel.data?.firstName) ?? "",
        lastName: (userDetailsResponseModel.data?.lastName) ?? "",
        avatar: (userDetailsResponseModel.data?.avatar) ?? "",
      ),
      support: Support(
        url: (userDetailsResponseModel.support?.url) ?? "",
        text: (userDetailsResponseModel.support?.text) ?? "",
      ),
    );
  }
}
