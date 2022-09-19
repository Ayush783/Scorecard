import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scorecard/match/bloc/match_bloc.dart';
import 'package:scorecard/match/view/match_details_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RawMaterialButton(
          onPressed: () {
            context.read<MatchBloc>().add(GetMatchData());
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MatchDetailView(),
              ),
            );
          },
          child: Text(
            'Ind vs Afg',
          ),
        ),
      ),
    );
  }
}
