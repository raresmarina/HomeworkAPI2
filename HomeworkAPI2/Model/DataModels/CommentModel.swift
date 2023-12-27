//
//  CommentModel.swift
//  curs14dec_URLSchemes
//
//  Created by Rares Marina on 12/27/23.
//

import Foundation

struct Comment: Decodable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}

