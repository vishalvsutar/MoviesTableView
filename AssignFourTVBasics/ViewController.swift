//
//  ViewController.swift
//  AssignFourTVBasics
//
//  Created by Vishal Sutar on 2022-12-04.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var butAdd: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textInput: UITextField!
    
    //var movies = Movies();
    
    
                var moviesArr:[String] = ["Eternals","Dune","No Time To Die","Last Night in Soho","Ron’s Done Wrong","Halloween Kills","Venom","Antlers","The Addams Family 2"]
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func onClickAddBtn(_ sender: Any) {
        if let txt = textInput.text, !txt.isEmpty{
            self.moviesArr.insert(txt, at: 0)
            tableView.beginUpdates()
            tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .right)
            tableView.endUpdates()
            textInput.text = nil
        }
    }
    @IBAction func onClickDelBtn(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tableView)
        guard let indexpath = tableView.indexPathForRow(at: point)
        else{return}
        moviesArr.remove(at: indexpath.row)
        tableView.beginUpdates()
        tableView.deleteRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .left)
        tableView.indexPathForRow(at: point)
        tableView.endUpdates()
    }
    
    @IBAction func onClickMovBtn(_ sender: Any) {
        if tableView.isEditing{
            tableView.isEditing = false
        }
        else{
            tableView.isEditing = true
        }
            
    }
    
//        let point = sender.convert(CGPoint.zero, to: tableView)
//        guard let indexpath = tableView.indexPathForRow(at: point)
//        else{return}
//        let itemToMove = moviesArr[indexpath]
//        moviesArr.remove(at: indexpath.row)
//
 //   }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EditTableViewCell", for: indexPath) as?
                EditTableViewCell else{return UITableViewCell()}
        cell.lblName.text = moviesArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, moveRowAt EditTableViewCell: IndexPath, to destinationIndexPath: IndexPath) {
        
        let itemToMove = moviesArr[EditTableViewCell.row]
        moviesArr.remove(at: EditTableViewCell.row)
        moviesArr.insert(itemToMove, at: destinationIndexPath.row)
    }
    

    
}

//extension ViewController : UITableViewDelegate, UITableViewDataSource
//{
//
//}
