//
//  ViewController.swift
//  UIStackView
//
//  Created by Uy Nguyen on 7/18/20.
//  Copyright © 2020 Uy Nguyen. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var horizontalBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var verticalBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.addArrangedSubview(self.blueView)
        stackView.addArrangedSubview(self.blackView)
        stackView.addArrangedSubview(self.greenView)
        stackView.spacing = 10.0
        return stackView
    }()
    
    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.distribution = .fill
        stackView.addArrangedSubview(self.yellowView)
        stackView.addArrangedSubview(self.grayView)
        stackView.addArrangedSubview(self.redView)
        return stackView
    }()
    
    lazy var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        let constraint = view.widthAnchor.constraint(equalToConstant: 50)
        constraint.isActive = true
        constraint.priority = UILayoutPriority(999)
        let heightConstraint = view.heightAnchor.constraint(equalToConstant: 50)
        heightConstraint.isActive = true
        heightConstraint.priority = UILayoutPriority(999)
//        let center = UIView()
//        center.backgroundColor = .red
//        view.addSubview(center)
//        center.snp.makeConstraints { (make) in
//            make.center.equalToSuperview()
//            make.width.height.equalTo(7)
//        }
        return view
    }()
    
    lazy var blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        let constraint = view.widthAnchor.constraint(equalToConstant: 100)
        constraint.isActive = true
        constraint.priority = UILayoutPriority(999)
        let heightConstraint = view.heightAnchor.constraint(equalToConstant: 50)
        heightConstraint.isActive = true
        heightConstraint.priority = UILayoutPriority(999)
//        let center = UIView()
//        center.backgroundColor = .red
//        view.addSubview(center)
//        center.snp.makeConstraints { (make) in
//            make.center.equalToSuperview()
//            make.width.height.equalTo(7)
//        }
        return view
    }()
    
    lazy var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        let constraint = view.widthAnchor.constraint(equalToConstant: 200)
        constraint.isActive = true
        constraint.priority = UILayoutPriority(999)
        let heightConstraint = view.heightAnchor.constraint(equalToConstant: 100)
        heightConstraint.isActive = true
        heightConstraint.priority = UILayoutPriority(999)
//        let center = UIView()
//        center.backgroundColor = .red
//        view.addSubview(center)
//        center.snp.makeConstraints { (make) in
//            make.center.equalToSuperview()
//            make.width.height.equalTo(7)
//        }
        return view
    }()
    
    lazy var yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        let constraint = view.widthAnchor.constraint(equalToConstant: 50)
        constraint.isActive = true
        constraint.priority = UILayoutPriority(999)
        let heightConstraint = view.heightAnchor.constraint(equalToConstant: 50)
        heightConstraint.isActive = true
        heightConstraint.priority = UILayoutPriority(999)
        return view
    }()
    
    lazy var grayView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        let constraint = view.widthAnchor.constraint(equalToConstant: 100)
        constraint.isActive = true
        constraint.priority = UILayoutPriority(999)
        let heightConstraint = view.heightAnchor.constraint(equalToConstant: 50)
        heightConstraint.isActive = true
        heightConstraint.priority = UILayoutPriority(999)
        return view
    }()
    
    lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        let constraint = view.widthAnchor.constraint(equalToConstant: 200)
        constraint.isActive = true
        constraint.priority = UILayoutPriority(999)
        let heightConstraint = view.heightAnchor.constraint(equalToConstant: 100)
        heightConstraint.isActive = true
        heightConstraint.priority = UILayoutPriority(999)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(horizontalBackground)
        horizontalBackground.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(100)
            make.left.right.equalToSuperview()
            make.height.equalTo(200)
        }
        
        view.addSubview(horizontalStackView)
        horizontalStackView.snp.makeConstraints { (make) in
            make.edges.equalTo(horizontalBackground)
        }
        
        view.addSubview(verticalBackground)
        verticalBackground.snp.makeConstraints { (make) in
            make.top.equalTo(horizontalBackground.snp.bottom).offset(50)
            make.left.right.equalToSuperview()
            make.height.equalTo(300)
        }
        
        view.addSubview(verticalStackView)
        verticalStackView.snp.makeConstraints { (make) in
            make.edges.equalTo(verticalBackground)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.show(LoginViewController(), sender: self)
    }
}

