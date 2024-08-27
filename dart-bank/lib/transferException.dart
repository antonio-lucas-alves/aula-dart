class TransferException implements Exception {
  late final String message;

  TransferException(this.message);

  @override
  String toString() {
    return "TransferException: $message";
  }
}
