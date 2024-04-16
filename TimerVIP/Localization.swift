//
//  Localization.swift
//  CustomizeTimer
//
//  Created by D_K on 17.12.2023.
//

import UIKit

typealias L = Localization

struct Localization {
    
    enum LocalKeys: String {
        // MARK: - General
        case time_hour_long
        case time_hours_long
        case time_hours_short
        case time_min_short
        case time_sec_short
        case clear_all_btn

        // MARK: - Tabs
        case timer_tab_bar
        case custom_tab_bar
        case stopwatch_tab_bar
        case settings_tab_bar

        // MARK: - Default Timer
        case default_timer_title
        case default_timer_recent
        case default_timer_active


        
    }
    
    static func text(_ key: LocalKeys) -> String {
        return NSLocalizedString(key.rawValue, comment: "")
    }
    
    static func text(_ key: LocalKeys, attrs: [String: Any]) -> String {
        let string = text(key)
        return replaceAttrs(string, attrs: attrs) ?? key.rawValue
    }
    
    private static func replaceAttrs(_ text: String?, attrs: [String: Any]) -> String? {
        var string = text
        for (key, value) in attrs {
            let keyText = "{\(key)}"
            let replacementText = String(describing: value)
            string = string?.replacingOccurrences(of: keyText, with: replacementText)
        }
        return string
    }
}

extension UILabel {

    @IBInspectable public var localizationKey: String {
        set(newValue) {
            accessibilityIdentifier = newValue
            updateTitle()
        }
        get {
            return accessibilityIdentifier ?? ""
        }
    }

    public func updateTitle() {
        if let locKey = L.LocalKeys(rawValue: localizationKey) {
            text = L.text(locKey)
        }
    }

}

extension UIButton {
    
    @IBInspectable public var localizationKey: String {
        set(newValue) {
            accessibilityIdentifier = newValue
            updateTitle()
        }
        get {
            return accessibilityIdentifier ?? ""
        }
    }
    
    public func updateTitle() {
        if let locKey = L.LocalKeys(rawValue: localizationKey) {
            setTitle(
                L.text(locKey),
                for: UIControl.State()
            )
        }
    }
}
