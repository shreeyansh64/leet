class ContestModel {
  final int contestAttend;
  final double contestRating;
  final int contestGlobalRanking;
  final int totalParticipants;
  final double contestTopPercentage;
  final ContestBadge? contestBadges;
  final List<ContestParticipation> contestParticipation;

  ContestModel({
    required this.contestAttend,
    required this.contestRating,
    required this.contestGlobalRanking,
    required this.totalParticipants,
    required this.contestTopPercentage,
    this.contestBadges,
    required this.contestParticipation,
  });

  factory ContestModel.fromJson(Map<String, dynamic> json) {
    return ContestModel(
      contestAttend: json['contestAttend'] ?? 0,
      contestRating: (json['contestRating'] ?? 0).toDouble(),
      contestGlobalRanking: json['contestGlobalRanking'] ?? 0,
      totalParticipants: json['totalParticipants'] ?? 0,
      contestTopPercentage: (json['contestTopPercentage'] ?? 0).toDouble(),
      contestBadges: json['contestBadges'] != null
          ? ContestBadge.fromJson(json['contestBadges'])
          : null,
      contestParticipation: (json['contestParticipation'] as List<dynamic>?)
              ?.map((e) => ContestParticipation.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class ContestBadge {
  final String name;

  ContestBadge({required this.name});

  factory ContestBadge.fromJson(Map<String, dynamic> json) {
    return ContestBadge(
      name: json['name'] ?? 'N/A',
    );
  }
}

class ContestParticipation {
  final bool attended;
  final double rating;
  final int ranking;
  final String trendDirection;
  final int problemsSolved;
  final int totalProblems;
  final int finishTimeInSeconds;
  final ContestDetails? contest;

  ContestParticipation({
    required this.attended,
    required this.rating,
    required this.ranking,
    required this.trendDirection,
    required this.problemsSolved,
    required this.totalProblems,
    required this.finishTimeInSeconds,
    this.contest,
  });

  factory ContestParticipation.fromJson(Map<String, dynamic> json) {
    return ContestParticipation(
      attended: json['attended'] ?? false,
      rating: (json['rating'] ?? 0).toDouble(),
      ranking: json['ranking'] ?? 0,
      trendDirection: json['trendDirection'] ?? 'N/A',
      problemsSolved: json['problemsSolved'] ?? 0,
      totalProblems: json['totalProblems'] ?? 0,
      finishTimeInSeconds: json['finishTimeInSeconds'] ?? 0,
      contest: json['contest'] != null
          ? ContestDetails.fromJson(json['contest'])
          : null,
    );
  }
}

class ContestDetails {
  final String title;
  final int startTime;

  ContestDetails({required this.title, required this.startTime});

  factory ContestDetails.fromJson(Map<String, dynamic> json) {
    return ContestDetails(
      title: json['title'] ?? 'Unknown',
      startTime: json['startTime'] ?? 0,
    );
  }
}
