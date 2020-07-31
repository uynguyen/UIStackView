//
//  TaskView.swift
//  UIStackView
//
//  Created by Uy Nguyen on 7/26/20.
//  Copyright © 2020 Uy Nguyen. All rights reserved.
//

import UIKit
import SnapKit

protocol TaskViewDelegate {
    func onRemove(_ view: TaskView)
}

class TaskView: UIView {
    let data: [String: Any]
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10.0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.addArrangedSubview(self.horizontalStackView)
        stackView.addArrangedSubview(self.imageView)
        stackView.addArrangedSubview(self.btnRemove)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var btnRemove: UIButton = {
        let btn = UIButton()
        btn.setTitle("Remove", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        btn.layer.borderWidth = 0.5
        btn.layer.borderColor = UIColor.red.cgColor
        let constraint = btn.heightAnchor.constraint(equalToConstant: 30)
        constraint.isActive = true
        constraint.priority = UILayoutPriority(rawValue: 999)
    
        btn.addTarget(self, action: #selector(btnRemoveTouchUpInside), for: .touchUpInside)
        return btn
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10.0
        let constraint = view.heightAnchor.constraint(equalToConstant: 300)
        constraint.isActive = true
        constraint.priority = UILayoutPriority(rawValue: 999)
        view.contentMode = .scaleToFill
        let path = Bundle.main.path(forResource: self.data["image"] as? String ?? "", ofType: "jpg") ?? ""
        view.image = UIImage(contentsOfFile: path)
        return view
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution  = .fillEqually
        stackView.addArrangedSubview(lblTitle)
        stackView.addArrangedSubview(btnShow)
        let constraint = stackView.heightAnchor.constraint(equalToConstant: 30)
        constraint.isActive = true
        constraint.priority = UILayoutPriority(rawValue: 999)
        return stackView
    }()
    
    lazy var lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = self.data["room"] as? String ?? ""
        return lbl
    }()
    
    lazy var btnShow: UIButton = {
        let btn = UIButton()
        btn.setTitle("Hide", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.addTarget(self, action: #selector(btnShowTouchUpInside), for: .touchUpInside)
        return btn
    }()
    
    let delegate: TaskViewDelegate
    
    init(delegate: TaskViewDelegate, data: [String: Any]) {
        self.data = data
        self.delegate = delegate
        super.init(frame: .zero)
        backgroundColor = .lightGray
        addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 5, left: 10, bottom: 10, right: 10))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func btnShowTouchUpInside() {
        UIView.animate(withDuration: 0.2) {
            self.imageView.isHidden = !self.imageView.isHidden
        }
        
        if self.imageView.isHidden {
            btnShow.setTitle("Show", for: .normal)
        } else {
            btnShow.setTitle("Hide", for: .normal)
        }
    }
    
    @objc
    func btnRemoveTouchUpInside() {
        self.delegate.onRemove(self)
    }
}

