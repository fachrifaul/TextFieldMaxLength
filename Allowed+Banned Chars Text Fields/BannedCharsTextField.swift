//
//  BannedCharsTextField.swift
//  Allowed+Banned Chars Text Fields
//
//  Created by Joey deVilla on 5/23/16.
//  MIT license. See the end of this file for the gory details.
//
//  Accompanies the article in Global Nerdy (http://globalnerdy.com):
//  "A better way to program iOS text fields that have maximum lengths and accept or reject specific characters"
//  http://www.globalnerdy.com/2016/05/24/a-better-way-to-program-ios-text-fields-that-have-maximum-lengths-and-accept-or-reject-specific-characters/


import UIKit

class BannedCharsTextField: UITextField, UITextFieldDelegate {
  
  @IBInspectable var bannedChars: String = ""
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    delegate = self
    autocorrectionType = .no
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard string.characters.count > 0 else {
      return true
    }
    
    let currentText = textField.text ?? ""
    let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: string)
    return prospectiveText.doesNotContainCharactersIn(bannedChars)
  }
  
}


extension String {
  
  // Returns true if the string has no characters in common with matchCharacters.
  func doesNotContainCharactersIn(_ matchCharacters: String) -> Bool {
    let characterSet = CharacterSet(charactersIn: matchCharacters)
    return self.rangeOfCharacter(from: characterSet) == nil
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
