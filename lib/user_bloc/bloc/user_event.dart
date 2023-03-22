part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<DataModelJson> get props => [];
}

class GetUserList extends UserEvent {}