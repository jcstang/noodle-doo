//
//  DetailViewController.swift
//  noodle-doo
//
//  Created by Jake Stanger on 7/19/19.
//  Copyright © 2019 Jake Stanger. All rights reserved.
//

import UIKit

//TODO: add protocol and delegate
protocol CanReceiveData {
    func dataReceived(data: String)
}

class DetailViewController: UIViewController {
    
    var delegate: CanReceiveData?
    var data = " "
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if false {
            delegate?.dataReceived(data: "detail")
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
