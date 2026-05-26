class HelloState {
  bool isLoading;
  String? message;
  String? error;

  HelloState({this.isLoading = false, this.message, this.error});

  HelloState copyWith({bool? isLoading, String? message, String? error}) {
    return HelloState(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      error: error,
    );
  }
}
