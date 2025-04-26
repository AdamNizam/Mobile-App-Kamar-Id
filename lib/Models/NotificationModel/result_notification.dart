import 'dart:convert';

class ResultNotification {
  final Rows rows;
  final String pageTitle;
  final String type;
  final int status;

  ResultNotification({
    required this.rows,
    required this.pageTitle,
    required this.type,
    required this.status,
  });

  factory ResultNotification.fromRawJson(String str) =>
      ResultNotification.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultNotification.fromJson(Map<String, dynamic> json) =>
      ResultNotification(
        rows: Rows.fromJson(json["rows"]),
        pageTitle: json["page_title"],
        type: json["type"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "rows": rows.toJson(),
        "page_title": pageTitle,
        "type": type,
        "status": status,
      };
}

class Rows {
  final int currentPage;
  final List<Datum> data;
  final int from;
  final int lastPage;
  final int to;
  final int total;

  Rows({
    required this.currentPage,
    required this.data,
    required this.from,
    required this.lastPage,
    required this.to,
    required this.total,
  });

  factory Rows.fromRawJson(String str) => Rows.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rows.fromJson(Map<String, dynamic> json) => Rows(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        from: json["from"],
        lastPage: json["last_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "from": from,
        "last_page": lastPage,
        "to": to,
        "total": total,
      };
}

class Datum {
  final int id;
  final int notifiableId;
  final String data;
  final dynamic readAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  Datum({
    required this.id,
    required this.notifiableId,
    required this.data,
    required this.readAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        notifiableId: json["notifiable_id"],
        data: json["data"],
        readAt: json["read_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "notifiable_id": notifiableId,
        "data": data,
        "read_at": readAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
