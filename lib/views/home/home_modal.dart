class Calls {
  int id;
  String picture, name, message, lastmesagetime, status, phonenumber;

  Calls(
      {this.id,
      this.picture,
      this.name,
      this.message,
      this.lastmesagetime,
      this.status,
      this.phonenumber});

  factory Calls.fromJson(Map<String, dynamic> json) => Calls(
        id: json['Id'],
        picture: json['Picture'],
        name: json['Name'],
        message: json['Message'],
        lastmesagetime: json['Lastmesagetime'],
        status: json['Status'],
        phonenumber: json['Phonenumber'],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Picture": picture,
        "Name": name,
        "Message": message,
        "Lastmesagetime": lastmesagetime,
        "Status": status,
        "Phonenumber": phonenumber
      };
}
