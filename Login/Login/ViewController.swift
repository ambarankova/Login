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
    @IBOutlet weak var lockImage: UIImageView!
    @IBOutlet weak var envelopeImage: UIImageView!
    
    // MARK: - Propertis
    
    private let activeColor = UIColor(named: "Active")
    private let avocadoColor = UIColor(named: "AvocadoGreen")
    private var email: String = "" {
        didSet {
            activeLoginButton()
        }
    }
    private var password: String = "" {
        didSet {
            activeLoginButton()
        }
    }
    
    private let mockPassword = "123456"
    private let mockEmail = "abc@gmail.com"
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureButton(loginButton)
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.becomeFirstResponder()
    }

    // MARK: - Methods
    
    private func configureButton(_ button: UIButton) {
        button.layer.shadowColor = avocadoColor?.cgColor ?? UIColor.systemGray5.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 6)
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 6
        
        loginButton.isUserInteractionEnabled = false
        loginButton.backgroundColor = .systemGray5
    }
    
    private func activeLoginButton() {
        loginButton.isUserInteractionEnabled = !(email.isEmpty || password.isEmpty)
        loginButton.backgroundColor = !(email.isEmpty || password.isEmpty) ? avocadoColor : .systemGray5
        loginButton.layer.backgroundColor = !(email.isEmpty || password.isEmpty) ? avocadoColor?.cgColor : UIColor.systemGray5.cgColor
    }
    
    
    // MARK: - IBActions
    
    @IBAction func loginButtonAction(_ sender: Any) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        if email.isEmpty {
            makeErrorField(textField: emailTextField)
        }
        
        if password.isEmpty {
            makeErrorField(textField: passwordTextField)
        }
        
        if email == mockEmail, password == mockPassword {
            performSegue(withIdentifier: "goToHomePage", sender: sender)
        } else {
            let alert = UIAlertController(title: "Error".localized, message: "Wrong password or e-mail".localized, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK".localized, style: .default)
            alert.addAction(action)
            
            present(alert, animated: true)
        }
        
        print("Login Button is working")
    }
    
    @IBAction func signUpButtonAction(_ sender: Any) {
        print("SignUp Button is working")
    }
}

// MARK: - Extensions

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !text.isEmpty else {return}
        
        switch textField {
        case emailTextField:
            let isValidEmail = check(email: text)
            
            if isValidEmail {
                email = text
                envelopeImage.tintColor = .systemGray5
                emailBarView.backgroundColor = .systemGray5
            } else {
                email = ""
                makeErrorField(textField: textField)
            }
            
        case passwordTextField:
            let isValidPassword = check(password: text)
            
            if isValidPassword {
                password = text
                lockImage.tintColor = .systemGray5
                passwordBarView.backgroundColor = .systemGray5
            } else {
                password = ""
                makeErrorField(textField: textField)
            }
            
        default: print("unknown text field")
        }
    }
    
    private func check(email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
    
    private func check(password: String) -> Bool {
        return password.count >= 4
    }
    
    private func makeErrorField(textField: UITextField) {
        switch textField {
        case emailTextField:
            envelopeImage.tintColor = activeColor
            emailBarView.backgroundColor = activeColor
        case passwordTextField:
            lockImage.tintColor = activeColor
            passwordBarView.backgroundColor = activeColor
        default: print("error")
        }
    }
}
