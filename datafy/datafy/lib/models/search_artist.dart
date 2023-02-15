// To parse this JSON data, do
//
//     final searchArtist = searchArtistFromJson(jsonString);

import 'dart:convert';

SearchArtist searchArtistFromJson(String str) => SearchArtist.fromJson(json.decode(str));


class SearchArtist {
    SearchArtist({
        required this.artists,
    });

    Artists artists;

    factory SearchArtist.fromJson(Map<String, dynamic> json) => SearchArtist(
        artists: Artists.fromJson(json["artists"]),
    );

}

class Artists {
    Artists({
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

    factory Artists.fromJson(Map<String, dynamic> json) => Artists(
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
        required this.externalUrls,
        required this.followers,
        required this.genres,
        required this.href,
        required this.id,
        required this.images,
        required this.name,
        required this.popularity,
        required this.type,
        required this.uri,
    });

    ExternalUrls externalUrls;
    Followers followers;
    List<String> genres;
    String href;
    String id;
    List<Image> images;
    String name;
    int popularity;
    Type type;
    String uri;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        followers: Followers.fromJson(json["followers"]),
        genres: List<String>.from(json["genres"].map((x) => x)),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        name: json["name"],
        popularity: json["popularity"],
        type: typeValues.map[json["type"]]!,
        uri: json["uri"],
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

}

class Followers {
    Followers({
        this.href,
        required this.total,
    });

    dynamic href;
    int total;

    factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: json["href"],
        total: json["total"],
    );
}

class Image {
    Image({
        required this.height,
        required this.url,
        required this.width,
    });

    int height;
    String url;
    int width;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        height: json["height"],
        url: json["url"],
        width: json["width"],
    );

}

enum Type { ARTIST }

final typeValues = EnumValues({
    "artist": Type.ARTIST
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