//
//  View.swift
//  AnimationHomeWork
//
//  Created by badyi on 29.05.2021.
//

import UIKit

final class GrowingTreeView: UIView {
    weak var controller: MainViewControllerProtocol?
    
    private lazy var startButton: UIButton = {
        UIFactory().makeButton(with: "Start", backColor: .orange, action: #selector(startButtonTapped))
    }()
    
    private lazy var restoreButton: UIButton = {
        UIFactory().makeButton(with: "Restore", backColor: .systemBlue, action: #selector(restoreButtonTapped))
    }()
    
    private lazy var sun: UIImageView = {
        UIFactory().makeImageView(name: "sun", opacity: 1)
    }()
    
    private lazy var ground: UIView = {
        UIFactory().makeView()
    }()
    
    private lazy var sprout: UIImageView = {
        UIFactory().makeImageView()
    }()
    
    private lazy var trunk: UIImageView = {
        UIFactory().makeImageView(name: "trunk", opacity: 1)
    }()
    
    private lazy var brunchesLeft: [UIImageView] = {
        UIFactory().makeBranches(count: 2, name: "branchLeft")
    }()
    
    private lazy var brunchesRight: [UIImageView] = {
        UIFactory().makeBranches(count: 2, name: "branchRight")
    }()
    
    private lazy var flowers: [UIImageView] = {
        UIFactory().makeFlowers(count: 6)
    }()
    
    private lazy var grass: UIImageView = {
        UIFactory().makeImageView(name: "grass", opacity: 0)
    }()
    
    private lazy var leaves: UIImageView = {
        UIFactory().makeImageView(name: "leaves", opacity: 0)
    }()
    
    
    private lazy var trunkConstraints: [NSLayoutConstraint] = {
        let array = [trunk.widthAnchor.constraint(equalToConstant: 40),
                    trunk.heightAnchor.constraint(equalToConstant: 40),
                    trunk.centerXAnchor.constraint(equalTo: centerXAnchor),
                    trunk.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60)]
        return array
    }()
    
    private lazy var sunConstraints: [NSLayoutConstraint] = {
        let array = [
            sun.topAnchor.constraint(equalTo: topAnchor, constant: -140),
            sun.trailingAnchor.constraint(equalTo: trailingAnchor),
            sun.widthAnchor.constraint(equalToConstant: 150),
            sun.heightAnchor.constraint(equalToConstant: 90)
        ]
        return array
    }()
    
    private var sproutBottomAnchor: NSLayoutConstraint? = nil
}

extension GrowingTreeView: GrowingTreeViewProtocol {
    func didLayoutSubviews() {
        let maskView = UIImageView()
        maskView.image = UIImage(named: "sprout")
        sprout.mask = maskView
        maskView.frame = sprout.bounds
        leaves.layer.cornerRadius = leaves.frame.width / 2
    }
    
