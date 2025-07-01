import 'package:dartz/dartz.dart';
import 'package:templateproject/data/graph_query/mutations.dart';
import '/data/graph_query/query.dart';
import '/data/models/user.dart';
import '/services/networks/apis/api_base.dart';
import '/services/networks/apis/rest_api_reponse.dart';
import '/services/networks/apis/rest_api_service.dart';

abstract class DisinformationRepository {
  Future<Either<List<String>, ApiResponse>> getSignalement();
  Future<Either<List<String>, ApiResponse>> signalezInformation(Map<String, dynamic> data);
}

class DisinformationRepositoryImpl extends ApiBase<UserAccount>
    implements DisinformationRepository {
  @override
  Future<Either<List<String>, ApiResponse>> getSignalement() async {
    return await makeRequestApi(
      RestApiServices().dio.post(
        'graphql/',
        data: {'query': listSignalementsQuery},
      ),
    );
  }

  @override
  Future<Either<List<String>, ApiResponse>> signalezInformation(Map<String, dynamic> data) async {
    return await makeRequestApi(
      RestApiServices().dio.post(
        'graphql/',
        data: {'query': signalerFakeNews, 'variables': {"data": data}},
      ),
    );
  }
}
