 struct QNA {
    var Ques = ""
    var Ans = ""
    }
 

var QnaArray = [
    QNA(Ques:"請問101大樓在哪個縣市？",Ans:"臺北市"),
    QNA(Ques:"請問萊萊磯釣場在哪個縣市？",Ans:"宜蘭縣")
]


var cityArray = [
    "臺北市","新北市","桃園市","臺中市","臺南市","高雄市","新竹縣","苗栗縣","彰化縣","南投縣","雲林縣","嘉義縣","屏東縣","宜蘭縣","花蓮縣","臺東縣","澎湖縣"]



 let btn3:String = ("\(cityArray[0])")
 let btn2:String = ("\(cityArray[2])")
 let btn1:String = ("\(cityArray[3])")
 let btn4:String = ("\(cityArray[5])")
 
        let ans:String = "臺南市"
        
        switch ans {
        case btn3:
            print("有解")
        case btn2:
            print("有解")
        case btn1:
            print("有解")
        case btn4:
            print("有解")
        default:
            
            let btn3:String = ("\(cityArray[1])")

            print("無解")
        }
        
