//
//  LogInViewController.swift
//  LogIn
//
//  Created by Максим Разумов on 09.11.2020.
//  Copyright © 2020 Максим Разумов. All rights reserved.
//

import Foundation
import UIKit
import EasyPeasy

class LogInViewController: UIViewController {
    
    // MARK: variables
    private var scrollView = UIScrollView()
    private var logoLabel: UILabel = {
        var view = UILabel()
        return view
    }()
    
    private var vectorImage: UIImageView = {
        var view = UIImageView()
        return view
    }()
    
    private var loginLabel: UILabel = {
        var view = UILabel()
        return view
    }()
    
    
    private var mailText: UITextField = {
        var view = UITextField()
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.clipsToBounds = true
        return view
    }()
    
    private var passwordText: UITextField = {
        var view = UITextField()
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.clipsToBounds = true
        return view
    }()
    
    private var loginButton: UIButton = {
        var view = UIButton()
        view.alpha = 0.4
        view.layer.cornerRadius = 26
        view.clipsToBounds = true
        return view
    }()
    
    private var forgotPassLabel: UILabel = {
        var view = UILabel()
        return view
    }()
    
    private var orLabel: UILabel = {
        var view = UILabel()
        return view
    }()
    
    private var appleButton: UIButton = {
        var view = UIButton()
        view.layer.cornerRadius = 26
        view.backgroundColor = .black
        view.clipsToBounds = true
        return view
    }()
    
    private var facebookButton: UIButton = {
        var view = UIButton()
        view.layer.cornerRadius = 26
        view.clipsToBounds = true
        return view
    }()
    
    private var haveAccountLabel: UILabel = {
        var view = UILabel()
        return view
    }()
    
    private var confLabel: UILabel = {
        var view = UILabel()
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .center
        return view
    }()
    
