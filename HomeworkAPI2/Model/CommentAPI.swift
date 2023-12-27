//
//  CommentAPI.swift
//  curs14dec_URLSchemes
//
//  Created by Rares Marina on 12/27/23.
//

import Foundation

class CommentAPI{
    
    func loadComments(
        postId: Int,
        completionHandler: @escaping ([Comment]?, Error?) -> Void
    ){
        let url = URL(string: "https://jsonplaceholder.typicode.com/comments?postId=\(String(postId))")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let request = URLSession.shared.dataTask(with: urlRequest){
            [weak self] data, response, error in
            guard let self else {return} // self nu este folosit, deci am putea sa omitem capture list-ul si in acest caz
            if let error {
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
            } else {
                do {
                    let comments = try JSONDecoder().decode([Comment].self, from: data!)
                    DispatchQueue.main.async {
                        completionHandler(comments, nil)
                    }
                }
                catch{
                    DispatchQueue.main.async {
                        completionHandler(nil, error)
                    }
                }
            }
        }
        request.resume()
    }
}
