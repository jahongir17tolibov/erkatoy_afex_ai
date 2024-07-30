import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'zen_event.dart';
part 'zen_state.dart';

class ZenBloc extends Bloc<ZenEvent, ZenState> {
  ZenBloc() : super(ZenInitial()) {
    on<ZenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
