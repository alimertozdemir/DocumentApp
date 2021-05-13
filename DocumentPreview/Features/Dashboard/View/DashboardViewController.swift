//
//  DashboardViewController.swift
//  DocumentPreview
//
//  Created by Ali Mert on 9.05.2021.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var documentsTableView: UITableView! {
        willSet {
            newValue.register(UITableViewCell.self, forCellReuseIdentifier: "DocumentCell")
            newValue.tableFooterView = UIView()
        }
    }
    
    private var docs: [Document]?
    private var viewModel = DashboardViewModel()
    
    var nameSurnameText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        observeViewModel()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.getDocs(nameSurname: nameSurnameText)
        
    }
        
    private func observeViewModel() {
        
        viewModel.documentList.observe { [weak self] state in
            switch state {
            case .loading:
                self?.displayAnimatedActivityIndicatorView()
            case .loaded(let docs):
                self?.hideAnimatedActivityIndicatorView()
                
                self?.docs = docs
                
                if let documents = docs {
                    for document in documents {
                        print("DocName: \(document.title)")
                        print("DocType: \(document.extension)")
                    }
                }
                
                self?.documentsTableView.reloadData()
               
            case .failed(_):
                self?.hideAnimatedActivityIndicatorView()
            }
        }
        
    }
    
    private func showDocumentDetail(document: Document) {
        let title = document.title + "." + document.extension
        let message = "Document Size: \(document.size) MB \nDocument Url: \(document.url)"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
        
    }

}

extension DashboardViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return docs?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let docs = docs else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "DocumentCell", for: indexPath)
        cell.textLabel?.text = docs[indexPath.row].title + "." + docs[indexPath.row].extension
        return cell
    }
    
    
}

extension DashboardViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showDocumentDetail(document: docs![indexPath.item])
    }
}
