class FiltersResponseModel {
  List<String>? values;

  FiltersResponseModel._internal({this.values});

  factory FiltersResponseModel.fromJson(Map<String, dynamic> json) {
    return FiltersResponseModel._internal(
      values: json['values'] != null
          ? (json['values'] as List).map((e) => e.toString()).toList()
          : null,
    );
  }
}
