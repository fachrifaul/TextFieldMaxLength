//
//  TextField.swift
//  Allowed+Banned Chars Text Fields
//
//  Created by Joey deVilla on 5/23/16.
//  MIT license. See the end of this file for the gory details.
//
//  Accompanies the article in Global Nerdy (http://globalnerdy.com):
//  "A better way to program iOS text fields that have maximum lengths and accept or reject specific characters"
//  http://www.globalnerdy.com/2016/05/24/a-better-way-to-program-ios-text-fields-that-have-maximum-lengths-and-accept-or-reject-specific-characters/
//
// Derived from a solution in Stack Overflow (http://stackoverflow.com)
// posted by "Frouo" on April 22, 2015:
// http://stackoverflow.com/questions/433337/set-the-maximum-character-length-of-a-uitextfield/29804183#29804183


import UIKit

private var maxLengths = [UITextField: Int]()

extension UITextField {
  
  @IBInspectable var maxLength: Int {
    get {
      guard let length = maxLengths[self] else {
        return Int.max
      }
      return length
    }
    set {
      maxLengths[self] = newValue
      // Any text field with a set max length will call the limitLength
      // method any time it's edited (i.e. when the user adds, removes,
      // cuts, or pastes characters to/from the text field).
      addTarget(
        self,
        action: #selector(limitLength),
        for: UIControlEvents.editingChanged
      )
    }
  }
  
  func limitLength(_ textField: UITextField) {
    guard let prospectiveText = textField.text, prospectiveText.characters.count > maxLength else {
        return
    }
    
    // If the change in the text field's contents will exceed its maximum length,
    // allow only the first [maxLength] characters of the resulting text.
    let selection = selectedTextRange
    text = prospectiveText.substring(
      with: Range<String.Index>(prospectiveText.startIndex ..< prospectiveText.characters.index(prospectiveText.startIndex, offsetBy: maxLength))
    )
    selectedTextRange = selection
  }
  
}


// This code is released under the MIT license.
// Simply put, you're free to use this in your own projects, both
// personal and commercial, as long as you include the copyright notice below.
// It would be nice if you mentioned my name somewhere in your documentation
// or credits.
//
// MIT LICENSE
// -----------
// (As defined in https://opensource.org/licenses/MIT)
//
// Copyright © 2016 Joey deVilla. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation
// the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom
// the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
// OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
// DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
// TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
// OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
