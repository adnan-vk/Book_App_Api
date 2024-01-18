// class UserModel{
//   String? username;
//   String? password;
//   String? Email;

//   UserModel(this.username, this.password, this.Email);

//   Map<String , dynamic>toJson(){
//     final Map<String,dynamic> userInfo = Map<String,dynamic>();
//     username = userInfo['usrname'];
//     password = userInfo['password'];
//     Email = userInfo['email'];
//     return userInfo;
//   }
// }
class UserModel {
  String? username;
  String? password;
  String? email;

  UserModel(this.username, this.password, this.email);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> userInfo = {
      'usrname': username,
      'password': password,
      'email': email,
    };
    return userInfo;
  }

  // Map<String, dynamic> logIn() {
  //   final Map<String, dynamic> userInfo =  {
  //     'username': username,
  //     'password': password,
  //   };
  //   return userInfo;
  // }
}
