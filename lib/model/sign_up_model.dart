
class SignUpModel{
  String email;
  String password;
  String name;
  String phone;

  SignUpModel({required this.email,required this.password,required this.name,required this.phone});

  Map<String,dynamic> toJson(){
    Map<String,dynamic> data = <String,dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['f_name'] = name;
    data['phone'] = phone;

    return data;
  }
}