class ClientModel {
  int id;
  String firstname;
  String lastname;
  String tel;
  String addrNum;
  String addrStreet;
  String addrCode;
  String addrCity;
  String email;

  ClientModel({
    this.id = -1,
    this.firstname = '',
    this.lastname = '',
    this.tel = '',
    this.addrNum = '',
    this.addrStreet = '',
    this.addrCode = '',
    this.addrCity = '',
    this.email = '',
  });

  static ClientModel fromJson(Map<String, dynamic> json) => ClientModel(
        id: json['id'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        tel: json['tel'],
        addrNum: json['addrNum'],
        addrStreet: json['addrStreet'],
        addrCode: json['addrCode'],
        addrCity: json['addrCity'],
        email: json['email'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstname': firstname,
        'lastname': lastname,
        'tel': tel,
        'addrNum': addrNum,
        'addrStreet': addrStreet,
        'addrCode': addrCode,
        'addrCity': addrCity,
        'email': email,
      };

  @override
  String toString() {
    return '"clients" : { "id": $id "firstname": $firstname, "lastname": $lastname, "tel": $tel, "addrNum": $addrNum, "addrStreet": $addrStreet, "addrCode": $addrCode, "addrCity": $addrCity, "email": $email}';
  }
}
