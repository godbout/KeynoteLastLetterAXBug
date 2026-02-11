//
//  ContentView.swift
//  KeynoteLastLetterAXBug
//
//  Created by Guillaume Leclerc on 11/02/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("select first letter") {
                sleep(3)
                
                guard
                    let numberOfCharacters = focusedElementNumberOfCharacters(),
                    numberOfCharacters > 0
                else {
                    return
                }
                    
                let axSystemWideElement = AXUIElementCreateSystemWide()
                var axFocusedElement: AnyObject?
                guard
                    AXUIElementCopyAttributeValue(axSystemWideElement, kAXFocusedUIElementAttribute as CFString, &axFocusedElement) == .success,
                    let axFocusedElement = axFocusedElement
                else {
                    return
                }

                var selectedTextRange = CFRange()
                selectedTextRange.location = 0
                selectedTextRange.length = 1
                
                guard let newValue = AXValueCreate(.cfRange, &selectedTextRange) else { return }
                guard AXUIElementSetAttributeValue(axFocusedElement as! AXUIElement, kAXSelectedTextRangeAttribute as CFString, newValue) == .success else { return }
            }
            Button("select letter before last") {
                sleep(3)
                
                guard
                    let numberOfCharacters = focusedElementNumberOfCharacters(),
                    numberOfCharacters > 1
                else {
                    return
                }
                    
                let axSystemWideElement = AXUIElementCreateSystemWide()
                var axFocusedElement: AnyObject?
                guard
                    AXUIElementCopyAttributeValue(axSystemWideElement, kAXFocusedUIElementAttribute as CFString, &axFocusedElement) == .success,
                    let axFocusedElement = axFocusedElement
                else {
                    return
                }

                var selectedTextRange = CFRange()
                selectedTextRange.location = numberOfCharacters - 2
                selectedTextRange.length = 1
                
                guard let newValue = AXValueCreate(.cfRange, &selectedTextRange) else { return }
                guard AXUIElementSetAttributeValue(axFocusedElement as! AXUIElement, kAXSelectedTextRangeAttribute as CFString, newValue) == .success else { return }
            }
            Button("select last letter") {
                sleep(3)
                
                guard
                    let numberOfCharacters = focusedElementNumberOfCharacters(),
                    numberOfCharacters > 1
                else {
                    return
                }
                    
                let axSystemWideElement = AXUIElementCreateSystemWide()
                var axFocusedElement: AnyObject?
                guard
                    AXUIElementCopyAttributeValue(axSystemWideElement, kAXFocusedUIElementAttribute as CFString, &axFocusedElement) == .success,
                    let axFocusedElement = axFocusedElement
                else {
                    return
                }

                var selectedTextRange = CFRange()
                selectedTextRange.location = numberOfCharacters - 1
                selectedTextRange.length = 1
                
                guard let newValue = AXValueCreate(.cfRange, &selectedTextRange) else { return }
                guard AXUIElementSetAttributeValue(axFocusedElement as! AXUIElement, kAXSelectedTextRangeAttribute as CFString, newValue) == .success else { return }
            }
        }
        .padding()
    }
    
    private func focusedElementNumberOfCharacters() -> Int? {
        let axSystemWideElement = AXUIElementCreateSystemWide()
    
        var axFocusedElement: AnyObject?
        guard AXUIElementCopyAttributeValue(axSystemWideElement, kAXFocusedUIElementAttribute as CFString, &axFocusedElement) == .success else { return nil }
        guard let axFocusedElement = axFocusedElement else { return nil }
        
        var axNumberOfCharacters: AnyObject?
        guard AXUIElementCopyAttributeValue(axFocusedElement as! AXUIElement, kAXNumberOfCharactersAttribute as CFString, &axNumberOfCharacters) == .success else { return nil }
        
        return axNumberOfCharacters as? Int
    }
}

#Preview {
    ContentView()
}
