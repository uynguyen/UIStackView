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
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .red
        let constraint = btn.heightAnchor.constraint(equalToConstant: 30)
        constraint.isActive = true
        constraint.priority = UILayoutPriority(rawValue: 999)
    
        btn.addTarget(self, action: #selector(btnRemoveTouchUpInside), for: .touchUpInside)
        return btn
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .yellow
        let constraint = view.heightAnchor.constraint(equalToConstant: 300)
        constraint.isActive = true
        constraint.priority = UILayoutPriority(rawValue: 999)
//        view.contentMode = .scaleToFill
//        let path = Bundle.main.path(forResource: self.data["image"] as? String ?? "", ofType: "jpg") ?? ""
//        view.image = UIImage(contentsOfFile: path)
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
        
        self.imageView.isHidden = !self.imageView.isHidden
        
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

class HomePageViewController: UIViewController, TaskViewDelegate {
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
//        scrollView.showsVerticalScrollIndicator = false
//        scrollView.isUserInteractionEnabled = true
//        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
//    lazy var contentView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .green
//        view.addSubview(taskStackView)
//        taskStackView.snp.makeConstraints { (make) in
//            make.edges.equalToSuperview()
//        }
//
//        return view
//    }()
    
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
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
               scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
               scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
               scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

               taskStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
               taskStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
               taskStackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
               taskStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
               // this is important for scrolling
               taskStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
//        scrollViewContainer.addArrangedSubview(redView)
//        scrollViewContainer.addArrangedSubview(blueView)
//        scrollViewContainer.addArrangedSubview(greenView)
        
//        taskStackView.snp.makeConstraints { (make) in
//            make.top.equalTo(self.scrollView)
//            make.bottom.left.right.equalTo(self.view)
////            make.height.equalTo(height).priority(1000)
//        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//
//        let contentRect: CGRect = taskStackView.arrangedSubviews.reduce(into: .zero) { rect, view in
//            rect = rect.union(view.frame)
//        }
//        print(contentRect)
//        scrollView.contentSize = CGSize(width: self.view.frame.width, height: CGFloat(taskStackView.arrangedSubviews.count) * 400.0)

//        taskStackView.snp.remakeConstraints { (make) in
//            make.top.equalTo(self.scrollView)
//            make.left.right.equalTo(self.view)
//            make.height.equalTo(height).priority(1000)
//        }
//
//        self.scrollView.contentSize = taskStackView.frame.size
    }
    
    private func addRightBarButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addMoreView))
    }
    
    @objc
    func addMoreView() {
        let view = TaskView(delegate: self, data: room[Int.random(in: 0..<room.count)])
        let constraint1 = view.heightAnchor.constraint(lessThanOrEqualToConstant: 400.0)
        constraint1.isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
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
