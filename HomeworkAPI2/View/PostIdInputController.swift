//
//  PostIdInputController.swift
//  curs14dec_URLSchemes
//
//  Created by Orlando Neacsu on 14.12.2023.
//

import UIKit

final class PostIdInputController: UIViewController {
    
    @IBOutlet private weak var postIdTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postIdTextfield.keyboardType = .numberPad
    }
    
    private func showPostWithComments(id: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: "PostWithCommentsController") as! PostWithCommentsController
        controller.postId = id
        present(controller, animated: true)
    }
    
    private func showPost(id: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: "PostDetailsController") as! PostDetailsController
        controller.postId = id
        present(controller, animated: true)
    }
    
    @IBAction func onShowPostWithoutCommentsPressed(_ sender: Any) {
        if let id = Int(postIdTextfield.text!) {
            showPost(id: id)
        } else {
            let alert = UIAlertController(title: "Error", message: "ID Invalid", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Ok", style: .cancel)
            alert.addAction(cancel)
            present(alert, animated: true)
        }
    }
    
    @IBAction private func onShowPostPressed(_ sender: Any) {
        if let id = Int(postIdTextfield.text!) {
            showPostWithComments(id: id)
        } else {
            let alert = UIAlertController(title: "Error", message: "ID Invalid", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Ok", style: .cancel)
            alert.addAction(cancel)
            present(alert, animated: true)
        }
    }
    
    
}
