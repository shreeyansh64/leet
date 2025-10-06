class StatsModel {
  final int solvedProblem;
  final int easySolved;
  final int mediumSolved;
  final int hardSolved;
  final List<SubmissionData> totalSubmissionNum;
  final List<SubmissionData> acSubmissionNum;

  StatsModel({
    required this.solvedProblem,
    required this.easySolved,
    required this.mediumSolved,
    required this.hardSolved,
    required this.totalSubmissionNum,
    required this.acSubmissionNum,
  });

  factory StatsModel.fromJson(Map<String, dynamic> json) {
    return StatsModel(
      solvedProblem: json['solvedProblem'] ?? 0,
      easySolved: json['easySolved'] ?? 0,
      mediumSolved: json['mediumSolved'] ?? 0,
      hardSolved: json['hardSolved'] ?? 0,
      totalSubmissionNum: (json['totalSubmissionNum'] as List<dynamic>)
          .map((e) => SubmissionData.fromJson(e))
          .toList(),
      acSubmissionNum: (json['acSubmissionNum'] as List<dynamic>)
          .map((e) => SubmissionData.fromJson(e))
          .toList(),
    );
  }
}

class SubmissionData {
  final String difficulty;
  final int count;
  final int submissions;

  SubmissionData({
    required this.difficulty,
    required this.count,
    required this.submissions,
  });

  factory SubmissionData.fromJson(Map<String, dynamic> json) {
    return SubmissionData(
      difficulty: json['difficulty'] ?? '',
      count: json['count'] ?? 0,
      submissions: json['submissions'] ?? 0,
    );
  }
}
