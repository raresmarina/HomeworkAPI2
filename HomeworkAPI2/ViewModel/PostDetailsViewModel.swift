import Foundation

protocol PostDetailsViewModelDelegate: AnyObject {
    func postIsLoading()
    func postDidLoad(post: Post)
    func postDidFail(error: Error)
}


class PostDetailsViewModel {
    
    private let postService = PostService.shared
    
    weak var delegate: PostDetailsViewModelDelegate?
    
    func loadPost(postId: Int) {
        delegate?.postIsLoading()
        postService.loadPost(postId: postId) { [weak self] post, error in
            guard let self else {return}
            if let error {
                self.delegate?.postDidFail(error: error)
            } else if let post {
                self.delegate?.postDidLoad(post: post)
            }
        }
    }
    
}
