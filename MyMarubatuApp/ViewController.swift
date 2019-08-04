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
    
    let questions: [[String: Any]] = [
        ["question": "iphoneアプリを開発する言語はZcodeである",
         "anser": false
        ],
        ["question": "Xcode画面の右側にはユーティリティーズがある",
        "anser": true
        ],
        ["question": "UILableは文字列を表示する際に利用する",
         "anser": true
        ],
        ["question": "ドラえもんは常に浮いている",
         "anser": true
        ],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // ☓のボタン
    @IBAction func batuButton(_ sender: Any) {
        
    }
    
    // ◯のボタン
    @IBAction func maruButton(_ sender: Any) {
        
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
    
}

