import 'dart:convert';

class ResultNotification {
  final RowsNotif rows;
  final String pageTitle;
  final String type;
  final int? status;

  ResultNotification({
    required this.rows,
    required this.pageTitle,
    required this.type,
    this.status,
  });

  factory ResultNotification.fromRawJson(String str) =>
      ResultNotification.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultNotification.fromJson(Map<String, dynamic> json) =>
      ResultNotification(
        rows: RowsNotif.fromJson(json["rows"]),
        pageTitle: json["page_title"],
        type: json["type"],
        status: json["status"] != null ? json["status"] as int : 0,
      );

  Map<String, dynamic> toJson() => {
        "rows": rows.toJson(),
        "page_title": pageTitle,
        "type": type,
        "status": status,
      };
}

class RowsNotif {
  final int currentPage;
  final List<Datum> dataNotif;
  final int from;
  final int lastPage;
  final int to;
  final int total;

  RowsNotif({
    required this.currentPage,
    required this.dataNotif,
    required this.from,
    required this.lastPage,
    required this.to,
    required this.total,
  });

  factory RowsNotif.fromRawJson(String str) =>
      RowsNotif.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RowsNotif.fromJson(Map<String, dynamic> json) => RowsNotif(
        currentPage: json["current_page"],
        dataNotif: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        from: json["from"] ?? 0,
        lastPage: json["last_page"] ?? 0,
        to: json["to"] ?? 0,
        total: json["total"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(dataNotif.map((x) => x.toJson())),
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
  final DateTime? readAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  Datum({
    required this.id,
    required this.notifiableId,
    required this.data,
    this.readAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        notifiableId: json["notifiable_id"],
        data: json["data"],
        readAt:
            json["read_at"] != null ? DateTime.parse(json["read_at"]) : null,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "notifiable_id": notifiableId,
        "data": data,
        "read_at": readAt?.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
