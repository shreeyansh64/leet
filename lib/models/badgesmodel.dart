  class BadgeModel {
  final int badgesCount;
  final List<Badge> badges;
  final List<UpcomingBadge> upcomingBadges;
  final Badge? activeBadge;

  BadgeModel({
    required this.badgesCount,
    required this.badges,
    required this.upcomingBadges,
    required this.activeBadge,
  });

  factory BadgeModel.fromJson(Map<String, dynamic> json) {
    return BadgeModel(
      badgesCount: json['badgesCount'] ?? 0,
      badges: (json['badges'] as List<dynamic>?)
              ?.map((b) => Badge.fromJson(b))
              .toList() ??
          [],
      upcomingBadges: (json['upcomingBadges'] as List<dynamic>?)
              ?.map((b) => UpcomingBadge.fromJson(b))
              .toList() ??
          [],
      activeBadge: json['activeBadge'] != null
          ? Badge.fromJson(json['activeBadge'])
          : null,
    );
  }
}

class Badge {
  final String id;
  final String displayName;
  final String icon;
  final String creationDate;

  Badge({
    required this.id,
    required this.displayName,
    required this.icon,
    required this.creationDate,
  });

  factory Badge.fromJson(Map<String, dynamic> json) {
    return Badge(
      id: json['id'] ?? '',
      displayName: json['displayName'] ?? '',
      icon: json['icon'] ?? '',
      creationDate: json['creationDate'] ?? '',
    );
  }
}

class UpcomingBadge {
  final String name;
  final String icon;

  UpcomingBadge({
    required this.name,
    required this.icon,
  });

  factory UpcomingBadge.fromJson(Map<String, dynamic> json) {
    return UpcomingBadge(
      name: json['name'] ?? '',
      icon: json['icon'] ?? '',
    );
  }
}
