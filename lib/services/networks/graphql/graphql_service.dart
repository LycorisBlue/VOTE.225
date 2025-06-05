import 'package:dio/dio.dart' as dio_lib;
import 'package:flutter/foundation.dart';

/// Service GraphQL basé sur Dio pour gérer les requêtes GraphQL
class GraphQLService {
  static final GraphQLService _graphQLService = GraphQLService._internal();

  factory GraphQLService() {
    return _graphQLService;
  }
  GraphQLService._internal();

  // URL de base pour GraphQL
  static const String _baseUrl = 'http://localhost:1337/graphql';

  // Token d'authentification en dur (à remplacer par votre token)
  static const String _authToken =
      '285df2ff274e1ad4bcc798941221ac227a071609ed416435aafe35114a0dbccdb320ecef384e8505cd2d13de6d25cc330ddd478f97981a18a05f14ff1b4f87dadc1be8915e4ed1b0b1edeac0d1ab8daaf69584f7019cf9e91018f5fc9e529d74bf16b6930576dc2938ee41aecfd2a1c9a2ea940266b298a68e7eba3ae1a6bfc7';

  // Instance Dio pour GraphQL
  dio_lib.Dio get dio => _dio();

  dio_lib.Dio _dio() {
    final options = dio_lib.BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(milliseconds: 15000),
      receiveTimeout: const Duration(milliseconds: 15000),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_authToken',
      },
    );

    var dio = dio_lib.Dio(options);

    // Intercepteur pour debug en mode développement
    if (kDebugMode) {
      dio.interceptors.add(
        dio_lib.LogInterceptor(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          logPrint: (obj) {
            debugPrint('GraphQL: $obj');
          },
        ),
      );
    }

    return dio;
  }

  /// Exécuter une requête GraphQL
  Future<dio_lib.Response> query(String query, {Map<String, dynamic>? variables}) async {
    try {
      final response = await dio.post(
        '',
        data: {
          'query': query,
          if (variables != null) 'variables': variables,
        },
      );

      // Vérifier s'il y a des erreurs GraphQL
      if (response.data['errors'] != null) {
        throw dio_lib.DioException(
          requestOptions: dio_lib.RequestOptions(path: _baseUrl),
          response: response,
          type: dio_lib.DioExceptionType.badResponse,
          error: 'GraphQL Errors: ${response.data['errors']}',
        );
      }

      return response;
    } on dio_lib.DioException catch (e) {
      if (kDebugMode) {
        print('GraphQL Error: ${e.message}');
        print('Response: ${e.response?.data}');
      }
      rethrow;
    } catch (e) {
      if (kDebugMode) {
        print('Unexpected GraphQL Error: $e');
      }
      throw dio_lib.DioException(
        requestOptions: dio_lib.RequestOptions(path: _baseUrl),
        type: dio_lib.DioExceptionType.unknown,
        error: e.toString(),
      );
    }
  }

  /// Requête spécifique pour récupérer les candidats
  Future<dio_lib.Response> getCandidates() async {
    const String candidatesQuery = '''
      query {
        candidates_connection {
          nodes {
            display_name
            age
            city
            work_title
            work_experience
            createdAt
            updatedAt
            election {
              year
            }
            plan_key_points {
              value
            }
            political_parties {
              name
            }
            political_visions {
              title
            }
            cover {
              url
            }
          }
        }
      }
    ''';

    return await query(candidatesQuery);
  }

  /// Fermer la connexion
  void dispose() {
    dio.close();
  }
}
