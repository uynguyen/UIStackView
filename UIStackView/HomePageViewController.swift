//
//  HomePageViewController.swift
//  UIStackView
//
//  Created by Uy Nguyen on 7/22/20.
//  Copyright © 2020 Uy Nguyen. All rights reserved.
//

import UIKit

let room: [[String: Any]] = [
    [
        "room": "Pantry",
        "image": "pantry"
    ],
    [
        "room": "Living Room",
        "image": "livingRoom"
    ],
    [
        "room": "Spare Room",
        "image": "spareRoom"
    ],
    [
        "room": "Games Room",
        "image": "gameRoom"
    ],
    [
        "room": "Dining Room",
        "image": "diningRoom"
    ],
    [
        "room": "Library",
        "image": "library"
    ]
]

class HomePageViewController: UIViewController, TaskViewDelegate {
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var taskStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20.0
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home Control"
        self.view.backgroundColor = .white
        addRightBarButton()
        
        view.addSubview(scrollView)
        scrollView.addSubview(taskStackView)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        taskStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalTo(scrollView)
        }
    }
    
    private func addRightBarButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addMoreView))
    }
    
    @objc
    func addMoreView() {
        let view = TaskView(delegate: self, data: room[Int.random(in: 0..<room.count)])
        let constraint1 = view.heightAnchor.constraint(lessThanOrEqualToConstant: 400.0)
        constraint1.isActive = true
        self.taskStackView.addArrangedSubview(view)
        self.view.layoutIfNeeded()
    }
    
    func onRemove(_ view: TaskView) {
        if let first = self.taskStackView.arrangedSubviews.first(where: { $0 === view }) {
            UIView.animate(withDuration: 0.3, animations: {
                first.isHidden = true
                first.removeFromSuperview()
            }) { (_) in
                self.view.layoutIfNeeded()
            }
        }
    }
}
