import 'package:bloc/bloc.dart';

class PagesCubit extends Cubit<int> {
  PagesCubit() : super(0);

  void setPage(int newpage) {
    emit(newpage);
  }
}
