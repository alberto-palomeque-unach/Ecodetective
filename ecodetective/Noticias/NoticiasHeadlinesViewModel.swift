//
//  NoticiasHeadlinesViewModel.swift
//  ecodetective
//
//  Created by Alberto Palomeque on 07/03/24.
//

import SwiftUI

@MainActor
final class NoticiasHeadlinesViewModel: ObservableObject {

  @Published private(set) var articles: [NewsArticle] = []

  func getArticles() throws {
    Task.init(priority: .default) {
        //articles = try await NewsClient.live.getTopHeadlines(query: "", language: .es)
        articles = try await NewsClient.live.search(
            query: "alimentos orgánicos"
        )
    }
  }
}
