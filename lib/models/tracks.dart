// To parse this JSON data, do
//
//     final tracks = tracksFromJson(jsonString);

import 'dart:convert';

TracksReleased tracksFromJson(String str) => TracksReleased.fromJson(json.decode(str));

String tracksToJson(TracksReleased data) => json.encode(data.toJson());

class TracksReleased {
    TracksReleased({
        required this.href,
        required this.items,
        required this.limit,
        required this.next,
        required this.offset,
        this.previous,
        required this.total,
    });

    String href;
    List<Item> items;
    int limit;
    String next;
    int offset;
    dynamic previous;
    int total;

    factory TracksReleased.fromJson(Map<String, dynamic> json) => TracksReleased(
        href: json["href"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
    };
}

class Item {
    Item({
        required this.albumGroup,
        required this.albumType,
        required this.artists,
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.images,
        required this.name,
        required this.releaseDate,
        required this.releaseDatePrecision,
        required this.totalTracks,
        required this.type,
        required this.uri,
    });

    String albumGroup;
    String albumType;
    List<Artist> artists;
    ExternalUrls externalUrls;
    String href;
    String id;
    List<Images> images;
    String name;
    DateTime releaseDate;
    String releaseDatePrecision;
    int totalTracks;
    String type;
    String uri;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        albumGroup: json["album_group"],
        albumType: json["album_type"],
        artists: json["artists"] != null ?  new List<Artist>.from(json['artists'].map((x) => Artist.fromJson(x))) : <Artist>[],
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
        name: json["name"],
        releaseDate: DateTime.parse(json["release_date"]),
        releaseDatePrecision: json["release_date_precision"],
        totalTracks: json["total_tracks"],
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "album_group": albumGroup,
        "album_type": albumType,
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "name": name,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "release_date_precision": releaseDatePrecision,
        "total_tracks": totalTracks,
        "type": type,
        "uri": uri,
    };
}

class Artist {
    Artist({
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.name,
        required this.type,
        required this.uri,
    });

    ExternalUrls externalUrls;
    String href;
    String id;
    String name;
    String type;
    String uri;

    factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        name: json["name"],
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "name": name,
        "type": type,
        "uri": uri,
    };
}

class ExternalUrls {
    ExternalUrls({
        required this.spotify,
    });

    String spotify;

    factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
    );

    Map<String, dynamic> toJson() => {
        "spotify": spotify,
    };
}

class Images {
    Images({
        required this.height,
        required this.url,
        required this.width,
    });

    int height;
    String url;
    int width;

    factory Images.fromJson(Map<String, dynamic> json) => Images(
        height: json["height"],
        url: json["url"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
    };
}
