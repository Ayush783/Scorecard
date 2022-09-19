class MatchDataResponse {
  final Map<String, dynamic> data;
  final bool hasError;

  MatchDataResponse(this.data, this.hasError);

  MatchDataResponse.success(Map<String, dynamic> json)
      : data = json,
        hasError = false;

  MatchDataResponse.failure()
      : data = {},
        hasError = true;
}
