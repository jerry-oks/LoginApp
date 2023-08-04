//
//  ViewController.swift
//  LoginApp
//
//  Created by HOLY NADRUGANTIX on 04.08.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    @IBOutlet private var loginTF: UITextField!
    @IBOutlet private var passwordTF: UITextField!
    
    private let login = "User"
    private let password = String(Int.random(in: 1000...9999))
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mainVC = segue.destination as? MainViewController
        mainVC?.username = loginTF.text ?? ""
    }
    
    @IBAction private func loginButtonTapped() {
        if loginTF.text != login || passwordTF.text != password {
            showAlert(
                withTitle: "Что-то пошло не так",
                message: "Неверный логин или пароль",
                buttonTitle: "Исправить",
                andButtonActions: .deletePassword
            )
        }
    }
    @IBAction private func forgotLoginButtonTapped() {
        showAlert(
            withTitle: "Забыли логин?",
            message: "Ваш логин: \(login)",
            buttonTitle: "Понятно",
            andButtonActions: .none
        )
    }
    @IBAction private func forgotPasswordButtonTapped() {
        showAlert(
            withTitle: "Забыли пароль?",
            message: "Ваш пароль: \(password)",
            buttonTitle: "Понятно",
            andButtonActions: .none
        )
    }
    
    @IBAction private func unwind(for segue: UIStoryboardSegue) {
        loginTF.text = ""
        passwordTF.text = ""
    }
    
    private func showAlert(withTitle title: String, message: String, buttonTitle: String, andButtonActions buttonActions: UIAlertAction.buttonAction...) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let buttonAction = UIAlertAction(title: buttonTitle, style: .cancel) { _ in
            if !buttonActions.contains(.none) {
                buttonActions.forEach { buttonAction in
                    switch buttonAction {
                    case .deleteLogin: self.loginTF.text = ""
                    case .deletePassword: self.passwordTF.text = ""
                    case .insertLogin: self.loginTF.text = self.login
                    case .insertPassword: self.passwordTF.text = self.password
                    default: return
                    }
                }
            }
        }
        
        alert.addAction(buttonAction)
        present(alert, animated: true)
    }
}

// MARK: - Button Actions Enumeration
private extension UIAlertAction {
    enum buttonAction {
        case deleteLogin
        case deletePassword
        case insertLogin
        case insertPassword
        case none
    }
}
