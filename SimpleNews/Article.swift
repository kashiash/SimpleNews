//
//  Article.swift
//  SimpleNews
//
//  Created by Jacek on 15/06/2022.
//

import Foundation
struct Article :Decodable,Identifiable,Comparable {
    let id:String
    var section: String
    var title: String
    var description: String
    var author:String
    var text: String
    var thumbnail: URL
    var image:URL
    var date: Date
    var url: URL
    static func <(lhs: Article,rhs: Article) ->Bool{
        lhs.date > rhs.date
    }
    static let example = Article(id: "1", section: "News",title: "Jacuś at action", description: "Jacuś zaczął pisać w swift", author: "Jacuś", text: "Trele morele"
                                 , thumbnail: URL(string: "https://hws.dev/img/logo.png")!
                                 , image: URL(string: "https://hws.dev/img/logo.png")!, date: .now, url: URL(string: "https://www.hackingwithswift.com")!)

  
}
