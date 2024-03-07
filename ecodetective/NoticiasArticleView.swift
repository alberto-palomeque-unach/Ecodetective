//
//  NoticiasArticleView.swift
//  ecodetective
//
//  Created by Alberto Palomeque on 07/03/24.
//

import SwiftUI
import NewsAPI

public struct NoticiasArticleView: View {
  private let article: NewsArticle

  public init(article: NewsArticle) {
    self.article = article
  }

  public var body: some View {
    HStack {
      Text(article.title ?? "")
        .fontWeight(.bold)
      AsyncImage(url: article.urlToImage) { phase in
        switch phase {
        case .empty:
          ProgressView()
        case .success(let image):
          image.resizable()
            .aspectRatio(1.5, contentMode: .fit)
            .frame(maxWidth: 150)
        case .failure:
          VStack {
            Image(systemName: "square.slash")
            Text("Image is not found")
              .fontWeight(.light)
              .foregroundColor(.secondary)
          }
          .frame(width: 150)
        @unknown default:
          EmptyView()
        }
      }
    }
  }
}

#Preview {
    NoticiasArticleView(article: NewsArticle.demo)
}
