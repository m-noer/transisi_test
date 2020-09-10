class EmployeModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  EmployeModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory EmployeModel.fromJson(Map<String, dynamic> json) {
    return EmployeModel(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}

// Karena data yang dipost tidak dapat masuk, jadi buat class model untuk hasil output dari endpoin post users
class EmployeModelAdd {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  EmployeModelAdd({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory EmployeModelAdd.fromJson(Map<String, dynamic> json) {
    return EmployeModelAdd(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}
