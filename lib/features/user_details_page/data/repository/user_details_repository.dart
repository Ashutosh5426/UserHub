import 'package:user_hub/features/user_details_page/data/model/user_details_model.dart';

abstract class UserDetailsRepository {
  Future<UserDetailsModel?> getUserDetails({required int userId});
}