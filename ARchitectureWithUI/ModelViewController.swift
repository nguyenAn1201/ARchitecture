//
//  ModelViewController.swift
//  ARchitectureWithUI
//
//  Created by Pham Lam on 7/23/18.
//  Copyright © 2018 An Nguyen. All rights reserved.
//

import UIKit

//Pass checked model to View Controller using delegate//
protocol ModelDelegate {
    func onModelSelected(dataArray : Array<Any>)  //Initialize protocol for function//
}
class ModelViewController : UITableViewController {
    var delegate : ModelDelegate!
    var ModelArray = Array<Any>()
    
    @IBAction func sendData(sender: Any){
        self.dismiss(animated: true){
            self.delegate.onModelSelected(dataArray: self.ModelArray)
        }
    }
    
    var models = ["house", "house1", "house2", "house3","house4", "house 5"]
    var checkedModels = [String]()
    var test:Array = [String]()
    
    var modelTestView = ModelViewController()
    
    
    var ViewController:ViewController?
    var buttonHidden = false
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func closePopUp(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    ///List models//
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath : IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        return cell
    }
    
    
    //Check mark//
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark {
             tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        } else{
             tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
             checkedModels.append(models[indexPath.row])
        }
        
    }
    
    
    
  
}
