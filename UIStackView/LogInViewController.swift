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
        
        view.addSubview(lblUsername)
        lblUsername.snp.makeConstraints { (make) in
            make.centerX.left.right.equalTo(lblLogin)
            make.top.equalTo(lblLogin.snp.bottom).offset(30)
            make.height.equalTo(30)
        }
        
        view.addSubview(txtUserName)
        txtUserName.snp.makeConstraints { (make) in
            make.centerX.left.right.equalTo(lblUsername)
            make.top.equalTo(lblUsername.snp.bottom).offset(20)
            make.height.equalTo(35)
        }
        
        view.addSubview(lblPassword)
        lblPassword.snp.makeConstraints { (make) in
            make.top.equalTo(txtUserName.snp.bottom).offset(20)
            make.left.right.height.centerX.equalTo(lblUsername)
        }
        
        view.addSubview(txtPassword)
        txtPassword.snp.makeConstraints { (make) in
            make.top.equalTo(lblPassword.snp.bottom).offset(20)
            make.left.right.height.centerX.equalTo(txtUserName)
        }
        
        view.addSubview(btnLogin)
        btnLogin.snp.makeConstraints { (make) in
            make.top.equalTo(txtPassword.snp.bottom).offset(20)
            make.left.right.equalTo(txtPassword)
            make.height.equalTo(40)
        }
    }
}
