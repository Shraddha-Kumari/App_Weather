import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weatherapp/cubits/temp_settings/temp_settings_event.dart';

part 'temp_settings_state.dart';


class TempSettingsBloc extends Bloc<TempSettingsEvent,TempSettingsState> {
  TempSettingsBloc() : super(TempSettingsState.initial());

  void toggleTempUnit() {
    emit(
      state.copyWith(
        tempUnit: state.tempUnit == TempUnit.celsius
            ? TempUnit.fahrenheit
            : TempUnit.celsius,
      ),
    );
    print('tempUnit: $state');
  }
}
