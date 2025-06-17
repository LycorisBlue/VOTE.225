import 'package:dartz/dartz.dart';
import '/data/graph_query/query.dart';
import '/data/models/user.dart';
import '/services/networks/apis/api_base.dart';
import '/services/networks/apis/rest_api_reponse.dart';
import '/services/networks/apis/rest_api_service.dart';

abstract class HomeRepository {
  Future<Either<List<String>, ApiResponse>> getHomeArticle();
}

class HomeRepositoryImpl extends ApiBase<UserAccount>
    implements HomeRepository {
  @override
  Future<Either<List<String>, ApiResponse>> getHomeArticle() async {
    return await makeRequestApi(
     RestApiServices().dio.post(
        'graphql/',
       data: {'query': eventsQuery},
      ),
    );
  }
}

