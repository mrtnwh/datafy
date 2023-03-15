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
        required this.discNumber,
        required this.durationMs,
        required this.explicit,
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.isLocal,
        required this.isPlayable,
        required this.name,
        required this.previewUrl,
        required this.trackNumber,
        required this.uri,
    });

    List<Artist> artists;
    int discNumber;
    int durationMs;
    bool explicit;
    ExternalUrls externalUrls;
    String href;
    String id;
    bool isLocal;
    bool isPlayable;
    String name;
    String previewUrl;
    int trackNumber;
    String uri;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        artists: List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        explicit: json["explicit"],
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        isLocal: json["is_local"],
        isPlayable: json["is_playable"],
        name: json["name"],
        previewUrl: json["preview_url"],
        trackNumber: json["track_number"],
        uri: json["uri"],
    );

}

class Artist {
    Artist({
        required this.externalUrls,
        required this.href,
    });

    ExternalUrls externalUrls;
    String href;

    factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
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