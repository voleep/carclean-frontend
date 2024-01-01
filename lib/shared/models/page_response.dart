class PageResponse<T> {
  final int numberOfItems;
  final int numberOfPages;
  final int currentPage;
  final List<T> pageData;

  const PageResponse({
    required this.numberOfItems,
    required this.numberOfPages,
    required this.currentPage,
    required this.pageData,
  });

  factory PageResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return PageResponse<T>(
        numberOfItems: json['numberOfItems'] as int,
        numberOfPages: json['numberOfPages'] as int,
        currentPage: json['currentPage'] as int,
        pageData: (json['pageData'] as List<dynamic>)
            .map((item) => fromJsonT(item))
            .toList());
  }
}
