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
        status: json["status"],
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
  final String type;
  final String notifiableType;
  final int notifiableId;
  final DataNotif data;
  final DateTime? readAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  Datum({
    required this.id,
    required this.type,
    required this.notifiableType,
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
        type: json["type"],
        notifiableType: json["notifiable_type"],
        notifiableId: json["notifiable_id"],
        data: DataNotif.fromJson(json["data"]),
        readAt:
            json["read_at"] != null ? DateTime.parse(json["read_at"]) : null,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "notifiable_type": notifiableType,
        "notifiable_id": notifiableId,
        "data": data.toJson(),
        "read_at": readAt?.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class DataNotif {
  final String id;
  final int forAdmin;
  final NotificationDetail notification;

  DataNotif({
    required this.id,
    required this.forAdmin,
    required this.notification,
  });

  factory DataNotif.fromRawJson(String str) =>
      DataNotif.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataNotif.fromJson(Map<String, dynamic> json) => DataNotif(
        id: json["id"],
        forAdmin: json["for_admin"],
        notification: NotificationDetail.fromJson(json["notification"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "for_admin": forAdmin,
        "notification": notification.toJson(),
      };
}

class NotificationDetail {
  final int id;
  final String event;
  final String to;
  final String name;
  final String avatar;
  final String link;
  final String type;
  final String message;

  NotificationDetail({
    required this.id,
    required this.event,
    required this.to,
    required this.name,
    required this.avatar,
    required this.link,
    required this.type,
    required this.message,
  });

  factory NotificationDetail.fromRawJson(String str) =>
      NotificationDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationDetail.fromJson(Map<String, dynamic> json) =>
      NotificationDetail(
        id: json["id"],
        event: json["event"],
        to: json["to"],
        name: json["name"],
        avatar: json["avatar"],
        link: json["link"],
        type: json["type"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "event": event,
        "to": to,
        "name": name,
        "avatar": avatar,
        "link": link,
        "type": type,
        "message": message,
      };
}
