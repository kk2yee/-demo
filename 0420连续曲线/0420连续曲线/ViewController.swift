//
//  ViewController.swift
//  0420连续曲线
//
//  Created by 尹绪坤(YINXUKUN137) on 2018/4/20.
//  Copyright © 2018年 尹绪坤(YINXUKUN137). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countSlider: UISlider!
    @IBOutlet weak var waveRangeSlider: UISlider!
    
    let curve = CurveView(frame: UIScreen.main.bounds)
    
    @IBAction func countSliderAction(_ sender: UISlider) {
        curve.pointCount = Int(sender.value)
        curve.setNeedsDisplay()
    }
    
   
    @IBAction func waveRangeSliderAction(_ sender: UISlider) {
        curve.waveRange = Int(sender.value)
        curve.setNeedsDisplay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.insertSubview(curve, at: 0)
        
        countSlider.minimumValue = 0
        countSlider.maximumValue = 200
        countSlider.setValue(5, animated: false)
        
        waveRangeSlider.minimumValue = 50.0
        waveRangeSlider.maximumValue = 500.0
        waveRangeSlider.setValue(50, animated: false)
    
    }
}







