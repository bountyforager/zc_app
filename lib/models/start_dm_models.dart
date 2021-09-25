import 'dart:convert';
//User model
class UserModel {
  String? id;
  String? orgId;

  bool isOnline;
  String? imageUrl;
  String? files;
  String? fullName;
  String? status;
  String? email;
  String? displayName;
  String? bio;
  String? pronouns;
  String? phone;
  String? timeZone;
  String? joinedAt;
  bool isChecked;
  UserModel({
    this.id,
    this.orgId,
    this.isOnline = false,
    this.imageUrl,
    this.fullName,
    this.files,
    this.status,
    this.email,
    this.displayName,
    this.bio,
    this.pronouns,
    this.phone,
    this.timeZone,
    this.joinedAt,
    this.isChecked = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModel &&
          runtimeType == other.runtimeType &&
          fullName == other.fullName;

  @override
  int get hashCode => fullName.hashCode;

  @override
  String toString() {
    return fullName!;
  }

  Map<String, dynamic> toMap() {
    return {
      "_id": id,
      "org_id": orgId,
      "presence": isOnline,
      "files": files,
      "image_url": imageUrl,
      "name": fullName,
      "status": status,
      "email": email,
      "display_name": displayName,
      "bio": bio,
      "pronouns": pronouns,
      "phone": phone,
      "time_zone": timeZone,
      "joined_at": joinedAt,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      id: json["_id"],
      orgId: json["org_id"],
      isOnline: json["presence"] == "true",
      // files: Files.fromJson(json["files"]),
      imageUrl: json["image_url"],
      fullName: json["user_name"],
      status: json["status"],
      email: json["email"],
      displayName: json["user_name"],
      bio: json["bio"],
      pronouns: json["pronouns"],
      phone: json["phone"],
      timeZone: json["time_zone"],
      joinedAt: json["joined_at"],
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory UserModel.fromJson(Map<String, dynamic> source) =>
      UserModel.fromMap(source);
}

//Channel model
class ChannelModel {
  String? channelId;
  String? channelName;
  String? channelIcon;

  ChannelModel({this.channelId, this.channelName, this.channelIcon});

  Map<String, dynamic> toMap() {
    return {
      'id': channelId,
      'channelName': channelName,
      'channelIcon': channelIcon,
    };
  }

  factory ChannelModel.fromMap(Map<String, dynamic> map) {
    return ChannelModel(
      channelId: map['channelId'],
      channelName: map['channelName'],
      channelIcon: map['channelIcon'],
    );
  }

  String toJson() => json.encode(toMap());
  factory ChannelModel.fromJson(String source) =>
      ChannelModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChannelModel &&
          runtimeType == other.runtimeType &&
          channelName == other.channelName;

  @override
  int get hashCode => channelName.hashCode;

  @override
  String toString() {
    return channelName.toString();
  }
}


//SearchModel
class SearchModel {
  UserModel? userSearch;
  ChannelModel? channelSearch;

  SearchModel({this.userSearch, this.channelSearch});


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchModel &&
          runtimeType == other.runtimeType &&
         userSearch == other.userSearch;

  @override
  int get hashCode => userSearch.hashCode;

  @override
  String toString() {
    return userSearch.toString();
  }


   Map<String, dynamic> toMap() {
    return {
      'userSearch': userSearch,
      'channelSearch': channelSearch,
    };
  } 
   factory SearchModel.fromMap(Map<String, dynamic> map) {
    return SearchModel(
      userSearch: map['userSearch'],
      channelSearch: map['channelSearch'],
    );
  }

  String toJson() => json.encode(toMap());
  factory SearchModel.fromJson(String source) =>
      SearchModel.fromMap(json.decode(source));
}

