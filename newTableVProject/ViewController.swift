//
//  ViewController.swift
//  newTableVProject
//
//  Created by alim on 10.02.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tfMetin: UITextField!
    
    @IBOutlet weak var tvListe: UITableView!
    var Liste = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnEkle(_ sender: Any) {
        if tfMetin.text!.isEmpty == true{
            let alertcontroller = UIAlertController(title: "Uyarı", message: "Boş bırakamazsınız lütfen bir değer giriniz", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "tamam", style: .default)
            alertcontroller.addAction(alertAction)
            present(alertcontroller, animated: true)
        }else {
            Liste.append(tfMetin.text!)
            tvListe.reloadData()
            
           }
       
    }
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Liste.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = Liste[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            Liste.remove(at: indexPath.row)
            tvListe.reloadData()
        }
    }
    
}
    
    
    
    

