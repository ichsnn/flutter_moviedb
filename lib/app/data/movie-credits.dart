// To parse this JSON data, do
//
//     final movieCredits = movieCreditsFromJson(jsonString);

import 'dart:convert';

MovieCredits movieCreditsFromJson(String str) => MovieCredits.fromJson(json.decode(str));

String movieCreditsToJson(MovieCredits data) => json.encode(data.toJson());

class MovieCredits {
    MovieCredits({
        this.id,
        this.cast,
        this.crew,
    });

    int ? id;
    List<Cast> ? cast;
    List<Cast> ? crew;

    factory MovieCredits.fromJson(Map<String, dynamic> json) => MovieCredits(
        id: json["id"] == null ? null : json["id"],
        cast: json["cast"] == null ? null : List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        crew: json["crew"] == null ? null : List<Cast>.from(json["crew"].map((x) => Cast.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "cast": cast == null ? null : List<dynamic>.from(cast!.map((x) => x.toJson())),
        "crew": crew == null ? null : List<dynamic>.from(crew!.map((x) => x.toJson())),
    };
}

class Cast {
    Cast({
        this.adult,
        this.gender,
        this.id,
        this.knownForDepartment,
        this.name,
        this.originalName,
        this.popularity,
        this.profilePath,
        this.castId,
        this.character,
        this.creditId,
        this.order,
        this.department,
        this.job,
    });

    bool ? adult;
    int ? gender;
    int ? id;
    Department ? knownForDepartment;
    String ? name;
    String ? originalName;
    double ? popularity;
    String ? profilePath;
    int ? castId;
    String ? character;
    String ? creditId;
    int ? order;
    Department ? department;
    String ? job;

    factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        adult: json["adult"] == null ? null : json["adult"],
        gender: json["gender"] == null ? null : json["gender"],
        id: json["id"] == null ? null : json["id"],
        knownForDepartment: json["known_for_department"] == null ? null : departmentValues.map![json["known_for_department"]],
        name: json["name"] == null ? null : json["name"],
        originalName: json["original_name"] == null ? null : json["original_name"],
        popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
        castId: json["cast_id"] == null ? null : json["cast_id"],
        character: json["character"] == null ? null : json["character"],
        creditId: json["credit_id"] == null ? null : json["credit_id"],
        order: json["order"] == null ? null : json["order"],
        department: json["department"] == null ? null : departmentValues.map![json["department"]],
        job: json["job"] == null ? null : json["job"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult == null ? null : adult,
        "gender": gender == null ? null : gender,
        "id": id == null ? null : id,
        "known_for_department": knownForDepartment == null ? null : departmentValues.reverse[knownForDepartment],
        "name": name == null ? null : name,
        "original_name": originalName == null ? null : originalName,
        "popularity": popularity == null ? null : popularity,
        "profile_path": profilePath == null ? null : profilePath,
        "cast_id": castId == null ? null : castId,
        "character": character == null ? null : character,
        "credit_id": creditId == null ? null : creditId,
        "order": order == null ? null : order,
        "department": department == null ? null : departmentValues.reverse[department],
        "job": job == null ? null : job,
    };
}

enum Department { ACTING, COSTUME_MAKE_UP, PRODUCTION, WRITING, SOUND, ART, EDITING, CAMERA, CREW, DIRECTING, VISUAL_EFFECTS }

final departmentValues = EnumValues({
    "Acting": Department.ACTING,
    "Art": Department.ART,
    "Camera": Department.CAMERA,
    "Costume & Make-Up": Department.COSTUME_MAKE_UP,
    "Crew": Department.CREW,
    "Directing": Department.DIRECTING,
    "Editing": Department.EDITING,
    "Production": Department.PRODUCTION,
    "Sound": Department.SOUND,
    "Visual Effects": Department.VISUAL_EFFECTS,
    "Writing": Department.WRITING
});

class EnumValues<T> {
    Map<String, T> ? map;
    Map<T, String> ? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map!.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap!;
    }
}
