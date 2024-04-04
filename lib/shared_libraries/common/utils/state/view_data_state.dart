import 'package:equatable/equatable.dart';

abstract class ViewState<S extends ViewStatus> {
  final S status;

  ViewState({required this.status});
}

abstract class ViewStatus {
  ViewStatus();

  factory ViewStatus.loading() => Loading();

  factory ViewStatus.initial() => Initial();

  factory ViewStatus.loaded() => LoadedData();

  factory ViewStatus.error({Object? error, String? msg}) =>
      HasError(error: error, message: msg);

  factory ViewStatus.noData() => HasNoData();
}

class Loading extends ViewStatus {}

final class Initial extends ViewStatus {}

final class LoadedData extends ViewStatus {}

final class LoadedPaginatedData<T> extends ViewStatus with EquatableMixin {
  final String? nextPageToken;

  final List<T> items;

  LoadedPaginatedData({required this.items, this.nextPageToken});

  @override
  List<Object?> get props => [items, nextPageToken];
}

final class HasError extends ViewStatus with EquatableMixin {
  final Object? error;
  final String? message;

  HasError({this.error, this.message});

  @override
  List<Object?> get props => [error, message];
}

final class HasNoData extends ViewStatus {}

extension ViewStatusExtension on ViewStatus {
  bool get isLoading => this is Loading;

  bool get isInitial => this is Initial;

  bool get hasData => this is LoadedData;

  bool get hasError => this is HasError;

  bool get hasNoData => this is HasNoData;

  String? get errorMessage => (this as HasError).message;
}
