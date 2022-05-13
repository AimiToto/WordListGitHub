//
//  AddViewController.swift
//  WordList
//
//  Created by Aimi on 2022/05/13.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    var wordArray: [Dictionary<String, String>] = []
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        if saveData.array(forKey: "WORD") != nil {
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveWord() {
        let etext:String  = (englishTextField.text)!
        let jtext:String = (japaneseTextField.text)!
        if !etext.isEmpty && !jtext.isEmpty {
        let wordDictionary = ["english": englishTextField.text!, "japanese": japaneseTextField.text!]
        wordArray.append(wordDictionary)
        saveData.set(wordArray, forKey: "WORD")
        
        let alert = UIAlertController(
            title: "保存完了",
            message: "単語の登録が完了しました",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        ))
        present(alert, animated: true, completion: nil)
        englishTextField.text = ""
        japaneseTextField.text = ""
        } else {
        let nalert = UIAlertController(
            title: "保存できませんでした",
            message: "正しく入力してください",
            preferredStyle: .alert
        )
        nalert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        ))
        present(nalert, animated: true, completion: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