    func configView() {
        backgroundColor = .systemTeal
        restoreButton.isHidden = true
        
        addSubview(restoreButton)
        addSubview(sun)
        addSubview(startButton)
        addSubview(leaves)

        brunchesLeft.forEach { brunch in
            addSubview(brunch)
        }
        brunchesRight.forEach { brunch in
            addSubview(brunch)
        }
        
        addSubview(trunk)
        addSubview(sprout)
        addSubview(ground)
        ground.addSubview(grass)
        
        flowers.forEach { flower in
            ground.addSubview(flower)
        }
        
        NSLayoutConstraint.activate([
            restoreButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            restoreButton.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            restoreButton.widthAnchor.constraint(equalToConstant: 70),
            restoreButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate(sunConstraints)
        
        NSLayoutConstraint.activate([
            leaves.centerYAnchor.constraint(equalTo: trunk.centerYAnchor, constant: -50),
            leaves.centerXAnchor.constraint(equalTo: trunk.centerXAnchor),
            leaves.leadingAnchor.constraint(equalTo: leadingAnchor),
            leaves.trailingAnchor.constraint(equalTo: trailingAnchor),
            leaves.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate(trunkConstraints)
        
        NSLayoutConstraint.activate([
            brunchesLeft[0].centerXAnchor.constraint(equalTo: trunk.centerXAnchor),
            brunchesLeft[0].centerYAnchor.constraint(equalTo: trunk.centerYAnchor, constant: 20),
            
            brunchesLeft[1].centerXAnchor.constraint(equalTo:  trunk.centerXAnchor),
            brunchesLeft[1].centerYAnchor.constraint(equalTo:  trunk.centerYAnchor, constant: -60),
            
            brunchesRight[0].centerXAnchor.constraint(equalTo: trunk.centerXAnchor),
            brunchesRight[0].centerYAnchor.constraint(equalTo: trunk.centerYAnchor, constant: 15),
            
            brunchesRight[1].centerXAnchor.constraint(equalTo: trunk.centerXAnchor),
            brunchesRight[1].centerYAnchor.constraint(equalTo: trunk.centerYAnchor, constant: -55),
        ])
        
        NSLayoutConstraint.activate([
            trunk.widthAnchor.constraint(equalToConstant: 40),
            trunk.heightAnchor.constraint(equalToConstant: 40),
            trunk.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            grass.leadingAnchor.constraint(equalTo: ground.leadingAnchor),
            grass.trailingAnchor.constraint(equalTo: ground.trailingAnchor),
            grass.topAnchor.constraint(equalTo: ground.topAnchor),
            grass.bottomAnchor.constraint(equalTo: ground.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            startButton.widthAnchor.constraint(equalToConstant: 50),
            startButton.heightAnchor.constraint(equalToConstant: 20),
            startButton.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            startButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            ground.bottomAnchor.constraint(equalTo: bottomAnchor),
            ground.heightAnchor.constraint(equalToConstant: 100),
            ground.leadingAnchor.constraint(equalTo: leadingAnchor),
            ground.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        sprout.backgroundColor = .green
        sproutBottomAnchor = sprout.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60)
        NSLayoutConstraint.activate([
            sprout.widthAnchor.constraint(equalToConstant: 40),
            sprout.heightAnchor.constraint(equalToConstant: 40),
            sprout.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        sproutBottomAnchor?.isActive = true
        
        NSLayoutConstraint.activate([
            flowers[0].leadingAnchor.constraint(equalTo: ground.leadingAnchor, constant: 10),
            flowers[0].topAnchor.constraint(equalTo: ground.topAnchor, constant: 10),
            
            flowers[1].leadingAnchor.constraint(equalTo: ground.leadingAnchor, constant: 30),
            flowers[1].bottomAnchor.constraint(equalTo: ground.bottomAnchor, constant: -10),
            
            flowers[2].leadingAnchor.constraint(equalTo: ground.leadingAnchor, constant: 100),
            flowers[2].bottomAnchor.constraint(equalTo: ground.bottomAnchor, constant: -15),
            
            flowers[3].trailingAnchor.constraint(equalTo: ground.trailingAnchor, constant: -15),
            flowers[3].topAnchor.constraint(equalTo: ground.topAnchor, constant: 15),
            
            flowers[4].trailingAnchor.constraint(equalTo: ground.trailingAnchor, constant: -25),
            flowers[4].bottomAnchor.constraint(equalTo: ground.bottomAnchor, constant: -10),
            
            flowers[5].trailingAnchor.constraint(equalTo: ground.trailingAnchor, constant: -120),
            flowers[5].bottomAnchor.constraint(equalTo: ground.bottomAnchor, constant: -30)
        ])
    }
    
    func animateSun() {
        sun.layer.removeAllAnimations()
        let sunY = sun.frame.minY + 45
        let sunX = sun.frame.minX + 75
        
        let changePositionAnimation = UIAnimationFactory().makeChangePositionAnimation(x: sunX, y: sunY, type: .plusY, max: 175, duration: 5, step: 5)
        
        sunConstraints[0].isActive = false
        sunConstraints[0] = sun.topAnchor.constraint(equalTo: topAnchor, constant: 30)
        sunConstraints[0].isActive = true
        
        sun.layer.add(changePositionAnimation, forKey: "position")
    }
    
    func animateGrowingSproutFlowersAndGrass() {
        sprout.layer.removeAllAnimations()
        let sproutY = sprout.frame.minY + 20
        let sproutX = sprout.frame.minX + 20
        
        let changePositionAnimation = UIAnimationFactory().makeChangePositionAnimation(x: sproutX, y: sproutY, type: .minusY, max: 35, duration: 5, step: 5)
        sproutBottomAnchor?.isActive = false
        sproutBottomAnchor = sprout.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -95)
        
        let animationOpacityFlowers = UIAnimationFactory().makeOpacityAnimation(from: 0, to: 1, duration: 5)
        
        let animationOpacityGrass = UIAnimationFactory().makeOpacityAnimation(from: 0, to: 1, duration: 5)
        
        grass.layer.add(animationOpacityGrass, forKey: "opacity")
        sprout.layer.add(changePositionAnimation, forKey: "position")
        sproutBottomAnchor?.isActive = true
        
        flowers.forEach { $0.layer.add(animationOpacityFlowers, forKey: "opacity")}
    }
    
    func animateTrunk() {
        trunk.layer.removeAllAnimations()
        let trunkY = trunk.frame.minY + 20
        let trunkX = trunk.frame.minX + 20
        
        let changePositionAnimation = UIAnimationFactory().makeChangePositionAnimation(x: trunkX, y: trunkY, type: .minusY, max: 200, duration: 5, step: 5)
        
        let animationOpacitySprout = UIAnimationFactory().makeOpacityAnimation(from: 1, to: 0, duration: 2)
        
        sprout.layer.add(animationOpacitySprout, forKey: "opacity")
        
        trunkConstraints[3].isActive = false
        trunkConstraints[3] = trunk.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60 - 200)
        trunkConstraints[3].isActive = true
        
        trunk.layer.add(changePositionAnimation, forKey: "position")
        UIView.animate(withDuration: 5) { [weak self] in
            self?.trunk.transform = CGAffineTransform(scaleX: 10, y: 10)
        }
    }
    
    func animateBrunches() {
        brunchesLeft.forEach { $0.layer.removeAllAnimations() }
        brunchesRight.forEach { $0.layer.removeAllAnimations() }
        
        let animationOpacitySprout = UIAnimationFactory().makeOpacityAnimation(from: 0, to: 1, duration: 1)
        
        brunchesLeft.forEach { $0.layer.add(animationOpacitySprout, forKey: "opacity") }
        brunchesRight.forEach { $0.layer.add(animationOpacitySprout, forKey: "opacity") }
        
        UIView.animate(withDuration: 5, delay: 1) { [weak self] in
            self?.brunchesLeft[0].transform = CGAffineTransform(scaleX: 6, y: 6)
            self?.brunchesLeft[1].transform = CGAffineTransform(scaleX: 4, y: 4)
            
            self?.brunchesRight[0].transform = CGAffineTransform(scaleX: 6, y: 6)
            self?.brunchesRight[1].transform = CGAffineTransform(scaleX: 4, y: 4)
        }
    }
    
    func animateLeaves() {
        leaves.layer.removeAllAnimations()
        let animation = UIAnimationFactory().makeOpacityAnimation(from: 0, to: 1, duration: 5)
        leaves.layer.add(animation, forKey: "opacity")
    }
    
    func animateStartButton() {
        startButton.layer.removeAllAnimations()
        let animation = UIAnimationFactory().makeOpacityAnimation(from: 1, to: 0, duration: 1)
        startButton.layer.add(animation, forKey: "opacity")
    }
    
    func showRestoreButton() {
        restoreButton.isHidden = false
    }
}

extension GrowingTreeView {
    @objc private func startButtonTapped() {
        controller?.startButtonTapped()
    }
    
    @objc private func restoreButtonTapped() {
        controller?.restoreButtonTapped()
    }
}
