//
//  ViewController.swift
//  instaCloneFirebase
//
//  Created by ozan aydogdu on 19.04.2021.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var emailText: UITextField!
    
    
    @IBOutlet weak var passwordText: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
   
   
    
    
    }



    @IBAction func singInClicked(_ sender: Any) {
        if emailText.text != ""{
            
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { authdata, error in
                if error != nil{
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "ERROR")
                    
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        }else{
            makeAlert(titleInput: "Error!", messageInput: "Username/Password")
        }
        
        
        
        
    }
    

    @IBAction func singUpClicked(_ sender: Any) {
        
        if emailText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { authdata, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "ERROR")
                    
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        }else {
            makeAlert(titleInput: "Error!", messageInput: "Username/Password")
            
        }

     
    }
    func makeAlert(titleInput : String, messageInput:String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)

        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

