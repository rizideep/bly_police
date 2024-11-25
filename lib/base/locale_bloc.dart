import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prop_olx/base/app_events.dart';
import 'package:prop_olx/base/app_states.dart';

class LocaleBloc extends Bloc<AppEvent, AppStates> {
  LocaleBloc() : super(NeutralState()) {
    on<ChangeLocale>((event, emit) {
      // Emit the new locale state
      emit(LocaleChanged(event.locale));
    });
  }
}
