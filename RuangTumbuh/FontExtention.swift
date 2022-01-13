//
//  FontExtention.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 20/11/21.
//

import UIKit
extension UIFont {

    func withTraits(traits:UIFontDescriptor.SymbolicTraits...) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits)) else { return UIFont() }
        return UIFont(descriptor: descriptor, size: 0)
    }

    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }

    func italic() -> UIFont {
        return withTraits(traits: .traitItalic)
    }

    func boldItalic() -> UIFont {
        return withTraits(traits: .traitBold,.traitItalic)
    }

}
