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

const String listCalendarQuery = r'''
  query {
    events_connection (
      filters:  {
        date_debut: {
          gte: "2025-06-01",
          lte: "2025-06-30"
        }
      }
    ) {
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

const String listSignalementsQuery = r'''
  query FakeNewsConnection {
    fakeNews_connection {
      nodes {
        titre
        source_description
        source_images {
          url
        }
        source_videos {
          url
        }
        source_nom_alerteur
        check_status
        check_images {
          url
        }
        check_videos {
          url
        }
      }
    }
  }
''';

const String listBureauVoteQuery = r'''
  query  {
    votingStations_connection {
      nodes {
        titre
        horaire
        adresse
        latitude
        longitude
        election {
          titre
        }
      }
    }
  }
''';

const String listProjetsSocieteQuery = r'''
  query  {
    candidates_connection {
      nodes {
        documentId
        display_name
        age
        city
        work_title
        work_experience
        biographie
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
        programme_pdf {
          url
        }
        programme_par_section {
          programme
          thematique_projet_de_societe {
            titre
            image {
              url
            }
          }
        }
      }
    }
  }
''';

const String comparerProjetQuery = r'''
  query  {
     societyProjectSubjects_connection {
      nodes {
        titre
        image {
          url
        }
      }
    }
  }
''';

const String resultatsComparaisonsQuery = r'''
  query  {
    candidates_connection {
      nodes {
        documentId
        display_name
        programme_par_section {
          thematique_projet_de_societe {
            titre
            image {
              url
            }
          }
          programme
        }
      }
    }
  }
''';
