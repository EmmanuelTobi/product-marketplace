class UserModel {
  int? id;
  String? email;
  String? username;
  String? password;
  Name? name;
  Address? address;
  String? phone;

  UserModel({
    this.id,
    this.email,
    this.username,
    this.password,
    this.name,
    this.address,
    this.phone,
  });

  UserModel copyWith({
    int? id,
    String? email,
    String? username,
    String? password,
    Name? name,
    Address? address,
    String? phone,
  }) =>
      UserModel(
        id: id ?? this.id,
        email: email ?? this.email,
        username: username ?? this.username,
        password: password ?? this.password,
        name: name ?? this.name,
        address: address ?? this.address,
        phone: phone ?? this.phone,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    email: json["email"],
    username: json["username"],
    password: json["password"],
    name: Name.fromJson(json["name"]),
    address: Address.fromJson(json["address"]),
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "username": username,
    "password": password,
    "name": name!.toJson(),
    "address": address!.toJson(),
    "phone": phone,
  };
}

class Address {
  String? city;
  String? street;
  int? number;
  String? zipcode;
  Geolocation? geolocation;

  Address({
    this.city,
    this.street,
    this.number,
    this.zipcode,
    this.geolocation,
  });

  Address copyWith({
    String? city,
    String? street,
    int? number,
    String? zipcode,
    Geolocation? geolocation,
  }) =>
      Address(
        city: city ?? this.city,
        street: street ?? this.street,
        number: number ?? this.number,
        zipcode: zipcode ?? this.zipcode,
        geolocation: geolocation ?? this.geolocation,
      );

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    city: json["city"],
    street: json["street"],
    number: json["number"],
    zipcode: json["zipcode"],
    geolocation: Geolocation.fromJson(json["geolocation"]),
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "street": street,
    "number": number,
    "zipcode": zipcode,
    "geolocation": geolocation!.toJson(),
  };
}

class Geolocation {
  String? lat;
  String? long;

  Geolocation({
    this.lat,
    this.long,
  });

  Geolocation copyWith({
    String? lat,
    String? long,
  }) =>
      Geolocation(
        lat: lat ?? this.lat,
        long: long ?? this.long,
      );

  factory Geolocation.fromJson(Map<String, dynamic> json) => Geolocation(
    lat: json["lat"],
    long: json["long"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "long": long,
  };
}

class Name {
  String? firstname;
  String? lastname;

  Name({
    this.firstname,
    this.lastname,
  });

  Name copyWith({
    String? firstname,
    String? lastname,
  }) =>
      Name(
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
      );

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    firstname: json["firstname"],
    lastname: json["lastname"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
  };
}
