//
//  LogInViewController.swift
//  UIStackView
//
//  Created by Uy Nguyen on 7/19/20.
//  Copyright © 2020 Uy Nguyen. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        [self.lblUsername,
         self.txtUserName,
         self.lblPassword,
         self.txtPassword,
         self.keepLoginStackView,
         self.btnLogin].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    lazy var keepLoginStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .trailing
        stackView.distribution = .fill
        [self.lblRememberMe,
         self.swKeepLogin].forEach { stackView.addArrangedSubview($0) }
        return stackView
    }()
    
    lazy var lblRememberMe: UILabel = {
        let lbl = UILabel()
        lbl.text = "Keep Me Log in"
        lbl.textColor = .lightGray
        return lbl
    }()
    
    lazy var swKeepLogin: UISwitch = {
        let sw = UISwitch()
        return sw
    }()
    
    lazy var lblLogin: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 30.0, weight: .bold)
        lbl.textAlignment = .center
        lbl.text = "LOG IN"
        return lbl
    }()
    
    lazy var lblUsername: UILabel = {
        let label = UILabel()
        label.text = "Username"
        return label
    }()
    
    lazy var lblPassword: UILabel = {
        let label = UILabel()
        label.text = "Password"
        return label
    }()
    
    lazy var txtUserName: UITextField = {
        let view = UITextField()
        view.placeholder = "Username"
        return view
    }()
    
    lazy var txtPassword: UITextField = {
        let view = UITextField()
        view.isSecureTextEntry = true
        view.text = "*****"
        return view
    }()
    
    lazy var btnLogin: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 5.0
        btn.clipsToBounds = true
        btn.backgroundColor = .blue
        btn.setTitle("Log in", for: .normal)
        btn.addTarget(self, action: #selector(btnLoginTouchUpInside), for: .touchUpInside)
        return btn
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(lblLogin)
        lblLogin.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-250)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(30)
        }
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.centerX.left.right.equalTo(lblLogin)
            make.top.equalTo(lblLogin.snp.bottom).offset(30)
            make.height.equalTo(300)
        }
    }
    
    @objc
    func btnLoginTouchUpInside() {
        
    }
}
