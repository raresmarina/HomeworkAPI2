//
//  PostService.swift
//  curs14dec_URLSchemes
//
//  Created by Orlando Neacsu on 14.12.2023.
//

import Foundation

class PostService {
    
    private let postAPI = PostAPI()
    
    static let shared = PostService()
    
    private init() {}
    
    func loadPost(
        postId: Int,
        completionHandler: @escaping (Post?, Error?) -> Void
    ) {
        postAPI.loadPost(postId: postId, completionHandler: completionHandler)
    }

    
}
