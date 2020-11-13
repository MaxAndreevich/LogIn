//
//  StartViewController.swift
//  LogIn
//
//  Created by Максим Разумов on 10.11.2020.
//  Copyright © 2020 Максим Разумов. All rights reserved.
//

import Foundation
import UIKit
import EasyPeasy

class StartViewController: UIViewController {
    
    // MARK: variables
    private var scrollView = UIScrollView()
    
    private var logoLabel: UILabel = {
        var view = UILabel()
        return view
    }()
    
    private var vectorStartImage: UIImageView = {
        var view = UIImageView()
        return view
    }()
    
    private var circleBlueImage: UIImageView = {
        var view = UIImageView()
        return view
    }()
    
    private var circleYellowImage: UIImageView = {
        var view = UIImageView()
        return view
    }()
    
    private var starWhiteOneImage: UIImageView = {
        var view = UIImageView()
        return view
    }()
    
    private var starWhiteTwoImage: UIImageView = {
        var view = UIImageView()
        return view
    }()
    
    private var starPinkImage: UIImageView = {
        var view = UIImageView()
        return view
    }()
    
    private var startButton: UIButton = {
        var view = UIButton()
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        return view
    }()
    
    private var haveAccountButton: UIButton = {
        var view = UIButton()
        return view
    }()
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        applyStyle()
        scrollView.backgroundColor = .systemPink
        view.backgroundColor = UIColor(red: 1, green: 0.918, blue: 0.58, alpha: 1)
        scrollView.isScrollEnabled = true
        let buttons = [startButton, haveAccountButton]
        for button in buttons {
            button.addTarget(self, action: #selector(showLogin), for: .touchUpInside)
        }
    }
    
    // MARK: showLogin
    @objc func showLogin() {
        let nc = LogInViewController()
        nc.modalPresentationStyle = .overFullScreen
        present(nc, animated: true, completion: nil)
//        dismiss(animated: true, completion: nil)
    }
    
    // MARK: setupView
    func setupView() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(logoLabel)
        scrollView.addSubview(vectorStartImage)
        scrollView.addSubview(circleBlueImage)
        scrollView.addSubview(circleYellowImage)
        scrollView.addSubview(logoLabel)
        scrollView.addSubview(starWhiteOneImage)
        scrollView.addSubview(starWhiteTwoImage)
        scrollView.addSubview(starPinkImage)
        scrollView.addSubview(startButton)
        scrollView.addSubview(haveAccountButton)
        
        logoLabel.easy.layout(Top(58),
                              Leading(16.49))
        
        scrollView.easy.layout(Top(),
                               Leading(),
                               Trailing(),
                               Bottom())
        
        vectorStartImage.easy.layout(Top(),
                                     Trailing(),
                                     Leading(8.5))
        
        circleBlueImage.easy.layout(Top(233),
                                    Leading())
        
        circleYellowImage.easy.layout(Top(93.98).to(circleBlueImage,.top),
                                      Trailing(93.98).to(circleBlueImage,.trailing))
        
        starWhiteOneImage.easy.layout(Bottom(-15).to(circleYellowImage,.bottom),
                                      Leading(2.8).to(circleYellowImage,.trailing),
                                      Height(47.07),Width(47.07))
        
        starPinkImage.easy.layout(Top(2.58).to(starWhiteOneImage,.top),
                                  Leading(46.06).to(starWhiteOneImage,.leading))
        
        starWhiteTwoImage.easy.layout(Leading(35).to(circleBlueImage,.trailing),
                                      Bottom(35).to(circleBlueImage,.bottom),
                                      Height(47.07),Width(47.07))
        
        startButton.easy.layout(Top(98.02).to(circleBlueImage,.bottom),Leading(16.49),
                                Trailing(15.51),
                                Height(60), Width(343))
        
        haveAccountButton.easy.layout(Top().to(startButton,.bottom),
                                      Leading(16.49),
                                      Trailing(15.51),
                                      Bottom(74),
                                      Height(60), Width(343))
        
    }
    
    // MARK: applyStyle
    func applyStyle() {
        
        logoLabel.text = "Logo"
        logoLabel.font = UIFont(name: "Nunito-Regular", size: 20)
        
        vectorStartImage.image = UIImage(named: "vectorstart")
        circleBlueImage.image = UIImage(named: "vectorblue")
        circleYellowImage.image = UIImage(named: "vectoryellow")
        starWhiteOneImage.image = UIImage(named: "star2")
        starPinkImage.image = UIImage(named: "star1")
        starWhiteTwoImage.image = UIImage(named: "star2")
        
        startButton.setTitle("Начнем!", for: .normal)
        startButton.titleLabel?.font = UIFont(name: "Nunito-Bold", size: 17)
        startButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        startButton.setTitleColor(UIColor(red: 0.192, green: 0.22, blue: 0.282, alpha: 1), for: .normal)
        
        haveAccountButton.setTitle("У меня уже есть аккаунт", for: .normal)
        haveAccountButton.titleLabel?.font = UIFont(name: "Nunito-Bold", size: 17)
        haveAccountButton.setTitleColor(UIColor(red: 0.333, green: 0.357, blue: 0.408, alpha: 1), for: .normal)
    }
    
}
