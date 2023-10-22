class UserDetailsModel {
  Data data;

  Support support;
  UserDetailsModel({
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

class Data {
  int id;

  String email;

  String firstName;

  String lastName;

  String avatar;
  Data({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });
}
