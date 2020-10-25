//
//  ViewController.swift
//  Local Search App
//
//  Created by Keisuke Horiguchi on 2020/10/25.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var searchTxt: UITextField!
    @IBOutlet weak var resultTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        resultTableView.delegate = self
        resultTableView.dataSource = self
        resultTableView.register(UINib(nibName: identifiers.resultTableViewCell, bundle: nil), forCellReuseIdentifier: identifiers.resultTableViewCell)
    }
    
    @IBAction func searchClicked(_ sender: Any) {
    }
    
}

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = resultTableView.dequeueReusableCell(withIdentifier: identifiers.resultTableViewCell, for: indexPath) as? ResultTableViewCell {
        cell.configureCell()
        return cell
        }
        return UITableViewCell()
    }
    
    
}
