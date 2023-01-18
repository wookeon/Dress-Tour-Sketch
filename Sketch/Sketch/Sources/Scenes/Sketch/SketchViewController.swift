//
//  SketchViewController.swift
//  Sketch
//
//  Created by ernie on 2023/01/17.
//

import UIKit

import SnapKit


class SketchViewController: UIViewController {
    
    private let settingView = SettingView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
        self.setConstraints()
    }
    
    private func setup() {
        self.view.addSubview(self.settingView)
    }
    
    private func setConstraints() {
        self.settingView.snp.remakeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }
    }
}

#if DEBUG
import SwiftUI


struct SketchViewControllerPreview: PreviewProvider {
    
    static var previews: some View {
        SketchViewController().toPreview()
    }
}
#endif
