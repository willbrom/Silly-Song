//
//  ViewController.swift
//  Silly Song
//
//  Created by Ali Sajid on 30/07/1439 AH.
//  Copyright © 1439 Ali Sajid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        if nameField.text != "" {
            let name = nameField.text!
            let lyrics = lyricsForName(lyricsTemplate: bananaFanaTemplate, fulName: name)
            lyricsView.text = lyrics
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

func shortNameForName(name: String) -> String {
    var lowercaseName = name.lowercased()
    lowercaseName.remove(at: lowercaseName.startIndex)
    return lowercaseName
}

func lyricsForName(lyricsTemplate: String, fulName: String) -> String {
    let lyricsToReturn = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fulName).replacingOccurrences(of: "<SHORT_NAME>", with: shortNameForName(name: fulName))
    return lyricsToReturn
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")
