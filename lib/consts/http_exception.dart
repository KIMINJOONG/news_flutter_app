class HttpException implements Exception {
  final String codeMessage;

  HttpException(this.codeMessage);

  String get getNewsApiErrorMessage {
    if(codeMessage.contains("apiKeyDisabled")) {
      return "Your API key has been disabled";
    }
    return "Something went wrong";
  }

  @override
  String toString() {
    return codeMessage;
  }
}