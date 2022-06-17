//
//  ReadingView.swift
//  SimpleNews
//
//  Created by Jacek on 17/06/2022.
//

import SwiftUI




struct ReadingView: View {
    @Environment(\.openURL) var openURL
    let article: Article
    var body: some View {
        ScrollView {
            AsyncImage(url: article.image) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                default:
                    Image(systemName: "newspaper")
                }
            }

            VStack(alignment: .leading, spacing: 20) {
                Text(article.title)
                    .font(.title)

                Text(article.description)
                    .font(.headline)
                    .foregroundColor(.secondary)

                Divider()

                VStack(alignment: .leading) {
                    Text(article.author)
                        .font(.headline.weight(.heavy))

                    Text(article.date.formatted(date: .abbreviated, time: .standard))
                        .font(.headline)
                }

                Text(article.text)
            }
            .padding(.horizontal)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(article.section)
        .toolbar{
            Button{
                openURL(article.url)
                
            } label:{
                Label("Open in browser", systemImage: "safari")
            }
        }
       
    }
}

struct ReadingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
                 ReadingView(article: .example)
             }
    }
}
