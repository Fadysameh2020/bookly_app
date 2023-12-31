import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/book_model/book_name.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
}
