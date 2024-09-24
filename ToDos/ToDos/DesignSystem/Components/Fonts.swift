//
//  Fonts.swift
//  ToDos
//
//  Created by Artur Akulich on 22.09.24.
//

import UIKit

public extension UIFont {
    
    enum InstalledFonts {
        enum FontType {
            enum SFProDisplay: String {
                case medium = "SFProDisplay-Medium"
            }
            enum IBMplexSans: String {
                case medium = "IBMPlexSans-Medium"
                case bold = "IBMPlexSans-Bold"
            }
        }
        
        enum FontSize: CGFloat {
            case footnote = 14.0
            case subheadline = 15.0
            case body = 17.0
            case title = 20.0
        }
    }
    
    static func customFont(_ name: String,_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: name, size: size) {
            return font
        } else {
            assertionFailure("Failed to create UIFont with name: \(name), size: \(size)")
            return .systemFont(ofSize: size)
        }
    }
    
    static func footnoteRegular() -> UIFont {
        customFont(
            InstalledFonts.FontType.IBMplexSans.medium.rawValue,
            InstalledFonts.FontSize.footnote.rawValue
        )
    }
    
    static func footnoteButton() -> UIFont {
        customFont(
            InstalledFonts.FontType.SFProDisplay.medium.rawValue,
            InstalledFonts.FontSize.footnote.rawValue
        )
    }
    
    static func subheadline() -> UIFont {
        customFont(
            InstalledFonts.FontType.IBMplexSans.medium.rawValue,
            InstalledFonts.FontSize.subheadline.rawValue
        )
    }
    
    static func body() -> UIFont {
        customFont(
            InstalledFonts.FontType.IBMplexSans.medium.rawValue,
            InstalledFonts.FontSize.body.rawValue
        )
    }
    
    static func title() -> UIFont {
        customFont(
            InstalledFonts.FontType.IBMplexSans.bold.rawValue,
            InstalledFonts.FontSize.title.rawValue
        )
    }
}

public extension UIFont {
    static func registerFonts() {
        guard let fontFileURLs = Bundle.main.urls(forResourcesWithExtension: "otf", subdirectory: nil) else {
            print("Error: Font folder not found.")
            return
        }
        
        for fontURL in fontFileURLs {
            var error: Unmanaged<CFError>?
            if !CTFontManagerRegisterFontsForURL(fontURL as CFURL, .none, &error) {
                let fontError = error?.takeRetainedValue() as Error?
                print("Failed to register font '\(fontURL.lastPathComponent)': \(fontError?.localizedDescription ?? "Unknown error")")
            } else {
                print("Successfully registered font '\(fontURL.lastPathComponent)'")
            }
        }
    }
}
