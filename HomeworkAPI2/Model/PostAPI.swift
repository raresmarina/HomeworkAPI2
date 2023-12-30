import Foundation

class PostAPI {

    func loadPost(
        postId: Int,
        completionHandler: @escaping (Post?, Error?) -> Void
    ) {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(String(postId))")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let request = URLSession.shared.dataTask(
            with: urlRequest) { [weak self] data, response, error in
                guard let self else {return} // self nu este folosit, deci am putea sa omitem capture list-ul in acest caz
                if let error {
                    DispatchQueue.main.async {
                        completionHandler(nil, error)
                    }
                } else {
                    do {
                        let post = try JSONDecoder().decode(Post.self, from: data!)
                        DispatchQueue.main.async {
                            completionHandler(post, nil)
                        }
                    } catch {
                        DispatchQueue.main.async {
                            completionHandler(nil, error)
                        }
                    }
                }
            }
        request.resume()
    }
    
}
