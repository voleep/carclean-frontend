class GenericResponse<T> {
  final T? data;
  final String? errorMessage;

  const GenericResponse({required this.data, this.errorMessage});

  factory GenericResponse.fromJsonT(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    final {'data': data, 'errorMessage': errorMessage as String?} = json;

    return GenericResponse(
      data: data == null ? null : fromJsonT(data),
      errorMessage: errorMessage,
    );
  }

  factory GenericResponse.fromJson(Map<String, dynamic> json) {
    final {'data': data as T, 'errorMessage': errorMessage as String?} = json;
    return GenericResponse(data: data, errorMessage: errorMessage);
  }
}
