import 'package:book_app/core/utlis/api_service.dart';
import 'package:book_app/features/Home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;
void setup() {
  getit.registerSingleton<ApiService>(ApiService(Dio()));
  getit.registerSingleton<HomeRepoIPmpl>(
    HomeRepoIPmpl(apiService: getit.get<ApiService>()),
  );
}
