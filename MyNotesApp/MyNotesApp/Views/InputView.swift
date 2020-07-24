//
//  InputView.swift
//  MyNotesApp
//
//  Created by Somya on 24/07/20.
//  Copyright © 2020 Somya. All rights reserved.
//

import UIKit

class InputView: UIView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var topView: UIView!

    
    override func draw(_ rect: CGRect) {
        // Drawing code
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commitInit()
    }
    
    private func commitInit() {
          
          Bundle.main.loadNibNamed("InputView", owner: self, options: nil)
          addSubview(containerView)
          containerView.frame = self.bounds
          containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
      }
      
}

