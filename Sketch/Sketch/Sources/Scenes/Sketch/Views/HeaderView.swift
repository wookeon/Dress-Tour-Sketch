//
//  HeaderView.swift
//  Sketch
//
//  Created by ernie on 2023/01/18.
//

import UIKit

import SnapKit


final class HeaderView: UIView {
    
    private let settingToggleButton = UIButton().then {
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 4
        $0.layer.masksToBounds = true
        $0.setTitle("Settings", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
    }
    
    private let toolsControl = UISegmentedControl(
        items: ["Pen", "Marker", "Eraser", "Highlighter"]
    ).then {
        $0.selectedSegmentIndex = 0
    }
    
    private let resetButton = UIButton().then {
        $0.backgroundColor = .systemGray5
        $0.layer.cornerRadius = 4
        $0.layer.masksToBounds = true
        $0.setTitle("Reset", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            self.setConstraintsForPad()
        case .phone:
            self.setConstraintsForPhone()
        default:
            break
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setup() {
        self.addSubview(self.settingToggleButton)
        self.addSubview(self.toolsControl)
        self.addSubview(self.resetButton)
    }
    
    private func setConstraintsForPad() {
        self.settingToggleButton.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-12)
            make.leading.equalToSuperview().offset(15)
            make.width.equalTo(100)
        }
        
        self.toolsControl.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-12)
            make.leading.equalTo(self.settingToggleButton.snp.trailing).offset(24)
        }
        
        self.resetButton.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-12)
            make.leading.equalTo(self.toolsControl.snp.trailing).offset(24)
            make.trailing.equalToSuperview().offset(-15)
            make.width.equalTo(100)
        }
    }
    
    private func setConstraintsForPhone() {
        self.settingToggleButton.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(15)
            make.width.equalTo(100)
        }
        
        self.toolsControl.snp.remakeConstraints { make in
            make.top.equalTo(self.settingToggleButton.snp.bottom).offset(12)
            make.bottom.equalToSuperview().offset(-12)
            make.leading.equalTo(self.settingToggleButton.snp.leading)
            make.trailing.equalToSuperview().offset(-15)
        }
        
        self.resetButton.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.bottom.equalTo(self.settingToggleButton.snp.bottom)
            make.trailing.equalToSuperview().offset(-15)
            make.width.equalTo(100)
        }
    }
}


#if DEBUG
import SwiftUI


struct HeaderViewPreview: PreviewProvider {
    
    static var previews: some View {
        UIViewPreview {
            HeaderView()
        }
        .previewLayout(
            .sizeThatFits
        )
    }
}
#endif
