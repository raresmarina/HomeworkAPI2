import Foundation

protocol CommentDetailsViewModelDelegate: AnyObject {
    func commentsIsLoading()
    func commentsDidLoad(comments: [Comment])
    func commentsDidFail(error: Error)
}

class CommentDetailsViewModel {
    
    private let commentService = CommentService.shared
    
    weak var delegate: CommentDetailsViewModelDelegate?

    func loadComments(forPostId postId: Int) {
        delegate?.commentsIsLoading()
        commentService.loadComments(postId: postId) { [weak self] comments, error in
            guard let self else { return }
            if let error {
                self.delegate?.commentsDidFail(error: error)
            } else if let comments {
                self.delegate?.commentsDidLoad(comments: comments)
            }
        }
    }
}

