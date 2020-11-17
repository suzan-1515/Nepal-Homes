import 'package:equatable/equatable.dart';

class PageConfig extends Equatable {
  final int page;
  final int pageSize;

  PageConfig({this.page = 1, this.pageSize = 15});
  @override
  List<Object> get props => [page, pageSize];
}
