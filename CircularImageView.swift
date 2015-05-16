//
//  CircularImageView.swift
//  Facebook Groups
//
//  Created by Andrew Breckenridge on 5/16/15.
//  Copyright (c) 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class CircularImageView: UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = self.frame.height / 2
    }
}
