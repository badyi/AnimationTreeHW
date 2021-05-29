//
//  ViewController.swift
//  AnimationHomeWork
//
//  Created by badyi on 23.05.2021.
//

import UIKit

final class MainViewController: UIViewController {
    private var myView: GrowingTreeViewProtocol
    
    init(with view: GrowingTreeViewProtocol) {
        self.myView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = (myView as! UIView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.configView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myView.didLayoutSubviews()
    }
}

extension MainViewController: MainViewControllerProtocol {
    func restoreButtonTapped() {
        let vc = MainAssembly.createMainModule()
        UIApplication.shared.windows.first?.rootViewController = vc
    }
    
    func startButtonTapped() {
        myView.animateStartButton()
        myView.animateSun()
        myView.animateGrowingSproutFlowersAndGrass()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            self?.myView.animateTrunk()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) { [weak self] in
            self?.myView.animateBrunches()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 15) { [weak self] in
            self?.myView.animateLeaves()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 20) { [weak self] in
            self?.myView.showRestoreButton()
        }
    }
}
