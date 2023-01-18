//
//  SettingView.swift
//  Sketch
//
//  Created by ernie on 2023/01/17.
//

import Foundation
import UIKit

import SnapKit


final class SettingView: UIView {
    
    private let pressureVSVelocityControl = UISegmentedControl(
        items: ["Pressure", "Velocity"]
    ).then {
        $0.selectedSegmentIndex = 0
    }
    
    private let colorStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 10
    }
    private let blackButton = UIButton().then {
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 4
        $0.layer.masksToBounds = true
    }
    private let redButton = UIButton().then {
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 4
        $0.layer.masksToBounds = true
    }
    private let greenButton = UIButton().then {
        $0.backgroundColor = .green
        $0.layer.cornerRadius = 4
        $0.layer.masksToBounds = true
    }
    private let blueButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 4
        $0.layer.masksToBounds = true
    }
    
    private let minAlphaTitleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15, weight: .regular)
        $0.text = "Min Alpha:"
        $0.textAlignment = .left
        $0.textColor = .black
    }
    private let minAlphaValueLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15, weight: .heavy)
        $0.text = "0.0"
        $0.textAlignment = .left
        $0.textColor = .black
    }
    private let minAlphaControl = UISegmentedControl(
        items: ["-0.1", "-0.01", "+0.01", "+0.1"]
    )
    
    private let maxAlphaTitleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15, weight: .regular)
        $0.text = "Max Alpha:"
        $0.textAlignment = .left
        $0.textColor = .black
    }
    private let maxAlphaValueLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15, weight: .heavy)
        $0.text = "1.0"
        $0.textAlignment = .left
        $0.textColor = .black
    }
    private let maxAlphaControl = UISegmentedControl(
        items: ["-0.1", "-0.01", "+0.01", "+0.1"]
    )
    
    private let minWidthTitleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15, weight: .regular)
        $0.text = "Min Width:"
        $0.textAlignment = .left
        $0.textColor = .black
    }
    private let minWidthValueLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15, weight: .heavy)
        $0.text = "0.0"
        $0.textAlignment = .left
        $0.textColor = .black
    }
    private let minWidthControl = UISegmentedControl(
        items: ["-5.0", "-1.0", "+1.0", "+5.0"]
    )
    
    private let maxWidthTitleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15, weight: .regular)
        $0.text = "Max Width:"
        $0.textAlignment = .left
        $0.textColor = .black
    }
    private let maxWidthValueLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15, weight: .heavy)
        $0.text = "10.0"
        $0.textAlignment = .left
        $0.textColor = .black
    }
    private let maxWidthControl = UISegmentedControl(
        items: ["-5.0", "-1.0", "+1.0", "+5.0"]
    )
    
    
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
        self.backgroundColor = .systemGray5
        
        self.addSubview(self.pressureVSVelocityControl)
        
        self.addSubview(self.colorStackView)
        self.colorStackView.addArrangedSubview(self.blackButton)
        self.colorStackView.addArrangedSubview(self.redButton)
        self.colorStackView.addArrangedSubview(self.greenButton)
        self.colorStackView.addArrangedSubview(self.blueButton)
        
        self.addSubview(self.minAlphaTitleLabel)
        self.addSubview(self.minAlphaValueLabel)
        self.addSubview(self.minAlphaControl)
        
        self.addSubview(self.maxAlphaTitleLabel)
        self.addSubview(self.maxAlphaValueLabel)
        self.addSubview(self.maxAlphaControl)
        
        self.addSubview(self.minWidthTitleLabel)
        self.addSubview(self.minWidthValueLabel)
        self.addSubview(self.minWidthControl)
        
        self.addSubview(self.maxWidthTitleLabel)
        self.addSubview(self.maxWidthValueLabel)
        self.addSubview(self.maxWidthControl)
    }
    
    private func setConstraintsForPad() {
        self.pressureVSVelocityControl.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(15)
        }
        
        self.colorStackView.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalTo(self.pressureVSVelocityControl.snp.trailing).offset(22)
        }
        [self.blackButton, self.redButton, self.greenButton, self.blueButton].forEach {
            $0.snp.remakeConstraints { make in
                make.size.equalTo(32)
            }
        }
        
        self.minAlphaTitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(self.pressureVSVelocityControl.snp.bottom).offset(31)
            make.leading.equalToSuperview().offset(15)
        }
        self.minAlphaValueLabel.snp.remakeConstraints { make in
            make.top.equalTo(self.minAlphaTitleLabel.snp.top)
            make.leading.equalTo(self.minAlphaTitleLabel.snp.trailing).offset(4)
        }
        self.minAlphaControl.snp.remakeConstraints { make in
            make.top.equalTo(self.minAlphaTitleLabel.snp.bottom).offset(8)
            make.leading.equalTo(self.minAlphaTitleLabel.snp.leading)
        }
        
        self.maxAlphaTitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(self.minAlphaTitleLabel.snp.top)
            make.leading.equalTo(self.minAlphaControl.snp.trailing).offset(24)
        }
        self.maxAlphaValueLabel.snp.remakeConstraints { make in
            make.top.equalTo(self.maxAlphaTitleLabel.snp.top)
            make.leading.equalTo(self.maxAlphaTitleLabel.snp.trailing).offset(4)
        }
        self.maxAlphaControl.snp.remakeConstraints { make in
            make.top.equalTo(self.maxAlphaTitleLabel.snp.bottom).offset(8)
            make.leading.equalTo(self.maxAlphaTitleLabel.snp.leading)
        }
        
        self.minWidthTitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(self.minAlphaControl.snp.bottom).offset(31)
            make.leading.equalTo(self.minAlphaTitleLabel.snp.leading)
        }
        self.minWidthValueLabel.snp.remakeConstraints { make in
            make.top.equalTo(self.minWidthTitleLabel.snp.top)
            make.leading.equalTo(self.minWidthTitleLabel.snp.trailing).offset(4)
        }
        self.minWidthControl.snp.remakeConstraints { make in
            make.top.equalTo(self.minWidthTitleLabel.snp.bottom).offset(8)
            make.bottom.equalToSuperview().offset(-20)
            make.leading.equalTo(self.minWidthTitleLabel.snp.leading)
        }
        
        self.maxWidthTitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(self.minWidthTitleLabel.snp.top)
            make.leading.equalTo(self.minAlphaControl.snp.trailing).offset(24)
        }
        self.maxWidthValueLabel.snp.remakeConstraints { make in
            make.top.equalTo(self.minWidthTitleLabel.snp.top)
            make.leading.equalTo(self.maxWidthTitleLabel.snp.trailing).offset(4)
        }
        self.maxWidthControl.snp.remakeConstraints { make in
            make.top.equalTo(self.maxWidthTitleLabel.snp.bottom).offset(8)
            make.bottom.equalToSuperview().offset(-20)
            make.leading.equalTo(self.maxWidthTitleLabel.snp.leading)
        }
    }
    
    private func setConstraintsForPhone() {
        self.pressureVSVelocityControl.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(15)
        }
        
        self.colorStackView.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalTo(self.pressureVSVelocityControl.snp.trailing).offset(22)
        }
        [self.blackButton, self.redButton, self.greenButton, self.blueButton].forEach {
            $0.snp.remakeConstraints { make in
                make.size.equalTo(32)
            }
        }
        
        self.minAlphaTitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(self.pressureVSVelocityControl.snp.bottom).offset(31)
            make.leading.equalToSuperview().offset(15)
        }
        self.minAlphaValueLabel.snp.remakeConstraints { make in
            make.top.equalTo(self.minAlphaTitleLabel.snp.top)
            make.leading.equalTo(self.minAlphaTitleLabel.snp.trailing).offset(4)
        }
        self.minAlphaControl.snp.remakeConstraints { make in
            make.top.equalTo(self.minAlphaTitleLabel.snp.bottom).offset(8)
            make.leading.equalTo(self.minAlphaTitleLabel.snp.leading)
        }
        
        self.maxAlphaTitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(self.minAlphaControl.snp.bottom).offset(31)
            make.leading.equalTo(self.minAlphaTitleLabel.snp.leading)
        }
        self.maxAlphaValueLabel.snp.remakeConstraints { make in
            make.top.equalTo(self.maxAlphaTitleLabel.snp.top)
            make.leading.equalTo(self.maxAlphaTitleLabel.snp.trailing).offset(4)
        }
        self.maxAlphaControl.snp.remakeConstraints { make in
            make.top.equalTo(self.maxAlphaTitleLabel.snp.bottom).offset(8)
            make.leading.equalTo(self.maxAlphaTitleLabel.snp.leading)
        }
        
        self.minWidthTitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(self.maxAlphaControl.snp.bottom).offset(31)
            make.leading.equalTo(self.minAlphaTitleLabel.snp.leading)
        }
        self.minWidthValueLabel.snp.remakeConstraints { make in
            make.top.equalTo(self.minWidthTitleLabel.snp.top)
            make.leading.equalTo(self.minWidthTitleLabel.snp.trailing).offset(4)
        }
        self.minWidthControl.snp.remakeConstraints { make in
            make.top.equalTo(self.minWidthTitleLabel.snp.bottom).offset(8)
            make.leading.equalTo(self.minWidthTitleLabel.snp.leading)
        }
        
        self.maxWidthTitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(self.minWidthControl.snp.bottom).offset(31)
            make.leading.equalTo(self.minAlphaTitleLabel.snp.leading)
        }
        self.maxWidthValueLabel.snp.remakeConstraints { make in
            make.top.equalTo(self.maxWidthTitleLabel.snp.top)
            make.leading.equalTo(self.maxWidthTitleLabel.snp.trailing).offset(4)
        }
        self.maxWidthControl.snp.remakeConstraints { make in
            make.top.equalTo(self.maxWidthTitleLabel.snp.bottom).offset(8)
            make.bottom.equalToSuperview().offset(-20)
            make.leading.equalTo(self.maxWidthTitleLabel.snp.leading)
        }
    }
}

#if DEBUG
import SwiftUI


struct SettingViewPreview: PreviewProvider {
    
    static var previews: some View {
        UIViewPreview {
            SettingView()
        }
        .previewLayout(
            .sizeThatFits
        )
    }
}
#endif
