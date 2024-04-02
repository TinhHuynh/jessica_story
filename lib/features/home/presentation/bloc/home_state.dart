import 'package:equatable/equatable.dart';

import '../../../../shared_libraries/common/utils/state/view_data_state.dart';

class HomeState extends ViewState with EquatableMixin {
  HomeState({required super.status});

  HomeState copyWith({
    ViewStatus? status,
  }) {
    return HomeState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}
