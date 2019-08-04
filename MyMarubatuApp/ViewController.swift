//
//  ViewController.swift
//  MyMarubatuApp
//
//  Created by VERTEX24 on 2019/08/03.
//  Copyright © 2019 VERTEX24. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // クイズの問題を表示するとこ
    @IBOutlet weak var questionLabel: UILabel!
    
    // 現在のクイズの番号を管理する
    var questionNum: Int = 0
    
    // ヒント使える回数
    var hintCount: Bool = true
    
    let questions: [[String: Any]] = [
        ["question": "iphoneアプリを開発する言語はZcodeである",
         "answer": false
        ],
        ["question": "Xcode画面の右側にはユーティリティーズがある",
         "answer": true
        ],
        ["question": "UILableは文字列を表示する際に利用する",
         "answer": true
        ],
        ["question": "ドラえもんは常に浮いている",
         "answer": true
        ],
    ]
    
    
    // 正解数を数える変数
    var ansCount: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }
    
    // 回答をチェックする関数
    // 次の問題を表示する
    func checkAnswer(yourAnswer: Bool) {
        // どの問題か算出する
        let question = questions[questionNum]
        
        // 問題の答えを取り出す
        if let ans = question["answer"] as? Bool {
            
            if questionNum < questions.count  - 1 {
                
                // 選択された答えと問題の答えを比較
                if yourAnswer == ans{
                    // 正解
                    // questionNumに1足して次の問題へ
                    questionNum += 1
                    // 正解数のみカウント
                    ansCount += 1
                    showAlert(message: "正解")
                    
                }
                else{
                    // 不正解
                    showAlert(message: "不正解")
                    // 間違えても次の問題へ
                    questionNum += 1
                    
                }
            }
            else{
                showAlert(message: "\(questions.count)問中\(ansCount)問正解しました")
                questionNum = 0
                ansCount = 0
                hintCount = true
                
            }
            
        }
        else{
            print("何も入っていません ")
            return
        }
        // questionNumの値が問題数以上になったとき最初の問題に戻る
        if questionNum >= questions.count{
            questionNum = 0
            
            
        }
        // 次の問題を表示する
        // 正解であれば次の問題が、不正解ならば同じ問題が再表示される
        showQuestion()
    }
    
    // 問題を表示する関数
    func showQuestion(){
        // questionNumの問題を取得
        let question = questions[questionNum]
        
        // 問題からKeyを指定して内容を取得
        if let que = question["question"] as? String{
            // questionKeyのなかをlabelに代入
            questionLabel.text = que
        }
    }
    
    // アラートを表示する
    func showAlert(message: String){
        // アラートの作成
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        // アラートのアクション(ボタン部分の定義)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        // 作成したalertに閉じるボタンを追加
        alert.addAction(close)
        // アラートを表示
        present(alert, animated: true, completion: nil)
    }
    
    
    
    // ☓のボタン
    @IBAction func batuButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: false)
    }
    
    // ◯のボタン
    @IBAction func maruButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: true)
    }
    
    // ヒントボタン
    @IBAction func hintButton(_ sender: UIButton) {
        let question = questions[questionNum]
        
        if hintCount {
            
            if let hint = question["answer"] as? Bool {
                if hint {
                    showAlert(message: "◯です")
                }
                else{
                    showAlert(message: "✕です")
                }
                hintCount = false
            }
        }
        else{
            showAlert(message: "すでに使ってます")
        }
    }
}


