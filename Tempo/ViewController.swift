//
//  ViewController.swift
//  Tempo
//
//  Created by João Pedro Rosada Volponi on 28/11/23.
//

import UIKit

class ViewController: UIViewController {

 // Image Background
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setHierarchy()
        setContraints()
        
    }
    
    private func setHierarchy() {
        view.addSubview(backgroundView)
    }
    
    private func setContraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
  
}

