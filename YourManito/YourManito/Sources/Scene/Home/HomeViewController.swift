//
//  HomeViewController.swift
//  YourManito
//
//  Created by 이자민 on 2/26/24.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    
    private let testLabel: YourManitoLabel = .init(font: .font(.heading_1), color: .black)
    
    private let testButton: UIButton = {
       let button = UIButton()
        button.setTitle("Click me!!", for: .normal)
        button.titleLabel?.font = UIFont.font(.heading_6)
        button.setTitleColor(.white, for: .normal)
        button.contentEdgeInsets = .init(top: 9, left: 14, bottom: 9, right: 14)
        button.backgroundColor = .purple
       
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
        setupButton()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
        testLabel.text = "Hello World"
    }
    
    private func setLayout() {
        self.view.addSubview(testLabel)
        self.view.addSubview(testButton)
        testLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(32)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(27)
        }
        testButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(testLabel.snp.bottom).offset(27)
        }
    }
    
    private func setupButton() {
        testButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc private func buttonTapped() {
        print("Button tapped!")
        showToast(message: "Assignment3 :)")
    }
}


extension UIViewController {
    func showToast(message: String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont.systemFont(ofSize: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 2.0, delay: 1.0, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
