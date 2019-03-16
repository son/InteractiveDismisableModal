//
//  ModalNavigationController.swift
//  InteractiveDismisableModal
//
//  Created by Takeru Sato on 2019/03/16.
//  Copyright © 2019 son. All rights reserved.
//

import UIKit

final class ModalNavigationController: UINavigationController {
    
    var interactor: Interactor!
    
    func handleGesture(sender: UIPanGestureRecognizer) {
        let percentThreshold: CGFloat = 0.5
        let velocity = sender.velocity(in: view).y
        let velocityThreshold: CGFloat = 500.0
        let translation = sender.translation(in: view)
        let verticalMovement = translation.y / view.bounds.height
        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)
        let downwardMovementPercent = fminf(downwardMovement, 1.0)
        let progress = CGFloat(downwardMovementPercent)
        
        switch sender.state {
        case .began:
            interactor.hasStarted = true
            dismiss(animated: true, completion: nil)
        case .changed:
            interactor.shouldFinish = progress > percentThreshold || velocity > velocityThreshold
            interactor.update(progress)
        case .cancelled:
            interactor.hasStarted = false
            interactor.cancel()
        case .ended:
            interactor.hasStarted = false
            interactor.shouldFinish ? interactor.finish() : interactor.cancel()
        default: break
        }
    }
}
