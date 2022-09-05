import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
    DataModel({
      required  this.data,
    });

    List<Datum> data;

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.date,
        this.homeTeam,
        this.homeTeamScore,
        this.period,
        this.postseason,
        this.season,
        this.status,
        this.time,
        this.visitorTeam,
        this.visitorTeamScore,
    });

    int? id;
    DateTime? date;
    Team? homeTeam;
    int? homeTeamScore;
    int? period;
    bool? postseason;
    int? season;
    String? status;
    Time? time;
    Team? visitorTeam;
    int? visitorTeamScore;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        homeTeam: Team.fromJson(json["home_team"]),
        homeTeamScore: json["home_team_score"],
        period: json["period"],
        postseason: json["postseason"],
        season: json["season"],
        status: json["status"],
        time: timeValues.map[json["time"]],
        visitorTeam: Team.fromJson(json["visitor_team"]),
        visitorTeamScore: json["visitor_team_score"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": date!.toIso8601String(),
        "home_team": homeTeam!.toJson(),
        "home_team_score": homeTeamScore,
        "period": period,
        "postseason": postseason,
        "season": season,
        "status": status,
        "time": timeValues.reverse[time],
        "visitor_team": visitorTeam?.toJson(),
        "visitor_team_score": visitorTeamScore,
    };
}

class Team {
    Team({
     required   this.id,
    required    this.abbreviation,
    required    this.city,
    required    this.conference,
    required    this.division,
     required   this.fullName,
     required   this.name,
    });

    int  id;
    String abbreviation;
    String city;
    String? conference;
    String? division;
    String fullName;
    String name;

    factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        abbreviation: json["abbreviation"],
        city: json["city"],
        conference:json["conference"],
        division: json["division"],
        fullName: json["full_name"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "abbreviation": abbreviation,
        "city": city,
        "conference": conferenceValues.reverse[conference],
        "division": divisionValues.reverse[division],
        "full_name": fullName,
        "name": name,
    };
}

enum Conference { EAST, WEST }

final conferenceValues = EnumValues({
    "East": Conference.EAST,
    "West": Conference.WEST
});

enum Division { CENTRAL, PACIFIC, ATLANTIC, SOUTHWEST, NORTHWEST, SOUTHEAST }

final divisionValues = EnumValues({
    "Atlantic": Division.ATLANTIC,
    "Central": Division.CENTRAL,
    "Northwest": Division.NORTHWEST,
    "Pacific": Division.PACIFIC,
    "Southeast": Division.SOUTHEAST,
    "Southwest": Division.SOUTHWEST
});

enum Time { EMPTY }

final timeValues = EnumValues({
    "     ": Time.EMPTY
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        return reverseMap ??= map.map((k, v) => new MapEntry(v, k));
        
    }
}
