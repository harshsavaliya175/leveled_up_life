import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leveled_up_life/api/repo/bible_book_repo.dart';
import 'package:leveled_up_life/models/response_model/bible_all_book_model/bible_all_books.dart';

part 'bible_screen_cubit.freezed.dart';
part 'bible_screen_state.dart';

class BibleScreenCubit extends Cubit<BibleScreenState> {
  final BibleBookRepo _bibleBookRepo;

  BibleScreenCubit(this._bibleBookRepo) : super(const BibleScreenState());

  Future<void> getAllBibleBooks() async {
    EasyLoading.show();
    emit(state.copyWith(bibleBooks: []));
    try {
      List data = await _bibleBookRepo.bibleAllBooks();
      List<Books> bibleAllBooks = [];
      for (var element in data) {
        bibleAllBooks.add(Books.fromJson(element));
      }
      emit(state.copyWith(bibleBooks: bibleAllBooks));
      EasyLoading.dismiss();
    } catch (e) {
      log('$e');
      emit(state.copyWith(bibleBooks: []));
      EasyLoading.dismiss();
    }
  }
}
