//
//  UIView+Preview.swift
//  Sketch
//
//  Created by ernie on 2023/01/18.
//

#if DEBUG
import SwiftUI


struct UIViewPreview<View: UIView>: UIViewRepresentable {
    
    let view: View
    
    
    init(_ builder: @escaping () -> View) {
        self.view = builder()
    }

    func makeUIView(context: Context) -> UIView {
        return self.view
    }
    
    func updateUIView(_ view: UIView, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}
#endif
