//
//  10ques ViewController.swift
//  hw7
//
//  Created by heroshi on 2016/12/4.
//  Copyright © 2016年 heroshi. All rights reserved.
//

import UIKit

class _0ques_ViewController: UIViewController {
    
    @IBOutlet weak var questionNoLabel: UILabel! //第幾題
    var ansArrayNo = 0  //第幾題的答案
    var QNAarrayNo = 0 //第幾個array

    @IBOutlet weak var gradelabel: UILabel!
    
    @IBOutlet weak var pictureview: UIImageView!
    
    var quesNo:Int = 1 //還沒按的時候,表示題號
    @IBOutlet weak var ques: UILabel! //問題
    
    @IBOutlet weak var showans: UILabel!  //秀答案
    
    struct QNA {
        var Ques = ""
        var Ans = ""
        var picture = UIImage(named:"1012")
    }
    
    
    /*顯示答案
    @IBAction func answering(_ sender: Any) {
        

        ansArrayNo += 1 //顯示第幾題答案
        if ansArrayNo > quesNo - 1 {
            showans.text = "這是國防布" //防止一開始就偷看答案
            ansArrayNo = quesNo - 1
            
            switch quesNo {
            case 10:
                quesNo = 1//起始次數=1
            default:
                quesNo = quesNo + 1
            }
            
            switch QNAarrayNo {
            case 10:
                quesNo = 1//起始次數=1
            default:
                quesNo = quesNo + 1
            }
            
            switch ansArrayNo {
            case 10:
                quesNo = 1//起始次數=1
            default:
                quesNo = quesNo + 1
            }
        }
        else{
            cbtn.isHidden = true
            bbtn.isHidden = true
            abtn.isHidden = true
            dbtn.isHidden = true
            pictureview.isHidden = false
            showans.text = QnaArray[quesNo].Ans
            pictureview.image = QnaArray[quesNo].picture
            gradelabel.isHidden = false
        }
    }
     */
    
    var QnaArray = [
        QNA(Ques:"請問101大樓在哪個縣市？",Ans:"臺北市",picture: UIImage(named:"1012")),
        QNA(Ques:"請問萊萊磯釣場在哪個縣市？",Ans:"宜蘭縣",picture: UIImage(named:"萊萊磯釣場")),
        QNA(Ques:" 請問阿里小火車在哪個縣市？",Ans:"嘉義縣",picture: UIImage(named:"阿里山3")),
        QNA(Ques:"請問日月潭在哪個縣市？",Ans:"南投縣",picture: UIImage(named:"日月潭")),
        QNA(Ques:"請問愛河在哪個縣市？",Ans:"高雄市",picture: UIImage(named:"高雄")),
        QNA(Ques:"請問炸寒單是哪個縣市習俗？",Ans:"台東縣",picture: UIImage(named:"炸寒單")),
        QNA(Ques:"請問七星潭在哪個縣市？",Ans:"花蓮縣",picture: UIImage(named:"七星潭")),
        QNA(Ques:"請問水晶教堂在哪個縣市？",Ans:"台南市",picture: UIImage(named:"水晶教堂")),
        QNA(Ques:"請問高美濕地在哪個縣市？",Ans:"台中市",picture: UIImage(named:"高美夕陽")),
        QNA(Ques:"請問九份老街在哪個縣市？",Ans:"新北市",picture: UIImage(named:"九分2"))
    ]
    
    var cityArray = [
        "新北市","臺北市","宜蘭縣","南投縣","高雄市","臺東縣","花蓮縣","臺南市","臺中市","桃園市","新竹縣","苗栗縣","彰化縣","雲林縣","嘉義縣","屏東縣","宜蘭縣","澎湖縣"]//城市的舉正
    
