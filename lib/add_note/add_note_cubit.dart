import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_gdsc/model/add_note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  static AddNoteCubit get(context) => AddNoteCubit.get(context);
  List<AddNoteModel> listNotes = [];
}
