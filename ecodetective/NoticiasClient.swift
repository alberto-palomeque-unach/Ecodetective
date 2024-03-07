//
//  NoticiasClient.swift
//  ecodetective
//
//  Created by Alberto Palomeque on 07/03/24.
//

@_exported import NewsAPI

private let API_KEY = "b0af09a1dd004a84ae182606007655bb"

public class NewsClient {

  private let client: NewsAPI

  public init(apiKey: String) {
    client = NewsAPI(apiKey: apiKey)
  }

  public func getTopHeadlines(query: String? = nil, language: Language) async throws -> [NewsArticle] {
    try await client.getTopHeadlines(sources: [], query: query, category: nil, language: language)
  }

  public func search(query: String) async throws -> [NewsArticle] {
      try await client.search(query: query)
  }

  public func getSources() async throws -> [NewsSource] {
    try await client.getSources()
  }
}

public extension NewsClient {
  static let live = NewsClient(apiKey: API_KEY)
}
