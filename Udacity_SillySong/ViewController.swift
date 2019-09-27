//
//  ViewController.swift
//  Udacity_SillySong
//
//  Created by Andrew Hearst on 7/30/19.
//  Copyright © 2019 Andrew Hearst. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsField.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        lyricsField.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: String(nameField.text!) )
        print(String(lyricsField.text!))
    }
    
}


let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func shortNameForName(name: String) -> String {
    let lowercaseName = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    if let nameRange = lowercaseName.rangeOfCharacter(from: vowelSet) {
        return lowercaseName.substring(from: nameRange.lowerBound)
    }
    return lowercaseName
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    let shortName = shortNameForName(name: fullName)
    
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}
