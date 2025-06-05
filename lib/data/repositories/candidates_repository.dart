import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import '/data/models/candidate.dart';
import '/data/models/graphql_candidate.dart';
import '/services/networks/graphql/graphql_service.dart';
import '/services/networks/apis/api_base.dart';
import '/services/networks/apis/rest_api_reponse.dart';
import '/services/networks/errors/dio_exception.dart';
import 'package:dio/dio.dart' as dio_lib;

abstract class CandidatesRepository {
  Future<Either<List<String>, List<Candidate>>> getCandidates();
}

class CandidatesRepositoryImpl extends ApiBase<Candidate> implements CandidatesRepository {
  final GraphQLService _graphQLService;

  CandidatesRepositoryImpl(this._graphQLService);

  @override
  Future<Either<List<String>, List<Candidate>>> getCandidates() async {
    try {
      if (kDebugMode) {
        print('Fetching candidates from GraphQL...');
      }

      // Exécuter la requête GraphQL
      final dio_lib.Response response = await _graphQLService.getCandidates();

      if (kDebugMode) {
        print('GraphQL Response Status: ${response.statusCode}');
        print('GraphQL Response Data: ${response.data}');
      }

      // Vérifier si la réponse contient des données
      if (response.data == null || response.data['data'] == null) {
        return left(['Aucune donnée reçue du serveur', '${response.statusCode}']);
      }

      // Parser la réponse GraphQL
      final graphqlResponse = GraphQLCandidatesResponse.fromMap(response.data['data']);

      if (graphqlResponse.nodes == null || graphqlResponse.nodes!.isEmpty) {
        if (kDebugMode) {
          print('No candidates found in GraphQL response');
        }
        return right([]); // Retourner une liste vide au lieu d'une erreur
      }

      // Convertir les candidats GraphQL vers le modèle Candidate
      final List<Candidate> candidates =
          graphqlResponse.nodes!.asMap().entries.map((entry) => Candidate.fromGraphQL(entry.value, index: entry.key)).toList();

      if (kDebugMode) {
        print('Successfully converted ${candidates.length} candidates');
      }

      return right(candidates);
    } on dio_lib.DioException catch (e) {
      if (kDebugMode) {
        print('Dio Exception in getCandidates: ${e.message}');
        print('Response data: ${e.response?.data}');
      }

      final errorMessage = DioExceptions.fromDioError(e).message;
      final statusCode = e.response?.statusCode?.toString() ?? '0';

      return left([errorMessage, statusCode]);
    } catch (e) {
      if (kDebugMode) {
        print('Unexpected error in getCandidates: $e');
      }

      return left(['Erreur inattendue lors du chargement des candidats', '500']);
    }
  }

  /// Méthode pour récupérer un candidat spécifique par ID (pour usage futur)
  Future<Either<List<String>, Candidate?>> getCandidateById(String id) async {
    try {
      // Pour l'instant, on récupère tous les candidats et on filtre
      final result = await getCandidates();

      return result.fold(
        (error) => left(error),
        (candidates) {
          try {
            final candidate = candidates.firstWhere((c) => c.id == id);
            return right(candidate);
          } catch (e) {
            return right(null);
          }
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error getting candidate by ID: $e');
      }
      return left(['Candidat non trouvé', '404']);
    }
  }

  /// Méthode pour rafraîchir le cache (pour usage futur)
  Future<Either<List<String>, List<Candidate>>> refreshCandidates() async {
    // Pour l'instant, c'est identique à getCandidates
    // Plus tard, on pourrait ajouter une logique de cache ici
    return await getCandidates();
  }
}
