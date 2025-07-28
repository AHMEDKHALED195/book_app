import 'package:book_app/core/errors/failures.dart';
import 'package:book_app/features/Home/data/models/book_model/book_model.dart';
import 'package:book_app/features/Home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoIPmpl implements HomeRepo {
  @override
  fetchFeaturedooks() {
    // TODO: implement fetchFeaturedooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetshBestSellerBooks() {
    // TODO: implement fetshBestSellerBooks
    throw UnimplementedError();
  }
}
