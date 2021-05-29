//
//  UIFactory.swift
//  AnimationHomeWork
//
//  Created by badyi on 24.05.2021.
//

import UIKit

final class UIFactory {
    func makeFlowers(count: Int) -> [UIImageView] {
        var views = [UIImageView]()
        for _ in 0..<count {
            let view = UIImageView(image: UIImage(named: "flower"))
            view.contentMode = .scaleAspectFit
            view.layer.opacity = 0
            view.translatesAutoresizingMaskIntoConstraints = false
            view.widthAnchor.constraint(equalToConstant: 40).isActive = true
            view.heightAnchor.constraint(equalToConstant: 40).isActive = true
            views.append(view)
        }
        return views
    }
    
    func makeBranches(count: Int, name: String) -> [UIImageView] {
        var views = [UIImageView]()
        for _ in 0..<count {
            let view = UIImageView(image: UIImage(named: name))
            view.contentMode = .scaleAspectFit
            view.layer.opacity = 0
            view.translatesAutoresizingMaskIntoConstraints = false
            view.widthAnchor.constraint(equalToConstant: 40).isActive = true
            view.heightAnchor.constraint(equalToConstant: 40).isActive = true
            views.append(view)
        }
        return views
    }
    
    func makeStartButton(action: Selector) -> UIButton {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
    
    func makeButton(with title: String, backColor: UIColor, action: Selector) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = backColor
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
    
    func makeImageView(name: String, opacity: Float) -> UIImageView {
        let view = UIImageView(image: UIImage(named: name))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        view.layer.opacity = opacity
        return view
    }
    
    func makeImageView() -> UIImageView {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func makeView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brown
        return view
    }
}
