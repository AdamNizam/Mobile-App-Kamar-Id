class GalleryListModel {
  final dynamic large;
  final dynamic thumb;

  GalleryListModel({
    required this.large,
    required this.thumb,
  });

  factory GalleryListModel.fromJson(Map<String, dynamic> json) =>
      GalleryListModel(
        large: json["large"],
        thumb: json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "thumb": thumb,
      };
}
