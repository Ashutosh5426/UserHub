class UsersListModel {
  int page;

  int perPage;

  int total;

  int totalPages;

  List<UserModel> data;

  Support support;
  UsersListModel({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });
}

class Support {
  String url;

  String text;
  Support({
    required this.url,
    required this.text,
  });
}

class UserModel {
  int id;

  String email;

  String firstName;

  String lastName;

  String avatar;
  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });
}