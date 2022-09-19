class Player {
  final String title;
  final String playingRole;
  final String country;

  Player(this.title, this.playingRole, this.country);

  Player.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        playingRole = json['playing_role'],
        country = json['country'];
}
