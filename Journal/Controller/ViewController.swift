//
//  ViewController.swift
//  Journal
//
//  Created by Zachary Buffington on 9/9/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = entry?.title
        contentsTextView.text = entry?.contents
    }

    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let title = titleTextField.text,
              let contents = contentsTextView.text,
              !title.isEmpty,
              !contents.isEmpty else { return }
        
        // if there is an entry, i want to create a new one
        if let entry = entry {
            
            EntryManager.shared.update(entry: entry, newTitle: title, newContents: contents)
            // if there is no entry, i want to create a new one
        } else {
            EntryManager.shared.createEntry(title: title, contents: contents)
            
            
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    
}

