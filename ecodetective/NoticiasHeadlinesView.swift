//
//  NoticiasHeadlinesView.swift
//  ecodetective
//
//  Created by Alberto Palomeque on 07/03/24.
//

import SwiftUI

public struct NoticiasHeadlinesView: View {

  @StateObject private var viewModel = NoticiasHeadlinesViewModel()
  @State private var errorMessage: String? = nil

  public init() {}

  public var body: some View {
    NavigationView {
      if let errorMessage = errorMessage {
        Text(errorMessage)
          .fontWeight(.bold)
      } else {
        List(viewModel.articles) { article in
          NavigationLink(
            destination: {
              if let url = article.url {
                SFSafariViewWrapper(url: url)
              }
            },
            label: { NoticiasArticleView(article: article) }
          )
            .listRowSeparator(.hidden)
        }
        .task {
          getArticles()
        }
        .listStyle(.plain)
        .navigationTitle("Headlines")
      }
    }
    .refreshable {
      getArticles()
    }
  }

  private func getArticles() {
    errorMessage = nil
    do {
      try viewModel.getArticles()
    } catch {
      errorMessage = error.localizedDescription
    }
  }
}

#Preview {
    NoticiasHeadlinesView()
}
