import 'dart:convert';
AlbumList albumListFromJson(String str) => AlbumList.fromJson(json.decode(str));

String albumListToJson(AlbumList data) => json.encode(data.toJson());
class AlbumList {
AlbumList({
 required this.albumId,
  required this.id,
  required this.title,
  required this.url,
  required this.thumbnailUrl,
});

int albumId;
int id;
String title;
String url;
String thumbnailUrl;

  factory AlbumList.fromJson(Map<String, dynamic> json) => AlbumList(
albumId: json["albumId"],
id: json["id"],
title: json["title"],
url: json["url"],
thumbnailUrl: json["thumbnailUrl"],
);

Map<String, dynamic> toJson() => {
  "albumId": albumId,
  "id": id,
  "title": title,
  "url": url,
  "thumbnailUrl": thumbnailUrl,
};
}

