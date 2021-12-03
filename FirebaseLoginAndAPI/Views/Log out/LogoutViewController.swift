//
//  LogoutViewController.swift
//  FirebaseLoginAndAPI
//
//  Created by Furkan Kara on 3.12.2021.
//

import UIKit
import FirebaseAuth
class LogoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view.
    }


    @IBAction func logout(_ sender: Any) {
        do{
            try FirebaseAuth.Auth.auth().signOut()
                let vc = ViewController()
            self.navigationController?.popToRootViewController(animated: true)
        }catch{
            
            print("Çıkış yapılamadı")
        }
    }
 

}
