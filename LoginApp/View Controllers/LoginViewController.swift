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
        
    private let user = User.getUser()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTF.text = user.login
        passwordTF.text = user.password
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard loginTF.text == user.login, passwordTF.text == user.password else {
            showAlert(
                withTitle: "Что-то пошло не так",
                message: "Неверный логин или пароль",
                buttonTitle: "Исправить",
                andButtonActions: .deletePassword
            )
            return false
        }
        return true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as? UITabBarController
        tabBarController?.viewControllers?.forEach { viewController in
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                let personVC = navigationVC.topViewController as? PersonViewController
                personVC?.title = "\(user.person.name) \(user.person.surname)"
                personVC?.person = user.person
            }
        }
    }

    @IBAction private func forgotLoginButtonTapped() {
        showAlert(
            withTitle: "Забыли логин?",
            message: "Ваш логин: \(user.login)",
            buttonTitle: "Понятно",
            andButtonActions: .insertLogin
        )
    }
    @IBAction private func forgotPasswordButtonTapped() {
        showAlert(
            withTitle: "Забыли пароль?",
            message: "Ваш пароль: \(user.password)",
            buttonTitle: "Понятно",
            andButtonActions: .insertPassword
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
                    case .deletePassword: self.passwordTF.text = ""
                    case .insertLogin: self.loginTF.text = self.user.login
                    case .insertPassword: self.passwordTF.text = self.user.password
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
        case deletePassword
        case insertLogin
        case insertPassword
        case none
    }
}
