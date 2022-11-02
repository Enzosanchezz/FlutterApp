class User {
  String name;
  String email;
  String city;
  String nameCompany;

  User(
    this.name,
    this.email,
    this.city,
    this.nameCompany,
  );

  // factory User.fromJson(Map<String, dynamic> json) {
  //   return User(
  //    json['name'] ,json['email'],json['city'],nameCompany: json['name'],
  //   );
  // }
}
