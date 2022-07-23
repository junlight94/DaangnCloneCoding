//
//  MyTownViewController.swift
//  DaangnCloneCoding
//
//  Created by Junyoung Lee on 2022/07/12.
//

import UIKit
import RealmSwift

class MyTownViewController: UIViewController, PopupButtonDelegate, TextSearchDelegate {
    func buttonPressed(popupId: Int?, isOk: Bool) {
        if isOk {
            self.dismiss(animated: false){
                print("okButtonClick")
                let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = mainStoryboard.instantiateViewController(withIdentifier: "joinView")
                self.navigationController?.pushViewController(vc, animated: true)
            }
            let realmData = MyTownDB()
            realmData.id = MyTownDB().incrementID()
            realmData.myTownArr.append(myTown)
            try? realm.write {
                realm.add(realmData)
            }
        } else {
            self.dismiss(animated: false)
        }
    }
    
    func textFieldChange(textFieldId: Int, text: String) {
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

    @IBOutlet weak var btnMytown: Button_General!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var noDataView: UIView!
    @IBOutlet var outView: UIView!
    @IBOutlet weak var textField: TextField_Search!
    
    //DummyData
    var viewData = [String]()
    let myTownData = ["방화동", "신림동", "중산동", "방배동", "양재동"]
    
    var myTown = ""
    
    let realm = try! Realm(configuration: DataManager.shared.realmConfiguration())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - General function
    func setupView() {
        textField.searchDelegate = self
        btnMytown.btnMainColor = UIColor(named: "MainColor") 
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "MyTownTableViewCell", bundle: nil), forCellReuseIdentifier: "MyTownTableViewCell")
        
        let outTap = UITapGestureRecognizer(target: self, action: #selector(keyDown))
        outTap.cancelsTouchesInView = false
        outView.addGestureRecognizer(outTap)
    }
    

    // MARK: - IBAction function
    @IBAction func backPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    

    // MARK: - Selector function
    @objc func btnOnClick(_ sender: UIButton) {
        print(viewData[sender.tag])
        myTown = viewData[sender.tag]
        let vc = PopupViewController(nibName: "PopupViewController", bundle: nil)
        vc.modalPresentationStyle = .overCurrentContext
        vc.isOneButton = false
        vc.delegate = self
        vc.textContent = "선택한 동네가 \(viewData[sender.tag])이 맞습니까?"
        self.present(vc, animated: false)
    }
    
    @objc func keyDown(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
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
