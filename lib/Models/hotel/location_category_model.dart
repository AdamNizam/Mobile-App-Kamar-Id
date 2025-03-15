class LocationCategoryModel {
  final int? id;
  final String? name;
  final String? iconClass;
  final dynamic content;
  final dynamic slug;
  final String? status;

  LocationCategoryModel({
    this.id,
    this.name,
    this.iconClass,
    this.content,
    this.slug,
    this.status,
  });

  factory LocationCategoryModel.fromJson(Map<String, dynamic> json) =>
      LocationCategoryModel(
        id: json["id"],
        name: json["name"],
        iconClass: json["icon_class"],
        content: json["content"],
        slug: json["slug"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon_class": iconClass,
        "content": content,
        "slug": slug,
        "status": status,
      };
}
