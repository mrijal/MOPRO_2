import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uts_mrijal_mopro2/models/profile.dart';

class ProfileCubit extends Cubit<Profile> {
  ProfileCubit(Profile initialProfile) : super(initialProfile);

  void setStatus(Status status) {
    emit(state.copyWith(status: status));
  }
}
