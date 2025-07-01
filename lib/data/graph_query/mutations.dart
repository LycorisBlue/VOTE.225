const String signalerFakeNews = """
mutation CreateFakeNews(\$data: FakeNewInput!) {
  createFakeNew(data: \$data) {
    documentId
  }
}
""";
