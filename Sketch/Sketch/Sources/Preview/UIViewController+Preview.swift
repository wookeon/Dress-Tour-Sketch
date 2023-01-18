//
//  UIViewController+Preview.swift
//  Sketch
//
//  Created by ernie on 2023/01/18.
//

#if DEBUG
import SwiftUI
import UIKit


extension UIViewController {
    
    private struct Preview: UIViewControllerRepresentable {
        
        let viewController: UIViewController
        
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }
    
    func toPreview() -> some View {
        Preview(viewController: self)
    }
}

struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    
    let viewController: ViewController
    
    
    init(_ builder: @escaping () -> ViewController) {
        self.viewController = builder()
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        return self.viewController
    }
    
    func updateUIViewController(
        _ uiViewController: UIViewController,
        context: UIViewControllerRepresentableContext<UIViewControllerPreview<ViewController>>
    ) {
        return
    }
}
#endif
