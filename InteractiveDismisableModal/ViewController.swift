//
//  ViewController.swift
//  InteractiveDismisableModal
//
//  Created by Takeru Sato on 2019/03/16.
//  Copyright © 2019 son. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var interactor = Interactor()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showButtonTapped(_ sender: Any) {
        let viewController = ModalViewController()
        let navigationController = ModalNavigationController(rootViewController: viewController)
        navigationController.interactor = interactor
        navigationController.transitioningDelegate = self
        present(navigationController, animated: true, completion: nil)
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return InteractiveDismissTransition()
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
}
