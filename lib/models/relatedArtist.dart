// To parse this JSON data, do
//
//     final relatedArtist = relatedArtistFromJson(jsonString);

import 'dart:convert';

RelatedArtist relatedArtistFromJson(String str) => RelatedArtist.fromJson(json.decode(str));


class RelatedArtist {
    List<Artist> artists;

    RelatedArtist({
        required this.artists,
    });

    factory RelatedArtist.fromJson(Map<String, dynamic> json) => RelatedArtist(
        artists: List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
    );


}

class Artist {
    ExternalUrls externalUrls;
    Followers followers;
    List<String> genres;
    String href;
    String id;
    List<Images> images;
    String name;
    int popularity;
    String uri;

    Artist({
        required this.externalUrls,
        required this.followers,
        required this.genres,
        required this.href,
        required this.id,
        required this.images,
        required this.name,
        required this.popularity,
        required this.uri,
    });

    factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        followers: Followers.fromJson(json["followers"]),
        genres: List<String>.from(json["genres"].map((x) => x)),
        href: json["href"],
        id: json["id"],
        images: List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
        name: json["name"],
        popularity: json["popularity"],
        uri: json["uri"],
    );

}

class ExternalUrls {
    String spotify;

    ExternalUrls({
        required this.spotify,
    });

    factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
    );

}

class Followers {
    dynamic href;
    int total;

    Followers({
        this.href,
        required this.total,
    });

    factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: json["href"],
        total: json["total"],
    );

}

class Images {
    String url;
    int height;
    int width;

    Images({
        required this.url,
        required this.height,
        required this.width,
    });

    factory Images.fromJson(Map<String, dynamic> json) => Images(
        url: json["url"],
        height: json["height"],
        width: json["width"],
    );

}