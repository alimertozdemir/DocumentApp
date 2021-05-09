//
//  ViewController.swift
//  DocumentPreview
//
//  Created by Ali Mert on 9.05.2021.
//

import UIKit
import SwiftyGif

class SplashViewController: UIViewController {
    
    let logoAnimationView = LogoAnimationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(logoAnimationView)
        logoAnimationView.pinEdgesToSuperView()
        logoAnimationView.logoGifImageView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logoAnimationView.logoGifImageView.startAnimatingGif()
    }
    
    private func openLoginScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let storyboard = UIStoryboard(name: "LoginScreen", bundle: nil)
            let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginScreen")
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: true, completion: nil)
        }
    }

}

extension SplashViewController: SwiftyGifDelegate {
    func gifDidStop(sender: UIImageView) {
        logoAnimationView.isHidden = true
        openLoginScreen()
    }
}

