import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scorecard/home/view/home_view.dart';
import 'package:scorecard/match/bloc/match_bloc.dart';
import 'package:scorecard/match/services/match_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MatchBloc(MatchService()),
      child: const MaterialApp(
        home: HomeView(),
      ),
    );
  }
}
