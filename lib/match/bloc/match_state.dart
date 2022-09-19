part of 'match_bloc.dart';

class MatchState extends Equatable {
  const MatchState({
    this.isLoading = true,
    this.hasError = false,
    this.data = const {},
  });

  final bool isLoading;
  final bool hasError;
  final Map<String, dynamic> data;

  MatchState copyWith({
    bool isLoading = false,
    bool hasError = false,
    Map<String, dynamic>? data,
  }) {
    return MatchState(
      isLoading: isLoading,
      hasError: hasError,
      data: data ?? this.data,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        hasError,
        data,
      ];
}
