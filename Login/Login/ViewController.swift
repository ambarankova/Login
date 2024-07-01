//
//  ViewController.swift
//  Login
//
//  Created by Анастасия Ахановская on 01.07.2024.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailBarView: UIView!
    @IBOutlet weak var passwordBarView: UIView!
    @IBOutlet weak var newUserLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureButton(loginButton)
    }

    // MARK: - Methods
    
    private func configureButton(_ button: UIButton) {
        button.layer.shadowColor = button.backgroundColor?.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowOpacity = 0.5
    }
    
    
    // MARK: - IBActions
    
    @IBAction func loginButtonAction(_ sender: Any) {
        print("Login Button is working")
    }
    @IBAction func signUpButtonAction(_ sender: Any) {
        print("SignUp Button is working")
    }
    
}