    //下一題
    @IBAction func nextques(_ sender: Any) {
        
        switch quesNo {
        case 10:
            quesNo = 1
        default:
            quesNo = quesNo + 1 //起始次數=1
        }
        
        switch QNAarrayNo {
        case 9:
            QNAarrayNo = 0
            
            
        default:
            QNAarrayNo = QNAarrayNo + 1 //起始次數=1
        }
        
        switch ansArrayNo {
        case 9:
            ansArrayNo = 0
        default:
            ansArrayNo = ansArrayNo + 1 //起始次數=1
        }
        
   
        
        questionNoLabel.isHidden = false //次數不要隱藏
        showans.isHidden = false //顯示答案不要隱藏
        questionNoLabel.text = "\(quesNo)."//題號
        ques.text = QnaArray[QNAarrayNo ].Ques
        showans.text = ""
        pictureview.image = QnaArray[QNAarrayNo].picture
        gradelabel.isHidden = false
        cbtn.isHidden = false
        bbtn.isHidden = false
        abtn.isHidden = false
        dbtn.isHidden = false
        
        let btn3:String = cbtn.currentTitle!
        let btn2:String = bbtn.currentTitle!
        let btn1:String = abtn.currentTitle!
        let btn4:String = dbtn.currentTitle!
        let ans:String = QnaArray[QNAarrayNo ].Ans
        
        var randomNumber =  Int(arc4random_uniform(16))//定義隨機變數
        let answerIndex = arc4random_uniform(4)
        
        if  ansArrayNo == randomNumber || ansArrayNo == randomNumber + 1 || ansArrayNo == randomNumber+2 {
        randomNumber = Int(arc4random_uniform(16))
        }
        else if answerIndex % 4 == 0 {
            dbtn.setTitle("\(QnaArray[QNAarrayNo ].Ans)",for: .normal)
            cbtn.setTitle("\(cityArray[Int(randomNumber)])",for: .normal)
            //答案Ｃ從隨機array裡
            
            abtn.setTitle("\(cityArray[Int((randomNumber+1)%16)])",for: .normal)
            //答案a從隨機array裡
            
            bbtn.setTitle("\(cityArray[Int((randomNumber+2)%16)])",for: .normal)
            
            print("d \(answerIndex)& \(btn4) & \(ans)")
        }
            
        else if answerIndex % 4 == 1 {
            abtn.setTitle("\(QnaArray[QNAarrayNo ].Ans)",for: .normal)
         print("a \(answerIndex)& \(btn1) & \(ans)")
            
            cbtn.setTitle("\(cityArray[Int(randomNumber)])",for: .normal)
            //答案Ｃ從隨機array裡
            bbtn.setTitle("\(cityArray[Int((randomNumber+2)%16)])",for: .normal)
            dbtn.setTitle("\(cityArray[Int((randomNumber+3)%16)])",for: .normal)
        }
        else if answerIndex % 4 == 2 {
            bbtn.setTitle("\(QnaArray[QNAarrayNo ].Ans)",for: .normal)
         print("b \(answerIndex)& \(btn2) & \(ans)")
        cbtn.setTitle("\(cityArray[Int(randomNumber)])",for: .normal)
        //答案Ｃ從隨機array裡
        
        abtn.setTitle("\(cityArray[Int((randomNumber+1)%16)])",for: .normal)
        //答案a從隨機array裡
        dbtn.setTitle("\(cityArray[Int((randomNumber+3)%16)])",for: .normal)
        }
        else {
            cbtn.setTitle("\(QnaArray[QNAarrayNo ].Ans)",for: .normal)
            abtn.setTitle("\(cityArray[Int((randomNumber+1)%16)])",for: .normal)
            //答案a從隨機array裡
            
            bbtn.setTitle("\(cityArray[Int((randomNumber+2)%16)])",for: .normal)
            dbtn.setTitle("\(cityArray[Int((randomNumber+3)%16)])",for: .normal)
            
        print("c \(answerIndex)& \(btn3)& \(ans)")
        }
        

        
        /*
         var optioncity = [Int]()//選項的舉正
cityArray.remove(at: Int(timeslab))
        optioncity.append(Int(randomNumber))
        cityArray.remove(at: Int(randomNumber))*/
        
        
        /*switch ans {
        case btn2, btn1 ,btn3, btn4:
            print("\(ans)")
        default:
         
            btn3 = QnaArray[timestart % 10 ].Ans
        }*/
        

        
        cityArray = ["新北市","臺北市","宜蘭縣","南投縣","高雄市","臺東縣","花蓮縣","臺南市","臺中市","桃園市","新竹縣","苗栗縣","彰化縣","雲林縣","嘉義縣","屏東縣","宜蘭縣","澎湖縣"]
        

    }
    
    var grade = 0
    
    @IBOutlet weak var cbtn: UIButton!
    @IBAction func answerbtnc(_ sender: UIButton) {
        
        if cbtn.currentTitle! == QnaArray[QNAarrayNo % 10 ].Ans {
            grade = grade + 10
            gradelabel.isHidden = false
            cbtn.isHidden = false
            cbtn.setTitle("恭喜，答對！！",for: .normal)
        }
        else if cbtn.currentTitle! == "恭喜，答對！！" {
        cbtn.setTitle("請選擇下一題！！",for: .normal)
        }
        else{
            cbtn.setTitle("答錯囉！！",for: .normal)
        }

        //self.answerbtnc.setTitle("     ", for: .normal)
        //let answerbtnc = (sender as AnyObject).titleLabel??.text
    }
    
    @IBOutlet weak var abtn: UIButton!
    @IBAction func answerbtna(_ sender: Any) {
        if abtn.currentTitle! == QnaArray[QNAarrayNo % 10 ].Ans {
            grade = grade + 10
            gradelabel.isHidden = false
            abtn.isHidden = false
            abtn.setTitle("恭喜，答對！！",for: .normal)
        }
        else if abtn.currentTitle! == "恭喜，答對！！" {
            abtn.setTitle("請選擇下一題！！",for: .normal)
        }
        else{
            abtn.setTitle("答錯囉！！",for: .normal)
        }
    }

    @IBOutlet weak var bbtn: UIButton!
    @IBAction func answerbtnb(_ sender: Any) {
       
        if bbtn.currentTitle! == QnaArray[QNAarrayNo ].Ans {
            grade = grade + 10
            gradelabel.text = "分數：\(grade)分"
            gradelabel.isHidden = false
             bbtn.isHidden = false
            bbtn.setTitle("恭喜，答對！！",for: .normal)
        }
        else if bbtn.currentTitle! == "恭喜，答對！！" {
            bbtn.setTitle("請選擇下一題！！",for: .normal)
        }
        else {bbtn.setTitle("答錯囉！！",for: .normal)
        }
    }
    
    @IBOutlet weak var dbtn: UIButton!
    @IBAction func answerbtnd(_ sender: Any) {
        
        if dbtn.currentTitle! == QnaArray[QNAarrayNo ].Ans {
            grade = grade + 10
            gradelabel.text = "分數：\(grade)分"
            gradelabel.isHidden = false
            dbtn.isHidden = false
            dbtn.setTitle("恭喜，答對！！",for: .normal)
        }
        else if dbtn.currentTitle! == "恭喜，答對！！" {
            dbtn.setTitle("請選擇下一題！！",for: .normal)
        }
        else {dbtn.setTitle("答錯囉！！",for: .normal)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
