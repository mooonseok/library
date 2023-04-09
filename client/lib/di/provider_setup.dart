import 'package:client/data/data_source/book_api.dart';
import 'package:client/data/repository/book_api_repository_impl.dart';
import 'package:client/domain/repository/book_api_repository.dart';
import 'package:client/pages/home/home_view_model.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// 1. Provider 전체
List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

// 2. 독립적인 객체
List<SingleChildWidget> independentModels = [
  Provider<http.Client>(
    create: (context) => http.Client(),
  ),
];

// 3. 2번에 의존성이 있는 객체
List<SingleChildWidget> dependentModels = [
  ProxyProvider<http.Client, BookApi>(
    update: (context, client, _) => BookApi(client),
  ),
  ProxyProvider<BookApi, BookApiRepository>(
    update: (context, api, _) => BookApiRepositoryImpl(api),
  ),
];

// 4. ViewModels
List<SingleChildWidget> viewModels = [
  Provider<HomeViewModel>(
    create: (context) => HomeViewModel(context.read<BookApiRepository>()),
  ),
];
