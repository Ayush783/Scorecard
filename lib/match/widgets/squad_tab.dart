import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scorecard/match/models/player.dart';

import '../bloc/match_bloc.dart';

class SquadTab extends StatelessWidget {
  const SquadTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchBloc, MatchState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.hasError) {
          return const Center(
            child: Text('An error occoured'),
          );
        } else {
          return SquadTabBody(state.data);
        }
      },
    );
  }
}

class SquadTabBody extends StatelessWidget {
  const SquadTabBody(this.data, {super.key});

  final Map<String, dynamic> data;

  List<Player> get team1 =>
      (List<Map<String, dynamic>>.from(data['data']['matchData']['players']))
          .where((element) => element['country'] == 'in')
          .map((json) => Player.fromJson(json))
          .toList();

  List<Player> get team2 =>
      (List<Map<String, dynamic>>.from(data['data']['matchData']['players']))
          .where((element) => element['country'] == 'af')
          .map((json) => Player.fromJson(json))
          .toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('Playing XI'),
            SizedBox(height: 20),
            ListView.builder(
              itemCount: team1.length + 1,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                        child: index == 0
                            ? buildHeader('Ind')
                            : buildPlayerTile(team1[index - 1])),
                    Expanded(
                        child: index == 0
                            ? buildHeader('Afg', trailing: true)
                            : buildPlayerTile(team2[index - 1],
                                trailing: true)),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }

  ListTile buildPlayerTile(Player p, {bool trailing = false}) {
    return ListTile(
      leading: trailing ? null : CircleAvatar(radius: 16),
      trailing: !trailing ? null : CircleAvatar(radius: 16),
      title: Align(
        alignment: trailing ? Alignment.centerRight : Alignment.centerLeft,
        child: Text(
          p.title,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: Align(
          alignment: trailing ? Alignment.centerRight : Alignment.centerLeft,
          child: Text(p.playingRole)),
    );
  }

  ListTile buildHeader(String country, {bool trailing = false}) {
    return ListTile(
      leading: trailing ? null : CircleAvatar(radius: 16),
      trailing: trailing ? CircleAvatar(radius: 16) : null,
      title: Text(country),
    );
  }
}
