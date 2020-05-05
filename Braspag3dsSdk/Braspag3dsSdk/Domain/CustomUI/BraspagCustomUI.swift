//
//  BraspagCustomUI.swift
//  Braspag3dsSdk
//
//  Created by Jeferson Nazario on 05/05/20.
//  Copyright © 2020 jnazario.com. All rights reserved.
//

import Foundation
import CardinalMobile

/// Customizable UI
open class BraspagCustomUi: UiCustomization {
    public func setButton(_ customButton: BraspagCustomButton, buttonType: CustomButtonType) {
        self.setButton(customButton, buttonTypeString: buttonType.rawValue)
    }
}

/// Customizable proprierties:
/// headerText, backgroundColor, buttonText, textFontName, textColor, textFontSize
open class BraspagCustomToolbar: ToolbarCustomization {}

/// Customizable proprierties:
/// backgroundColor, cornerRadius, textFontName, textColor, textFontSize
open class BraspagCustomButton: ButtonCustomization {}

/// Customizable proprierties:
/// textFontName, textColor, textFontSize, headingTextColor, headingTextFontName, headingTextFontSize
open class BraspagCustomLabel: LabelCustomization {}

/// Customizable proprierties:
/// textFontName, textColor, textFontSize, borderWidth, borderColor, cornerRadius
open class BraspsagCustomTextBox: TextBoxCustomization {}

public enum CustomButtonType: String {
    /**ButtonTypeVerify Verify button.*/
    case buttonTypeVerify = "ButtonTypeVerify"
    
    /**ButtonTypeContinue Continue button.*/
    case buttonTypeContinue = "ButtonTypeContinue"
    
    /**ButtonTypeNext Next button.*/
    case buttonTypeNext = "ButtonTypeNext"
    
    /**ButtonTypeCancel Cancel button.*/
    case buttonTypeCancel = "ButtonTypeCancel"
    
    /**ButtonTypeResend Resend button.*/
    case buttonTypeResend = "ButtonTypeResend"
}
