import 'dart:convert';

PhotoModel photoModelFromJson(String str) => PhotoModel.fromJson(json.decode(str));

String photoModelToJson(PhotoModel data) => json.encode(data.toJson());

class PhotoModel {
    PhotoModel({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.promotedAt,
        this.width,
        this.height,
        this.color,
        this.blurHash,
        this.description,
        this.altDescription,
        this.urls,
        this.links,
        this.likes,
        this.likedByUser,
        this.currentUserCollections,
        this.sponsorship,
        this.user,
    });

    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic promotedAt;
    int? width;
    int? height;
    String? color;
    String? blurHash;
    dynamic description;
    dynamic altDescription;
    Urls? urls;
    PhotoModelLinks? links;
    int? likes;
    bool? likedByUser;
    List<dynamic>? currentUserCollections;
    Sponsorship? sponsorship;
    User? user;

    PhotoModel copyWith({
        String? id,
        DateTime? createdAt,
        DateTime? updatedAt,
        dynamic promotedAt,
        int? width,
        int? height,
        String? color,
        String? blurHash,
        dynamic description,
        dynamic altDescription,
        Urls? urls,
        PhotoModelLinks? links,
        int? likes,
        bool? likedByUser,
        List<dynamic>? currentUserCollections,
        Sponsorship? sponsorship,
        User? user,
    }) => 
        PhotoModel(
            id: id ?? this.id,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            promotedAt: promotedAt ?? this.promotedAt,
            width: width ?? this.width,
            height: height ?? this.height,
            color: color ?? this.color,
            blurHash: blurHash ?? this.blurHash,
            description: description ?? this.description,
            altDescription: altDescription ?? this.altDescription,
            urls: urls ?? this.urls,
            links: links ?? this.links,
            likes: likes ?? this.likes,
            likedByUser: likedByUser ?? this.likedByUser,
            currentUserCollections: currentUserCollections ?? this.currentUserCollections,
            sponsorship: sponsorship ?? this.sponsorship,
            user: user ?? this.user,
        );

    factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
        id: json["id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        promotedAt: json["promoted_at"],
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        urls: json["urls"] == null ? null : Urls.fromJson(json["urls"]),
        links: json["links"] == null ? null : PhotoModelLinks.fromJson(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections: json["current_user_collections"] == null ? [] : List<dynamic>.from(json["current_user_collections"]!.map((x) => x)),
        sponsorship: json["sponsorship"] == null ? null : Sponsorship.fromJson(json["sponsorship"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "promoted_at": promotedAt,
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,
        "urls": urls?.toJson(),
        "links": links?.toJson(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections": currentUserCollections == null ? [] : List<dynamic>.from(currentUserCollections!.map((x) => x)),
        "sponsorship": sponsorship?.toJson(),
        "user": user?.toJson(),
    };
}

class PhotoModelLinks {
    PhotoModelLinks({
        this.self,
        this.html,
        this.download,
        this.downloadLocation,
    });

    String? self;
    String? html;
    String? download;
    String? downloadLocation;

    PhotoModelLinks copyWith({
        String? self,
        String? html,
        String? download,
        String? downloadLocation,
    }) => 
        PhotoModelLinks(
            self: self ?? this.self,
            html: html ?? this.html,
            download: download ?? this.download,
            downloadLocation: downloadLocation ?? this.downloadLocation,
        );

    factory PhotoModelLinks.fromJson(Map<String, dynamic> json) => PhotoModelLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
        downloadLocation: json["download_location"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
    };
}

class Sponsorship {
    Sponsorship({
        this.impressionUrls,
        this.tagline,
        this.taglineUrl,
        this.sponsor,
    });

    List<String>? impressionUrls;
    String? tagline;
    String? taglineUrl;
    User? sponsor;

    Sponsorship copyWith({
        List<String>? impressionUrls,
        String? tagline,
        String? taglineUrl,
        User? sponsor,
    }) => 
        Sponsorship(
            impressionUrls: impressionUrls ?? this.impressionUrls,
            tagline: tagline ?? this.tagline,
            taglineUrl: taglineUrl ?? this.taglineUrl,
            sponsor: sponsor ?? this.sponsor,
        );

    factory Sponsorship.fromJson(Map<String, dynamic> json) => Sponsorship(
        impressionUrls: json["impression_urls"] == null ? [] : List<String>.from(json["impression_urls"]!.map((x) => x)),
        tagline: json["tagline"],
        taglineUrl: json["tagline_url"],
        sponsor: json["sponsor"] == null ? null : User.fromJson(json["sponsor"]),
    );

    Map<String, dynamic> toJson() => {
        "impression_urls": impressionUrls == null ? [] : List<dynamic>.from(impressionUrls!.map((x) => x)),
        "tagline": tagline,
        "tagline_url": taglineUrl,
        "sponsor": sponsor?.toJson(),
    };
}

class User {
    User({
        this.id,
        this.updatedAt,
        this.username,
        this.name,
        this.firstName,
        this.lastName,
        this.twitterUsername,
        this.portfolioUrl,
        this.bio,
        this.location,
        this.links,
        this.profileImage,
        this.instagramUsername,
        this.totalCollections,
        this.totalLikes,
        this.totalPhotos,
        this.acceptedTos,
        this.forHire,
        this.social,
    });

    String? id;
    DateTime? updatedAt;
    String? username;
    String? name;
    String? firstName;
    dynamic lastName;
    String? twitterUsername;
    String? portfolioUrl;
    String? bio;
    dynamic location;
    UserLinks? links;
    ProfileImage? profileImage;
    String? instagramUsername;
    int? totalCollections;
    int? totalLikes;
    int? totalPhotos;
    bool? acceptedTos;
    bool? forHire;
    Social? social;

    User copyWith({
        String? id,
        DateTime? updatedAt,
        String? username,
        String? name,
        String? firstName,
        dynamic lastName,
        String? twitterUsername,
        String? portfolioUrl,
        String? bio,
        dynamic location,
        UserLinks? links,
        ProfileImage? profileImage,
        String? instagramUsername,
        int? totalCollections,
        int? totalLikes,
        int? totalPhotos,
        bool? acceptedTos,
        bool? forHire,
        Social? social,
    }) => 
        User(
            id: id ?? this.id,
            updatedAt: updatedAt ?? this.updatedAt,
            username: username ?? this.username,
            name: name ?? this.name,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            twitterUsername: twitterUsername ?? this.twitterUsername,
            portfolioUrl: portfolioUrl ?? this.portfolioUrl,
            bio: bio ?? this.bio,
            location: location ?? this.location,
            links: links ?? this.links,
            profileImage: profileImage ?? this.profileImage,
            instagramUsername: instagramUsername ?? this.instagramUsername,
            totalCollections: totalCollections ?? this.totalCollections,
            totalLikes: totalLikes ?? this.totalLikes,
            totalPhotos: totalPhotos ?? this.totalPhotos,
            acceptedTos: acceptedTos ?? this.acceptedTos,
            forHire: forHire ?? this.forHire,
            social: social ?? this.social,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        twitterUsername: json["twitter_username"],
        portfolioUrl: json["portfolio_url"],
        bio: json["bio"],
        location: json["location"],
        links: json["links"] == null ? null : UserLinks.fromJson(json["links"]),
        profileImage: json["profile_image"] == null ? null : ProfileImage.fromJson(json["profile_image"]),
        instagramUsername: json["instagram_username"],
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"],
        acceptedTos: json["accepted_tos"],
        forHire: json["for_hire"],
        social: json["social"] == null ? null : Social.fromJson(json["social"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "updated_at": updatedAt?.toIso8601String(),
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "twitter_username": twitterUsername,
        "portfolio_url": portfolioUrl,
        "bio": bio,
        "location": location,
        "links": links?.toJson(),
        "profile_image": profileImage?.toJson(),
        "instagram_username": instagramUsername,
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
        "accepted_tos": acceptedTos,
        "for_hire": forHire,
        "social": social?.toJson(),
    };
}

class UserLinks {
    UserLinks({
        this.self,
        this.html,
        this.photos,
        this.likes,
        this.portfolio,
        this.following,
        this.followers,
    });

    String? self;
    String? html;
    String? photos;
    String? likes;
    String? portfolio;
    String? following;
    String? followers;

    UserLinks copyWith({
        String? self,
        String? html,
        String? photos,
        String? likes,
        String? portfolio,
        String? following,
        String? followers,
    }) => 
        UserLinks(
            self: self ?? this.self,
            html: html ?? this.html,
            photos: photos ?? this.photos,
            likes: likes ?? this.likes,
            portfolio: portfolio ?? this.portfolio,
            following: following ?? this.following,
            followers: followers ?? this.followers,
        );

    factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        likes: json["likes"],
        portfolio: json["portfolio"],
        following: json["following"],
        followers: json["followers"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "likes": likes,
        "portfolio": portfolio,
        "following": following,
        "followers": followers,
    };
}

class ProfileImage {
    ProfileImage({
        this.small,
        this.medium,
        this.large,
    });

    String? small;
    String? medium;
    String? large;

    ProfileImage copyWith({
        String? small,
        String? medium,
        String? large,
    }) => 
        ProfileImage(
            small: small ?? this.small,
            medium: medium ?? this.medium,
            large: large ?? this.large,
        );

    factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
    );

    Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
    };
}

class Social {
    Social({
        this.instagramUsername,
        this.portfolioUrl,
        this.twitterUsername,
        this.paypalEmail,
    });

    String? instagramUsername;
    String? portfolioUrl;
    String? twitterUsername;
    dynamic paypalEmail;

    Social copyWith({
        String? instagramUsername,
        String? portfolioUrl,
        String? twitterUsername,
        dynamic paypalEmail,
    }) => 
        Social(
            instagramUsername: instagramUsername ?? this.instagramUsername,
            portfolioUrl: portfolioUrl ?? this.portfolioUrl,
            twitterUsername: twitterUsername ?? this.twitterUsername,
            paypalEmail: paypalEmail ?? this.paypalEmail,
        );

    factory Social.fromJson(Map<String, dynamic> json) => Social(
        instagramUsername: json["instagram_username"],
        portfolioUrl: json["portfolio_url"],
        twitterUsername: json["twitter_username"],
        paypalEmail: json["paypal_email"],
    );

    Map<String, dynamic> toJson() => {
        "instagram_username": instagramUsername,
        "portfolio_url": portfolioUrl,
        "twitter_username": twitterUsername,
        "paypal_email": paypalEmail,
    };
}

class Urls {
    Urls({
        this.raw,
        this.full,
        this.regular,
        this.small,
        this.thumb,
        this.smallS3,
    });

    String? raw;
    String? full;
    String? regular;
    String? small;
    String? thumb;
    String? smallS3;

    Urls copyWith({
        String? raw,
        String? full,
        String? regular,
        String? small,
        String? thumb,
        String? smallS3,
    }) => 
        Urls(
            raw: raw ?? this.raw,
            full: full ?? this.full,
            regular: regular ?? this.regular,
            small: small ?? this.small,
            thumb: thumb ?? this.thumb,
            smallS3: smallS3 ?? this.smallS3,
        );

    factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
        smallS3: json["small_s3"],
    );

    Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
        "small_s3": smallS3,
    };
}
