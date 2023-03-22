import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../resourse/api_repository.dart';
import '../../resourse/data_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
   final ApiRepository apiRepository = ApiRepository();

    on<GetUserList>((event, emit) async {
      try {
        emit(UserLoading());
        final DataModelJson mList = await apiRepository.fetchUserList();
        emit(UserLoaded(mList));
        if (mList.error != null) {
          emit(UserError(mList.error));
          print("asdasd erererrerererere");
        }
      } on NetworkError {
        emit(const UserError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
