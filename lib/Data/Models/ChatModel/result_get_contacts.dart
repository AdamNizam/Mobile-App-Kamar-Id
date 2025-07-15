import 'dart:convert';

class ResultGetContacts {
  final List<Contact>? contacts;
  final int? total;
  final int? lastPage;

  ResultGetContacts({
    this.contacts,
    this.total,
    this.lastPage,
  });

  factory ResultGetContacts.fromRawJson(String str) =>
      ResultGetContacts.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultGetContacts.fromJson(Map<String, dynamic> json) =>
      ResultGetContacts(
        contacts: json["contacts"] == null
            ? []
            : List<Contact>.from(
                json["contacts"]!.map((x) => Contact.fromJson(x))),
        total: json["total"],
        lastPage: json["last_page"],
      );

  Map<String, dynamic> toJson() => {
        "contacts": contacts == null
            ? []
            : List<dynamic>.from(contacts!.map((x) => x.toJson())),
        "total": total,
        "last_page": lastPage,
      };
}

class Contact {
  final int? id;
  final String? name;
  final String? firstName;
  final String? lastName;

  Contact({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
  });

  factory Contact.fromRawJson(String str) => Contact.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["id"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
      };
}
