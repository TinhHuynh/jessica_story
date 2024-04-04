import 'package:equatable/equatable.dart';

class PaginatedResult<T>  extends Equatable {
  final List<T> items;
  final String? nextPageToken;

  const PaginatedResult({
    required this.items,
    this.nextPageToken,
  });

  @override
  List<Object?> get props => [items, nextPageToken];
}
