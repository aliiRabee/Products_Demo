import 'package:dependencies/dependencies.dart';

class MetaEntity extends Equatable {
  final int page;
  final int pageSize;
  final int count;
  final int total;
  final int totalPages;

  const MetaEntity(
      {required this.page,
      required this.pageSize,
      required this.count,
      required this.total,
      required this.totalPages});

  @override
  List<Object> get props => [page, pageSize, count, total, totalPages];
}
