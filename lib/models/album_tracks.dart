// To parse this JSON data, do
//
//     final tracksAlbum = tracksAlbumFromJson(jsonString);

import 'dart:convert';

TracksAlbum tracksAlbumFromJson(String str) => TracksAlbum.fromJson(json.decode(str));


class TracksAlbum {
    TracksAlbum({
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

    factory TracksAlbum.fromJson(Map<String, dynamic> json) => TracksAlbum(
        href: json["href"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
    );

}

class Item {
    Item({
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

    List<Artist> artists;
    ExternalUrls externalUrls;
    String href;
    String id;
    List<Images> images;
    String name;
    DateTime releaseDate;
    ReleaseDatePrecision releaseDatePrecision;
    int totalTracks;
    AlbumGroup type;
    String uri;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        artists: List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
        name: json["name"],
        releaseDate: DateTime.parse(json["release_date"]),
        releaseDatePrecision: releaseDatePrecisionValues.map[json["release_date_precision"]]!,
        totalTracks: json["total_tracks"],
        type: albumGroupValues.map[json["type"]]!,
        uri: json["uri"],
    );
}

enum AlbumGroup { ALBUM, SINGLE }

final albumGroupValues = EnumValues({
    "album": AlbumGroup.ALBUM,
    "single": AlbumGroup.SINGLE
});

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
        id: json["id"]!,
        name: json["name"]!,
        type: json["type"]!,
        uri: json["uri"]!,
    );

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

enum Id { THE_6_OL_E6_TJ_LQ_ED3_RQ_DCT0_FY_PH }


enum Type { ARTIST }

final typeValues = EnumValues({
    "artist": Type.ARTIST
});


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

enum ReleaseDatePrecision { DAY }

final releaseDatePrecisionValues = EnumValues({
    "day": ReleaseDatePrecision.DAY
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
