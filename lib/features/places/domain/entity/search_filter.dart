/// Настройки фильтра для поиска мест:
/// радиус поиска, список категорий
/// эти параметры позволят получить distance с сервера
class SearchFilter {
  final double radius;
  final List<String> typeFilter;

  SearchFilter({
    required this.radius,
    required this.typeFilter,
  });

  @override
  String toString() {
    return 'радиус: $radius, категории: $typeFilter';
  }
}
