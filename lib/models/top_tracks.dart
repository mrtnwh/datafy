// To parse this JSON data, do
//
//     final topTracks = topTracksFromJson(jsonString);

import 'dart:convert';

TopTracks topTracksFromJson(String str) => TopTracks.fromJson(json.decode(str));

class TopTracks {
    List<Track> tracks;

    TopTracks({
        required this.tracks,
    });

    factory TopTracks.fromJson(Map<String, dynamic> json) => TopTracks(
        tracks: List<Track>.from(json["tracks"].map((x) => Track.fromJson(x))),
    );

}

class Track {
    Album album;
    List<Artist> artists;
    int discNumber;
    int durationMs;
    bool explicit;
    ExternalUrls externalUrls;
    String href;
    String id;
    bool isPlayable;
    String name;
    int popularity;
    int trackNumber;
    String uri;
    bool isLocal;

    Track({
        required this.album,
        required this.artists,
        required this.discNumber,
        required this.durationMs,
        required this.explicit,
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.isPlayable,
        required this.name,
        required this.popularity,
        required this.trackNumber,
        required this.uri,
        required this.isLocal,
    });

    factory Track.fromJson(Map<String, dynamic> json) => Track(
        album: Album.fromJson(json["album"]),
        artists: List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        explicit: json["explicit"],
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        isPlayable: json["is_playable"],
        name: json["name"],
        popularity: json["popularity"],
        trackNumber: json["track_number"],
        uri: json["uri"],
        isLocal: json["is_local"],
    );
}

class Album {
    int totalTracks;
    ExternalUrls externalUrls;
    String href;
    String id;
    List<Images> images;
    String name;
    String releaseDate;
    String uri;
    List<Artist> artists;
    bool isPlayable;

    Album({
        required this.totalTracks,
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.images,
        required this.name,
        required this.releaseDate,
        required this.uri,
        required this.artists,
        required this.isPlayable,
    });

    factory Album.fromJson(Map<String, dynamic> json) => Album(
        totalTracks: json["total_tracks"],
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
        name: json["name"],
        releaseDate: json["release_date"],
        uri: json["uri"],
        artists: List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        isPlayable: json["is_playable"],
    );

}


class Artist {
    ExternalUrls externalUrls;
    String href;
    String id;
    String name;
    String uri;

    Artist({
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.name,
        required this.uri,
    });

    factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        name: json["name"],
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

