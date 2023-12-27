import UIKit

class PostWithCommentsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let postViewModel = PostDetailsViewModel()
    private let commentViewModel = CommentDetailsViewModel()
    
    var postId: Int?
    private var post: Post?
    private var comments: [Comment] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        if let postId = postId {
            postViewModel.delegate = self
            postViewModel.loadPost(postId: postId)
        }
        
        if let postId = postId {
            commentViewModel.delegate = self
            commentViewModel.loadComments(forPostId: postId)
        }
    }
}

extension PostWithCommentsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Returnează numărul total de rânduri, inclusiv postarea și comentariile
        return 1 + comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",  for: indexPath)
        
        if indexPath.row == 0 {
            cell.backgroundColor = .lightGray
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = "\(post?.title ?? "")\n\(post?.body ?? "")"
        } else {
            cell.backgroundColor = .white
            cell.textLabel?.numberOfLines = 0
            let comment = comments[indexPath.row - 1]  // -1 pentru a exclude rândul postării
            cell.textLabel?.text = "\(comment.id)\n\(comment.name)\n\(comment.email)\n\(comment.body)"
        }
        
        return cell
    }
}

extension PostWithCommentsController: PostDetailsViewModelDelegate {
    func postIsLoading() {}
    
    func postDidLoad(post: Post) {
        self.post = post
        tableView.reloadData()
    }
    
    func postDidFail(error: Error) {}
}

extension PostWithCommentsController: CommentDetailsViewModelDelegate {
    func commentsIsLoading() {}
    
    func commentsDidLoad(comments: [Comment]) {
        self.comments = comments
        tableView.reloadData()
    }
    
    func commentsDidFail(error: Error) {}
}
