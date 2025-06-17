const String eventsQuery = r'''
  query {
    events_connection {
      nodes {
        documentId
        titre
        description
        date_debut
        date_fin
        categorie_evenement {
          titre
        }
        images {
          previewUrl
          url
        }
        videos {
          previewUrl
          url
        }
        election {
          titre
          year
        }
      }
    }
  }
''';

const String eventDetailQuery = r'''
  query GetEvent($documentId: ID!) {
    event(documentId: $documentId) {
      titre
      description
      date_debut
      date_fin
      categorie_evenement {
        titre
      }
      images {
        previewUrl
        url
      }
      videos {
        previewUrl
        url
      }
      election {
        titre
        year
      }
    }
  }
''';

const String candidatesQuery = '''
      query {
        candidates_connection {
          nodes {
            documentId
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

const String candidateDetailQuery = r'''
  query GetCandidate($documentId: ID!) {
    candidate(documentId: $documentId) {
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
''';