//
//  customCallOut.swift
//  MasryTester
//
//  Created by Approcks Mac Mini on 1/31/17.
//  Copyright © 2017 Approcks. All rights reserved.
//

import UIKit

/**
 
 ## customDesOut class ##
 
 This class is responsible for displaying user destination location pin on map
 
 */

class customDesOut: UIView {

    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var bkView: UIView!
    
   
    @IBOutlet weak var deslb: UILabel!
    
    @IBOutlet weak var numKilolb: UILabel!
    
    @IBOutlet weak var kmlb: UILabel!
    
    @IBOutlet weak var leftView: UIView!
    
    override func awakeFromNib() {
        
        bkView.layer.cornerRadius = bkView.bounds.size.height/2
        
        leftView.layer.cornerRadius = leftView.bounds.size.height/2
                
        self.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        
        self.isOpaque=false
        
        self.kmlb.text = NSLocalizedString("maKilo", comment:"")
        
    }
    
    @IBAction func btnClicked(_ sender: Any) {
        
        print("jcbhasjbchjasvcajshbvcxjashca")
        
        
        
    }
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
    
        
        
    }
    

}
