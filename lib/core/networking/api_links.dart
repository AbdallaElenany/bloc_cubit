class AppLink {
  static const String server = "https://www.googleapis.com/books/v1";

// =================================()================================== //
  static const String newestBooks =
      "$server/volumes?Filtering=free-ebooks&Sorting=newest&q=Programming";
  static const String featuredBooks =
      "$server/volumes?Filtering=free-ebooks&q=AI";
  static const String similarBooks =
      "$server/volumes?Filtering=free-ebooks&Sorting=relevance&q=computer science";
}


class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}