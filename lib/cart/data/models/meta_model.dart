class MetaModel {
  MetaModel({
    this.currentPage,
    this.totalPages,
    this.limit,
  });

  int? currentPage;
  int? totalPages;
  int? limit;

  factory MetaModel.fromJson(Map<String, dynamic> json) => MetaModel(
        currentPage: json["currentPage"] == null ? null : json["currentPage"],
        totalPages: json["totalPages"] == null ? null : json["totalPages"],
        limit: json["limit"] == null ? null : json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "currentPage": currentPage == null ? null : currentPage,
        "totalPages": totalPages == null ? null : totalPages,
        "limit": limit == null ? null : limit,
      };
}
