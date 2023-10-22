import 'package:user_hub/features/user_list_page/data/model/users_list_model.dart';
import 'package:user_hub/features/user_list_page/data/model/users_list_response_model.dart';

class UsersListMapper {
  UsersListModel call(UsersListResponseModel usersListResponseModel) {
    return UsersListModel(
      page: (usersListResponseModel.page) ?? 0,
      perPage: (usersListResponseModel.perPage) ?? 0,
      total: (usersListResponseModel.total) ?? 0,
      totalPages: (usersListResponseModel.totalPages) ?? 0,
      data: (usersListResponseModel.data?.map(
            (dataItem) => UserModel(
          id: (dataItem.id) ?? 0,
          email: (dataItem.email) ?? "",
          firstName: (dataItem.firstName) ?? "",
          lastName: (dataItem.lastName) ?? "",
          avatar: (dataItem.avatar) ?? "",
        ),
      ))?.toList() ??
          [],
      support: Support(
        url: (usersListResponseModel.support?.url) ?? "",
        text: (usersListResponseModel.support?.text) ?? "",
      ),
    );
  }
}
