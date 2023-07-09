import 'dart:convert';

class ResponseData {
  int code;
  List<dynamic> data;

  ResponseData({
    required this.code,
    required this.data,
  });

  factory ResponseData.fromRawJson(String str) =>
      ResponseData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
      code: json["code"], data: []
      // data: List<dynamic>.from(json["data"].map((x) => dynamic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FollowItem {
  String title;
  String content;
  String username;
  String category;
  int likeCount;
  int commentsCount;

  FollowItem({
    required this.title,
    required this.content,
    required this.username,
    required this.category,
    required this.likeCount,
    required this.commentsCount,
  });

  factory FollowItem.fromRawJson(String str) =>
      FollowItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FollowItem.fromJson(Map<String, dynamic> json) => FollowItem(
        title: json["title"],
        content: json["content"],
        username: json["username"],
        category: json["category"],
        likeCount: json["like_count"],
        commentsCount: json["comments_count"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "username": username,
        "category": category,
        "like_count": likeCount,
        "comments_count": commentsCount,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
