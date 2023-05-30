// To parse this JSON data, do
//
//     final artist = artistFromJson(jsonString);

import 'dart:convert';

Artist artistFromJson(String str) => Artist.fromJson(json.decode(str));


class Artist {
    String href;
    List<Item> items;
    int limit;
    dynamic next;
    int offset;
    dynamic previous;
    int total;

    Artist({
        required this.href,
        required this.items,
        required this.limit,
        this.next,
        required this.offset,
        this.previous,
        required this.total,
    });

    factory Artist.fromJson(Map<String, dynamic> json) => Artist(
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
    List<ArtistElement> artists;
    int discNumber;
    int durationMs;
    bool explicit;
    ExternalUrls externalUrls;
    String href;
    String id;
    bool isLocal;
    bool isPlayable;
    ArtistElement? linkedFrom;
    String name;
    String? previewUrl;
    int trackNumber;
    Type type;
    String uri;
    Restrictions? restrictions;

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
        this.linkedFrom,
        required this.name,
        this.previewUrl,
        required this.trackNumber,
        required this.type,
        required this.uri,
        this.restrictions,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        artists: List<ArtistElement>.from(json["artists"].map((x) => ArtistElement.fromJson(x))),
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        explicit: json["explicit"],
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        isLocal: json["is_local"],
        isPlayable: json["is_playable"],
        linkedFrom: json["linked_from"] == null ? null : ArtistElement.fromJson(json["linked_from"]),
        name: json["name"],
        previewUrl: json["preview_url"],
        trackNumber: json["track_number"],
        type: typeValues.map[json["type"]]!,
        uri: json["uri"],
        restrictions: json["restrictions"] == null ? null : Restrictions.fromJson(json["restrictions"]),
    );
}

class ArtistElement {
    ExternalUrls externalUrls;
    String href;
    String id;
    String? name;
    Type type;
    String uri;

    ArtistElement({
        required this.externalUrls,
        required this.href,
        required this.id,
        this.name,
        required this.type,
        required this.uri,
    });

    factory ArtistElement.fromJson(Map<String, dynamic> json) => ArtistElement(
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        name: json["name"],
        type: typeValues.map[json["type"]]!,
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

enum Type { ARTIST, TRACK }

final typeValues = EnumValues({
    "artist": Type.ARTIST,
    "track": Type.TRACK
});

class Restrictions {
    String reason;

    Restrictions({
        required this.reason,
    });

    factory Restrictions.fromJson(Map<String, dynamic> json) => Restrictions(
        reason: json["reason"],
    );

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
