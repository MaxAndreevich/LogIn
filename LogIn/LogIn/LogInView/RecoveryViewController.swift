//
//  RecoveryViewController.swift
//  LogIn
//
//  Created by Максим Разумов on 12.11.2020.
//  Copyright © 2020 Максим Разумов. All rights reserved.
//

import Foundation
import EasyPeasy
import UIKit


// MARK:RecoveryViewController
class RecoveryViewController: UIViewController {
    
    // MARK: variables
    private var scrollView = UIScrollView()
    
    private var vectorImage: UIImageView = {
        var view = UIImageView()
        return view
    }()
    
    private var backButton: UIButton = {
        var view = UIButton()
        return view
    }()
    
    private var cantEnterlabel: UILabel = {
        var view = UILabel()
        return view
    }()
    
    private var enterEmailLabel: UILabel = {
        var view = UILabel()
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    private var yourMailText: UITextField = {
        var view = UITextField()
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()
    
    private var sendLinkButton: UIButton = {
        var view = UIButton()
        view.layer.cornerRadius = 26
        view.clipsToBounds = true
        view.alpha = 0.4
        return view
    }()
    
    private var pinkHeartImage: UIImageView = {
        var view = UIImageView()
        return view
    }()
    
    private var yelowHeartImage: UIImageView = {
        var view = UIImageView()
        return view
    }()
    
    var colorStart = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
    var colorCurrent = UIColor(red: 0.192, green: 0.22, blue: 0.282, alpha: 1)
    
    var send: Bool = false
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        applyStyle()
        yourMailText.placeholder = "Your mail"
        yourMailText.delegate = self
        yourMailText.textColor = colorStart
        backButton.addTarget(self, action: #selector(returnLogIn), for: .touchUpInside)
        sendLinkButton.addTarget(self, action: #selector(sendLink), for: .touchUpInside)
    }
    
    // MARK: viewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textFieldDidBeginEditing(yourMailText)
        textFieldDidEndEditing(yourMailText)
        yourMailText.addTarget(self, action: #selector(changeEnable), for: .editingChanged)
    }
    
    // MARK: isValidEmail
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    // MARK: changeEnable
    @objc func changeEnable() {
        if isValidEmail(email: yourMailText.text ?? "") {
            sendLinkButton.alpha = 1
            sendLinkButton.isEnabled = true
        } else {
            sendLinkButton.alpha = 0.4
            sendLinkButton.isEnabled = false
        }
    }
    
    // MARK: returnLogIn
    @objc func returnLogIn() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: sendLink
    @objc func sendLink() {
        send = true
        cantEnterlabel.text = "Спасибо!"
        enterEmailLabel.text = "Ссылка была отправлена на вашу почту,\nпроверьте входящие сообщения."
        sendLinkButton.setTitle("Войти", for: .normal)
        yourMailText.alpha = 0
        setupView()
    }
    
    // MARK: setupView
    func setupView() {
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(vectorImage)
        scrollView.addSubview(backButton)
        scrollView.addSubview(cantEnterlabel)
        scrollView.addSubview(enterEmailLabel)
        scrollView.addSubview(yourMailText)
        scrollView.addSubview(sendLinkButton)
        scrollView.addSubview(pinkHeartImage)
        scrollView.addSubview(yelowHeartImage)
        
        scrollView.easy.layout(Top(-10), Leading(), Trailing(), Bottom())
        vectorImage.easy.layout(Top(20).to(scrollView,.top),Leading(6.9).to(backButton,.trailing))
        backButton.easy.layout(Top(68), Leading(16), Height(32), Width(32))
        cantEnterlabel.easy.layout(Top(98).to(backButton,.bottom), Leading(16), Trailing(16), Width(343), Height(30))
        enterEmailLabel.easy.layout(Top(8).to(cantEnterlabel,.bottom), Leading(16), Trailing(16), Width(343))
        
        if send == false {
            yourMailText.easy.layout(Top(16).to(enterEmailLabel,.bottom), Leading(16), Trailing(16), Height(52), Width(343))
            sendLinkButton.easy.layout(Top(16).to(yourMailText,.bottom), Trailing(16), Leading(16), Height(52), Width(343), Bottom(431))
        }else {
            sendLinkButton.easy.layout(Top(16).to(enterEmailLabel,.bottom), Width(343), Height(52), Bottom(161).to(pinkHeartImage,.top))
            pinkHeartImage.easy.layout(Top(228).to(enterEmailLabel,.bottom), Leading(26), Height(49), Width(53))
            yelowHeartImage.easy.layout(Top(161).to(pinkHeartImage,.bottom), Trailing(51), Bottom(55),Height(40), Width(37))
        }
    }
    
    // MARK: applyStyle
    func applyStyle() {
        
        vectorImage.image = UIImage(named: "Vector")
        backButton.setImage(UIImage(named: "back"), for: .normal)
        
        cantEnterlabel.text = "Вы не можете войти?"
        cantEnterlabel.font = UIFont(name: "Nunito-Black", size: 24)
        cantEnterlabel.textColor = UIColor(red: 0.145, green: 0.157, blue: 0.243, alpha: 1)
        
        enterEmailLabel.text = "Пожалуйста, введите адрес электронной почты\nдля получения ссылки на восстановление пароля."
        enterEmailLabel.font = UIFont(name: "Nunito-Regular", size: 14.5 )
        enterEmailLabel.textColor = UIColor(red: 0.333, green: 0.357, blue: 0.408, alpha: 1)
        
        yourMailText.backgroundColor = .lightGray
        yourMailText.font = UIFont(name: "Nunito-Regular", size: 17)
        yourMailText.contentVerticalAlignment = .center
        yourMailText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: yourMailText.frame.height))
        yourMailText.layer.borderColor = UIColor(red: 0.917, green: 0.917, blue: 0.917, alpha: 1).cgColor
        yourMailText.leftViewMode = .always
        
        sendLinkButton.setTitle("Отправить ссылку", for: .normal)
        sendLinkButton.titleLabel?.font = UIFont(name: "Nunito-Bold", size: 17)
        sendLinkButton.layer.backgroundColor = UIColor(red: 0.49, green: 0.678, blue: 1, alpha: 1).cgColor
        
        pinkHeartImage.image = UIImage(named: "pinkheart")
        yelowHeartImage.image = UIImage(named: "yellowheart")
        
    }
}

// MARK: extension RecoveryViewController
extension RecoveryViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.textColor == colorStart {
            textField.text = nil
            textField.textColor = colorCurrent
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? false {
            textField.textColor = colorStart
        }
    }
}
