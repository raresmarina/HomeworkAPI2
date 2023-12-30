import Foundation
import UIKit

class PostDetailsController: UIViewController {
    
    @IBOutlet private weak var postInfoLabel: UILabel!
    
    private let viewModel = PostDetailsViewModel()
    var postId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postInfoLabel.text = nil
        postInfoLabel.numberOfLines = 0
        viewModel.delegate = self
        if let postId {
            viewModel.loadPost(postId: postId)
        }
    }
}

extension PostDetailsController: PostDetailsViewModelDelegate {
    func postIsLoading() {
        postInfoLabel.text = "Post is loading"
    }
    
    func postDidLoad(post: Post) {
        postInfoLabel.text = post.title + "\n" + post.body
    }
    
    func postDidFail(error: Error) {
        postInfoLabel.text = "Post has error!"
    }
}
