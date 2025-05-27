// To parse this JSON data, do
//
//     final resultImageProfile = resultImageProfileFromJson(jsonString);

import 'dart:convert';

ResultImageProfile resultImageProfileFromJson(String str) =>
    ResultImageProfile.fromJson(json.decode(str));

String resultImageProfileToJson(ResultImageProfile data) =>
    json.encode(data.toJson());

class ResultImageProfile {
  final Data? data;
  final int? uploaded;
  final String? url;
  final int? status;

  ResultImageProfile({
    this.data,
    this.uploaded,
    this.url,
    this.status,
  });

  factory ResultImageProfile.fromJson(Map<String, dynamic> json) =>
      ResultImageProfile(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        uploaded: json["uploaded"],
        url: json["url"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "uploaded": uploaded,
        "url": url,
        "status": status,
      };
}

class Data {
  final String? fileName;
  final String? filePath;
  final int? fileSize;
  final String? fileType;
  final String? fileExtension;
  final int? fileWidth;
  final int? fileHeight;
  final int? createUser;
  final int? id;
  final Sizes? sizes;

  Data({
    this.fileName,
    this.filePath,
    this.fileSize,
    this.fileType,
    this.fileExtension,
    this.fileWidth,
    this.fileHeight,
    this.createUser,
    this.id,
    this.sizes,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        fileName: json["file_name"],
        filePath: json["file_path"],
        fileSize: json["file_size"],
        fileType: json["file_type"],
        fileExtension: json["file_extension"],
        fileWidth: json["file_width"],
        fileHeight: json["file_height"],
        createUser: json["create_user"],
        id: json["id"],
        sizes: json["sizes"] == null ? null : Sizes.fromJson(json["sizes"]),
      );

  Map<String, dynamic> toJson() => {
        "file_name": fileName,
        "file_path": filePath,
        "file_size": fileSize,
        "file_type": fileType,
        "file_extension": fileExtension,
        "file_width": fileWidth,
        "file_height": fileHeight,
        "create_user": createUser,
        "id": id,
        "sizes": sizes?.toJson(),
      };
}

class Sizes {
  final String? the150;
  final String? the600;
  final String? the1024;
  final String? sizesDefault;

  Sizes({
    this.the150,
    this.the600,
    this.the1024,
    this.sizesDefault,
  });

  factory Sizes.fromJson(Map<String, dynamic> json) => Sizes(
        the150: json["150"],
        the600: json["600"],
        the1024: json["1024"],
        sizesDefault: json["default"],
      );

  Map<String, dynamic> toJson() => {
        "150": the150,
        "600": the600,
        "1024": the1024,
        "default": sizesDefault,
      };
}
