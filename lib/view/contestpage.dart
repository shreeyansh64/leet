import 'package:flutter/material.dart';
import 'package:leet/models/contestmodel.dart';
import 'package:leet/services/contestservice.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContestPage extends StatefulWidget {
  const ContestPage({super.key});

  @override
  State<ContestPage> createState() => _ContestPageState();
}

class _ContestPageState extends State<ContestPage> {
  bool isLoading = false;
  ContestModel? contestData;

  @override
  void initState() {
    super.initState();
    loadUserAndFetchContest();
  }

  Future<void> loadUserAndFetchContest() async {
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.getString('user') ?? 'defaultusername';
    fetchContest(user);
  }

  Future<void> fetchContest(String username) async {
    setState(() => isLoading = true);
    final service = ContestService();
    final fetchedData = await service.fetchContest(username);
    if (!mounted) return;
    setState(() {
      contestData = fetchedData;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contests")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : contestData == null
              ? const Center(child: Text("No user found"))
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Contests Attended: ${contestData?.contestAttend ?? 0}"),
                      Text("Global Rating: ${contestData?.contestRating ?? 'N/A'}"),
                      Text(
                          "Global Ranking: ${contestData?.contestGlobalRanking ?? 'N/A'} / ${contestData?.totalParticipants ?? 'N/A'}"),
                      Text(
                          "Top Percentage: ${contestData?.contestTopPercentage ?? 0}%"),
                      Text("Active Badge: ${contestData?.contestBadges?.name ?? 'N/A'}"),
                      const SizedBox(height: 16),
                      const Text("Contest Participations:"),
                      Expanded(
                        child: ListView.builder(
                          itemCount: contestData?.contestParticipation.length ?? 0,
                          itemBuilder: (context, index) {
                            final contest = contestData!.contestParticipation[index];
                            return ListTile(
                              title: Text(contest.contest?.title ?? 'Unknown Contest'),
                              subtitle: Text(
                                  "Rating: ${contest.rating}, Rank: ${contest.ranking}, Solved: ${contest.problemsSolved}/${contest.totalProblems}, Trend: ${contest.trendDirection}, Time: ${contest.finishTimeInSeconds}s"),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
