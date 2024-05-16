class LoginDto {
    String email;
    String password;
    String device_name;


    LoginDto({this.email, this.password,this.device_name});

    factory LoginDto.fromJson(Map<String, dynamic> json) {
        return LoginDto(
            email: json['email'],
            password: json['password'],
            device_name: json['device_name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['email'] = this.email;
        data['password'] = this.password;
        data['device_name'] = this.device_name;
        return data;
    }
}