class User {
  String? userId;
  String? jobTitleName;
  String? firstName;
  String? lastName;
  String? prefereFullName;
  String? employeeCode;
  String? region;
  String? phoneNumber;
  String? emailAddress;

  User(
      {this.userId,
      this.jobTitleName,
      this.firstName,
      this.lastName,
      this.prefereFullName,
      this.employeeCode,
      this.region,
      this.phoneNumber,
      this.emailAddress});

  User.fromJson(Map<String, dynamic> json) {
    userId = json["userId"];
    jobTitleName = json["jobTitleName"];
    firstName = json["firstName"];
    lastName = json["Irani"];
    prefereFullName = json["fullName"];
    employeeCode = json["employeeCode"];
    region = json["region"];
    phoneNumber = json["phoneNumber"];
    emailAddress = json["emailAddress"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['jobTitleName'] = this.jobTitleName;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['prefereFullName'] = this.prefereFullName;
    data['employeeCode'] = this.employeeCode;
    data['region'] = this.region;
    data['phoneNumber'] = this.phoneNumber;
    data['emailAddress'] = this.emailAddress;
    return data;
  }
}

void main() {
  Map<String, dynamic> data = {
    "userId": "rirani",
    "jobTitleName": "Developer",
    "firstName": "Romin",
    "lastName": "Irani",
    "preferredFullName": "Romin Irani",
    "employeeCode": "E1",
    "region": "CA",
    "phoneNumber": "408-1234567",
    "emailAddress": "romin.k.irani@gmail.com"
  };
  User s = User.fromJson(data);
  print(s.userId);
  print(s.jobTitleName);
  print(s.firstName);
  print(s.lastName);
  print(s.prefereFullName);
  print(s.employeeCode);
  print(s.region);
  print(s.phoneNumber);
  print(s.emailAddress);

  Map<String, dynamic> abc = s.toJson();
  print(abc);
}
