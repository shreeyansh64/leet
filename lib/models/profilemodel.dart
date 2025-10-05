class Profile {
  final String username;
  final String name;
  final String birthday;
  final String avatar;
  final int ranking;
  final int reputation;
  final String? gitHub;
  final String? twitter;
  final String? linkedIN;
  final List<String>? website;
  final String country;
  final String? company;
  final String? school;
  final List<String>? skillTags;
  final String? about;

  Profile({
    required this.username,
    required this.name,
    required this.birthday,
    required this.avatar,
    required this.ranking,
    required this.reputation,
    this.gitHub,
    this.twitter,
    this.linkedIN,
    this.website,
    required this.country,
    this.company,
    this.school,
    this.skillTags,
    this.about,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      username: json['username'] ?? '',
      name: json['name'] ?? '',
      birthday: json['birthday'] ?? '',
      avatar: json['avatar'] ?? '',
      ranking: json['ranking'] ?? 0,
      reputation: json['reputation'] ?? 0,
      gitHub: json['gitHub'],
      twitter: json['twitter'],
      linkedIN: json['linkedIN'],
      website: json['website'] != null ? List<String>.from(json['website']) : [],
      country: json['country'] ?? '',
      company: json['company'],
      school: json['school'],
      skillTags: json['skillTags'] != null ? List<String>.from(json['skillTags']) : [],
      about: json['about'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'name': name,
      'birthday': birthday,
      'avatar': avatar,
      'ranking': ranking,
      'reputation': reputation,
      'gitHub': gitHub,
      'twitter': twitter,
      'linkedIN': linkedIN,
      'website': website,
      'country': country,
      'company': company,
      'school': school,
      'skillTags': skillTags,
      'about': about,
    };
  }
}
