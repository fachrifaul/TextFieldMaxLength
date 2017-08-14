//
//  ViewController.swift
//  Allowed+Banned Chars Text Fields
//
//  Created by Joey deVilla on 5/23/16.
//  MIT license. See the end of this file for the gory details.
//
//  Accompanies the article in Global Nerdy (http://globalnerdy.com):
//  "A better way to program iOS text fields that have maximum lengths and accept or reject specific characters"
//  http://www.globalnerdy.com/2016/05/24/a-better-way-to-program-ios-text-fields-that-have-maximum-lengths-and-accept-or-reject-specific-characters/


import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var freakyTextField: AllowedCharsTextField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    // freakyTextField has a 10-character limit and
    // accepts only characters from the word "freaky".
    freakyTextField.maxLength = 10
    freakyTextField.allowedChars = "freaky"
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // Tapping on the view should dismiss the keyboard.
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
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

