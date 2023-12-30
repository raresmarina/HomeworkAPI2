import Foundation

class CommentService {
    
    private let commentAPI = CommentAPI()
    
    static let shared = CommentService()
    
    private init() {}
    
    func loadComments (
        postId: Int,
        completionHandler: @escaping ([Comment]?, Error?) -> Void
    ){
        commentAPI.loadComments(postId: postId, completionHandler: completionHandler)
    }
    
}