    private var appleImage = UIImageView()
    private var facebookImage = UIImageView()
    private var shapeImage = UIImageView()
    var colorStart = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
    var colorCurrent = UIColor(red: 0.192, green: 0.22, blue: 0.282, alpha: 1)
    var changed: Bool = false
    var showPass: Bool = false
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        applyView()
        mailText.delegate = self
        mailText.placeholder = "Адрес электронной почты"
        mailText.textColor = colorStart
        passwordText.delegate = self
        passwordText.placeholder = "Пароль"
        passwordText.textColor = colorStart
        shapeImage.isUserInteractionEnabled = true
        shapeImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showPassword)))
        loginButton.addTarget(self, action: #selector(loginBut), for: .touchUpInside)
        
    }
    
    // MARK: viewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textFieldDidBeginEditing(mailText)
        textFieldDidBeginEditing(passwordText)
        textFieldDidEndEditing(mailText)
        textFieldDidEndEditing(passwordText)
        let chechText = [mailText, passwordText]
        for check in chechText {
            if changed == false {
                check.addTarget(self, action: #selector(changeEnable), for: .editingChanged)
            }
        }
    }
    
    // MARK: showPassword
    @objc func showPassword() {
        if showPass == false {
            passwordText.isSecureTextEntry = false
        } else {
            passwordText.isSecureTextEntry = true
        }
        showPass = !showPass
    }

    // MARK: isValidEmail
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    // MARK: changeEnable
    @objc func changeEnable() {
        if isValidEmail(email: mailText.text ?? "") && passwordText.text?.count ?? 0 > 7 {
            loginButton.alpha = 1
            loginButton.isEnabled = true
        } else {
            loginButton.alpha = 0.4
            loginButton.isEnabled = false
        }
    }
    
    // MARK: loginBut
    @objc func loginBut() {
        print("aaa")
        let nc = RecoveryViewController()
        nc.modalPresentationStyle = .overFullScreen
        present(nc, animated: true, completion: nil)
    }
    
    // MARK: setupView
    func setupView() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(logoLabel)
        scrollView.addSubview(vectorImage)
        scrollView.addSubview(loginLabel)
        scrollView.addSubview(mailText)
        scrollView.addSubview(passwordText)
        scrollView.addSubview(shapeImage)
        scrollView.addSubview(loginButton)
        scrollView.addSubview(forgotPassLabel)
        scrollView.addSubview(orLabel)
        scrollView.addSubview(appleButton)
        scrollView.addSubview(facebookButton)
        
        appleButton.addSubview(appleImage)
        facebookButton.addSubview(facebookImage)
        scrollView.addSubview(haveAccountLabel)
        
        scrollView.addSubview(confLabel)
        
        scrollView.easy.layout(Top(-20),
                               Trailing(),
                               Leading(),
                               Bottom())
        
        vectorImage.easy.layout(Top().to(scrollView,.top),
                                Trailing(),
                                Leading().to(logoLabel,.trailing))
        
        logoLabel.easy.layout(Top(58),
                              Leading(16),
                              Width(46), Height(24))
        
        loginLabel.easy.layout(Top(100).to(logoLabel,.bottom),
                               Leading(16),
                               Trailing(16))
        
        mailText.easy.layout(Top(16).to(loginLabel,.bottom),
                             Leading(16),
                             Trailing(16),
                             Width(343), Height(52))
        
        passwordText.easy.layout(Top(8).to(mailText,.bottom),
                                 Leading(16),
                                 Trailing(16),
                                 Width(343), Height(52))
        
        shapeImage.easy.layout(Trailing(16).to(passwordText,.trailing),
                               Bottom(20).to(passwordText,.bottom))
        
        loginButton.easy.layout(Top(16).to(passwordText,.bottom),
                                Leading(16),
                                Trailing(16),
                                Width(343), Height(52))
        forgotPassLabel.easy.layout(Center(),
                                    Top(16).to(loginButton))
        
        orLabel.easy.layout(Center(),
                            Top(24).to(forgotPassLabel))
        
        appleButton.easy.layout(Top(24).to(orLabel,.bottom),
                                Leading(16),
                                Trailing(16),
                                Width(343), Height(52))
        
        appleImage.easy.layout(Top(-2),
                               Leading(68),
                               Trailing(),Bottom())
        
        appleButton.titleLabel?.easy.layout(Trailing(80))
        
        facebookButton.easy.layout(Top(8).to(appleButton,.bottom),
                                   Leading(16),
                                   Trailing(16),
                                   Width(343), Height(52))
        
        facebookImage.easy.layout(Top(),
                                  Leading(65),
                                  Trailing(),
                                  Bottom())
        
        facebookButton.titleLabel?.easy.layout(Leading(85),
                                               Trailing(70),
                                               Width(172))
        
        haveAccountLabel.easy.layout(Center(),
                                     Top(54).to(facebookButton,.bottom))
        confLabel.easy.layout(Center(),
                              Top(16).to(haveAccountLabel),
                              Bottom(50))
    }
    
    // MARK: applyView
    func applyView() {
        
        let mutableAttributedString = NSMutableAttributedString()
        let firstAttribute = [NSAttributedString.Key.font: UIFont(name: "Nunito-Regular", size: 12)]
        let secondAttribute = [NSAttributedString.Key.font: UIFont(name: "Nunito-Regular", size: 12),
                               NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue] as [NSAttributedString.Key : Any]
        
        let firstAttributedString = NSAttributedString(string: "Продолжая использование, вы принимаете\n условия", attributes: firstAttribute)
        let secondAttributedString = NSAttributedString(string: " пользовательского соглашения", attributes: secondAttribute)
        let thirdAttributedString = NSAttributedString(string: " и \n", attributes: firstAttribute)
        let fourthAttributedString = NSAttributedString(string: "политики конфиденциальности", attributes: secondAttribute)
        
        mutableAttributedString.append(firstAttributedString)
        mutableAttributedString.append(secondAttributedString)
        mutableAttributedString.append(thirdAttributedString)
        mutableAttributedString.append(fourthAttributedString)
        
        facebookImage.image = UIImage(named: "facebook")
        facebookImage.contentMode = .left
        appleImage.image = UIImage(named: "apple")
        appleImage.contentMode = .left
        shapeImage.image = UIImage(named: "shape")
        shapeImage.contentMode = .right
        vectorImage.image = UIImage(named: "Vector")
        
        logoLabel.text = "Logo"
        logoLabel.font = UIFont(name: "Nunito-Regular", size: 20)
        
        loginLabel.text = "Вход"
        loginLabel.font = UIFont(name: "Nunito-Black", size: 24)
        
        
        mailText.backgroundColor = .white
        mailText.font = UIFont(name: "Nunito-Regular", size: 17)
        mailText.contentVerticalAlignment = .center
        mailText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: mailText.frame.height))
        mailText.layer.borderColor = UIColor(red: 0.917, green: 0.917, blue: 0.917, alpha: 1).cgColor
        mailText.leftViewMode = .always
        
        passwordText.backgroundColor = .white
        passwordText.font = UIFont(name: "Nunito-Regular", size: 17)
        passwordText.contentVerticalAlignment = .center
        passwordText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: passwordText.frame.height))
        passwordText.layer.borderColor = UIColor(red: 0.917, green: 0.917, blue: 0.917, alpha: 1).cgColor
        passwordText.textColor = UIColor(red: 0.192, green: 0.22, blue: 0.282, alpha: 1)
        passwordText.leftViewMode = .always
        passwordText.isSecureTextEntry = true
        
        loginButton.setTitle("Войти", for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Nunito-Bold", size: 17)
        loginButton.layer.backgroundColor = UIColor(red: 0.49, green: 0.678, blue: 1, alpha: 1).cgColor
        
        forgotPassLabel.text = "Забыли пароль?"
        forgotPassLabel.font = UIFont(name: "Nunito-Regular", size: 17)
        forgotPassLabel.textColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        
        orLabel.text = "ИЛИ"
        orLabel.font = UIFont(name: "Nunito-Regular", size: 17)
        orLabel.textColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        
        appleButton.setTitle("  Войти через Apple ID", for: .normal)
        appleButton.titleLabel?.font = UIFont(name: "Nunito-Bold", size: 17)
        
        facebookButton.setTitle(" Войти через Facebook", for: .normal)
        facebookButton.titleLabel?.font = UIFont(name: "Nunito-Bold", size: 17)
        facebookButton.layer.backgroundColor = UIColor(red: 0.094, green: 0.467, blue: 0.949, alpha: 1).cgColor
        
        haveAccountLabel.text = "У меня уже есть аккаунт"
        haveAccountLabel.font = UIFont(name: "Nunito-Regular", size: 17)
        haveAccountLabel.textColor = UIColor(red: 0.333, green: 0.357, blue: 0.408, alpha: 1)
        
        confLabel.attributedText = mutableAttributedString
        confLabel.textColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
    }
    
}

// MARK: extension LogInViewController
extension LogInViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.textColor == colorStart && textField == passwordText {
            textField.text = nil
            textField.textColor = colorCurrent
        } else if textField.textColor == colorStart && textField == mailText{
            textField.text = nil
            textField.textColor = colorCurrent
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? false && textField == mailText {
            textField.textColor = colorStart
        } else if textField.text?.isEmpty ?? false && textField == passwordText {
            textField.textColor = colorStart
            
        }
    }
}
