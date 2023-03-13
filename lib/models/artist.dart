// To parse this JSON data, do
//
//     final searchArtist = searchArtistFromJson(jsonString);

import 'dart:convert';

SearchArtist searchArtistFromJson(String str) => SearchArtist.fromJson(json.decode(str));

String searchArtistToJson(SearchArtist data) => json.encode(data.toJson());

class SearchArtist {
    SearchArtist({
        required this.artists,
    });

    Artists artists;

    factory SearchArtist.fromJson(Map<String, dynamic> json) => SearchArtist(
        artists: Artists.fromJson(json["artists"]),
    );

    Map<String, dynamic> toJson() => {
        "artists": artists.toJson(),
    };
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
    List<Images> images;
    String name;
    int popularity;
    String type;
    String uri;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        followers: Followers.fromJson(json["followers"]),
        genres: List<String>.from(json["genres"].map((x) => x)),
        href: json["href"],
        id: json["id"],
        images: List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
        name: json["name"],
        popularity: json["popularity"],
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "external_urls": externalUrls.toJson(),
        "followers": followers.toJson(),
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "name": name,
        "popularity": popularity,
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

    Map<String, dynamic> toJson() => {
        "href": href,
        "total": total,
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
