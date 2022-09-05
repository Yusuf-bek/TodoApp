import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(CategoryState state) : super(state);

  int choosenIndex = 0;

  void chooseIndex(int index) {
    choosenIndex = index;
    emit(const CategoryChoosen());
  }
}
