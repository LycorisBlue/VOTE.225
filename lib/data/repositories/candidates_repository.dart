import 'package:dartz/dartz.dart';
import '/data/graph_query/query.dart';
import '/data/models/user.dart';
import '/services/networks/apis/api_base.dart';
import '/services/networks/apis/rest_api_reponse.dart';
import '/services/networks/apis/rest_api_service.dart';

abstract class CandidatesRepository {
  Future<Either<List<String>, ApiResponse>> getCandidates();
}

class CandidatesRepositoryImpl extends ApiBase<UserAccount>
    implements CandidatesRepository {
  @override
  Future<Either<List<String>, ApiResponse>> getCandidates() async {
    return await makeRequestApi(
     RestApiServices().dio.post(
        'graphql/',
       data: {'query': candidatesQuery},
      ),
    );
  }
}