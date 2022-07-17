//
//  MyTownViewController.swift
//  DaangnCloneCoding
//
//  Created by Junyoung Lee on 2022/07/12.
//

import UIKit

class MyTownViewController: UIViewController, TextSearchDelegate, UITextFieldDelegate {
    func textFieldChange(text: String) {
        if text.count > 0 {
            print(myTownData.filter({$0.contains(text)}))
            viewData = myTownData.filter({$0.contains(text)})
            if viewData.count > 0 {
                noDataView.isHidden = true
            } else {
                noDataView.isHidden = false
            }
        } else {
            noDataView.isHidden = false
        }
        tableView.reloadData()
    }
    

    @IBOutlet var tableView: UITableView!
    @IBOutlet var noDataView: UIView!
    @IBOutlet var textField: TextField_Search!
    
    //DummyData
    var viewData = [String]()
    let myTownData = ["방화동", "신림동", "중산동", "방배동", "양재동"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - General function
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        textField.searchDelegate = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "MyTownTableViewCell", bundle: nil), forCellReuseIdentifier: "MyTownTableViewCell")
    }
    

    // MARK: - IBAction function
    @IBAction func backPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    

    // MARK: - Selector function
    @objc func btnOnClick(_ sender: UIButton) {
        print(viewData[sender.tag])
        
    }
    
}
// MARK: - Extension
extension MyTownViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTownTableViewCell", for: indexPath) as! MyTownTableViewCell
        let totalRows = tableView.numberOfRows(inSection: indexPath.section)
        
        cell.lbName.text = viewData[indexPath.row]
        cell.btnClick.tag = indexPath.row
        cell.btnClick.addTarget(self, action: #selector(btnOnClick), for: .touchUpInside)
        if indexPath.row == totalRows - 1 {
            cell.lineView.isHidden = true
        } else {
            cell.lineView.isHidden = false
        }
        return cell
        
    }
    
    
}
