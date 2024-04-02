import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class GetVideo extends HomeEvent {
  final String? pageToken;

  const GetVideo({required this.pageToken});

  @override
  List<Object?> get props => [pageToken];
}
