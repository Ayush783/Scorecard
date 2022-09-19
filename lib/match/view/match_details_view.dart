import 'package:flutter/material.dart';

import '../widgets/squad_tab.dart';

class MatchDetailView extends StatefulWidget {
  const MatchDetailView({super.key});

  @override
  State<MatchDetailView> createState() => _MatchDetailViewState();
}

class _MatchDetailViewState extends State<MatchDetailView>
    with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, size.height / 4),
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              'assets/images/cricket-bg.png',
            ),
            fit: BoxFit.fill,
          )),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text("India vs Afghanistan"),
            bottom: TabBar(
              controller: controller,
              tabs: [
                buildTab('Squads'),
                buildTab('Scorecard'),
                buildTab('Commentary'),
                buildTab('Highlights'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          SquadTab(),
          ScorecardTab(),
          CommentaryTab(),
          HighlightsTab(),
        ],
      ),
    );
  }

  Tab buildTab(String text) => Tab(
        child: Text(text),
      );
}

class ScorecardTab extends StatelessWidget {
  const ScorecardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CommentaryTab extends StatelessWidget {
  const CommentaryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class HighlightsTab extends StatelessWidget {
  const HighlightsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
