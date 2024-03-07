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
        VStack {
            HStack {
                Text(article.source.name)
                    .fontWeight(.light)
                Spacer()
            }
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
                            Text("Imagen no encontrada")
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
}

#Preview {
    NoticiasArticleView(article: NewsArticle.demo)
}
