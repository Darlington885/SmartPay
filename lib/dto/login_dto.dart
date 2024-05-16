class LoginDto {
    String email;
    String password;
    String deviceName;


    LoginDto({this.email, this.password,this.deviceName});

    factory LoginDto.fromJson(Map<String, dynamic> json) {
        return LoginDto(
            email: json['email'],
            password: json['password'],
            deviceName: json['deviceName'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['email'] = this.email;
        data['password'] = this.password;
        data['deviceName'] = this.deviceName;
        return data;
    }
}