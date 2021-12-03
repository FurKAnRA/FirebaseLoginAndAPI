//
//  ViewController.swift
//  FirebaseLoginAndAPI
//
//  Created by Furkan Kara on 3.12.2021.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var eMailTextView: UITextField!
    @IBOutlet weak var passwordTextView: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if FirebaseAuth.Auth.auth().currentUser != nil {
            print("oldu")
            let VC = LogoutViewController()
            
            self.navigationController?.pushViewController(VC, animated: true)
            
        }
    }

    @IBAction func loginButton(_ sender: Any) {
        
        guard let email = eMailTextView.text, !email.isEmpty,
                let password = passwordTextView.text , !password.isEmpty else {
                    print("No data ")
                    return
                }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: {[weak self] result , error in
            
            guard let strongSelf = self else {
                return
            }
            guard error == nil else{
                strongSelf.createAccount(email: email, password: password)
                
                return
            }
            
            
            
            
        })
    }
    
    func createAccount(email : String , password : String){
        let alert = UIAlertController(title: "Create account ", message: "Would you like to create an account?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { _ in
            
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {[weak self] result , error in
              
                guard let strongSelf = self else {
                    return
                }
                guard error == nil else{
                    print("Created User")
                    
                    return
                }
                
            })
            
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }
    
}

