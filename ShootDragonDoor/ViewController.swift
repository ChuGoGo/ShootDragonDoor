//
//  ViewController.swift
//  ShootDragonDoor
//
//  Created by Chu Go-Go on 2022/2/8.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var fristCardIV: UIImageView!
    @IBOutlet weak var giveCardButton: UIButton!
    @IBOutlet weak var secCardIV: UIImageView!
    @IBOutlet weak var thirdCardIV: UIImageView!
    @IBOutlet weak var sentYourPullMoneyTF: UITextField!
    @IBOutlet weak var yourBetLb: UILabel!
    @IBOutlet weak var pokeRuleTV: UITextView!
    @IBOutlet weak var hitCardIV: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var moneyTF: UITextField!
    // 分類好全部得卡片
    var allCard = [pokeCard(cardIV: "C1", cardNum: 1),pokeCard(cardIV: "C2", cardNum: 2),pokeCard(cardIV: "C3", cardNum: 3),pokeCard(cardIV: "C3", cardNum: 3),pokeCard(cardIV: "C4", cardNum: 4),pokeCard(cardIV: "C5", cardNum: 5),pokeCard(cardIV: "C6", cardNum: 6),pokeCard(cardIV: "C7", cardNum: 7),pokeCard(cardIV: "C8", cardNum: 8),pokeCard(cardIV: "C9", cardNum: 9),pokeCard(cardIV: "C10", cardNum: 10),pokeCard(cardIV: "CJ", cardNum: 11),pokeCard(cardIV: "CQ", cardNum: 12),pokeCard(cardIV: "CK", cardNum: 13),pokeCard(cardIV: "D1", cardNum: 1),pokeCard(cardIV: "D2", cardNum: 2),pokeCard(cardIV: "D3", cardNum: 3),pokeCard(cardIV: "D4", cardNum: 4),pokeCard(cardIV: "D5", cardNum: 5),pokeCard(cardIV: "D6", cardNum: 6),pokeCard(cardIV: "D7", cardNum: 7),pokeCard(cardIV: "D8", cardNum: 8),pokeCard(cardIV: "D9", cardNum: 9),pokeCard(cardIV: "10", cardNum: 10),pokeCard(cardIV: "DJ", cardNum: 11),pokeCard(cardIV: "DQ", cardNum: 12),pokeCard(cardIV: "DK", cardNum: 13),pokeCard(cardIV: "H1", cardNum: 1),pokeCard(cardIV: "H2", cardNum: 2),pokeCard(cardIV: "H3", cardNum: 3),pokeCard(cardIV: "H4", cardNum: 4),pokeCard(cardIV: "H5", cardNum: 5),pokeCard(cardIV: "H6", cardNum: 6),pokeCard(cardIV: "H7", cardNum: 7),pokeCard(cardIV: "H8", cardNum: 8),pokeCard(cardIV: "H9", cardNum: 9),pokeCard(cardIV: "H10", cardNum: 10),pokeCard(cardIV: "HJ", cardNum: 11),pokeCard(cardIV: "HQ", cardNum: 12),pokeCard(cardIV: "HK", cardNum: 13),pokeCard(cardIV: "S1", cardNum: 1),pokeCard(cardIV: "S2", cardNum: 2),pokeCard(cardIV: "S3", cardNum: 3),pokeCard(cardIV: "S4", cardNum: 4),pokeCard(cardIV: "S5", cardNum: 5),pokeCard(cardIV: "S6", cardNum: 6),pokeCard(cardIV: "S7", cardNum: 7),pokeCard(cardIV: "S8", cardNum: 8),pokeCard(cardIV: "S9", cardNum: 9),pokeCard(cardIV: "S10", cardNum: 10),pokeCard(cardIV: "SJ", cardNum: 11),pokeCard(cardIV: "SQ", cardNum: 12),pokeCard(cardIV: "SK", cardNum: 13)]
    //    基本池底
    var pullmoney = moneyCount(INpullMoney: 0)
    //    卡片的數量
    var cardIndex = 0
//    規則
    var ruleIndex = 0
//    第一張牌的點數
    var fristcardsNum = 0
//    第二張牌的點數
    var secondCardsNum = 0
//    第三張牌的點數
    var thridCardsNum = 0
    
    override func viewDidLoad() {
        
        gameStar()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func snetCard(_ sender: UIButton) {
//        先宣告一個儲存池底的錢
        let checkMyPull = Int(sentYourPullMoneyTF.text!)
//        宣告範圍
        let cardRange: ClosedRange<Int>
//        宣告下注金額
        var money = Int(moneyTF.text!)
//        叫出三張牌
        let fristCard = pokeCard(cardIV: allCard[0].cardIV, cardNum: allCard[0].cardNum)
        let secCard = pokeCard(cardIV: allCard[1].cardIV, cardNum: allCard[1].cardNum)
        let thridCard = pokeCard(cardIV: allCard[2].cardIV, cardNum: allCard[2].cardNum)
//        如果你的底池是空值
        if checkMyPull == nil{
            print("檢查第一層\(pullmoney.INpullMoney)")
//            池底 = 0
            pullmoney.INpullMoney = 0
//            圖片隱藏
            fristCardIV.isHidden = true
            thirdCardIV.isHidden = true
            secCardIV.isHidden = true
        }
//        如果金額是空值
        if money == nil{
//            金額就會等於0
            money = 0
        }else{
//            不然就回等於你下注的金額
            money = money!
        }
//        當等於0跑出提示字
        if   pullmoney.INpullMoney == 0 {
            print("檢查池底1\(pullmoney)2")
            typePullMoney()
//            如果不等於0就往下跑
        }else if   pullmoney.INpullMoney != 0 {
            print("檢查池底2\(moneyLabel.text!)")
//            index + 1
            cardIndex += 1
//            輸入池底金額會被隱藏
            sentYourPullMoneyTF.isHidden = true
//            index = 1 ， 有錢的時候
            if cardIndex == 1 , moneyLabel.text != nil {
//                第一張牌顯示
                fristCardIV.isHidden = false
//                確認自己看到的是cardIndex第幾張牌
                print("第一圈第\(cardIndex)張牌")
//                確認每張牌的號碼
                print("第一張號碼\(fristCard.cardNum)")
                print("第2張號碼\(secCard.cardNum)")
                print("第3張號碼\(thridCard.cardNum)")
//                當第二張牌跑出來時 如果你還沒打下注金額時
            }else if cardIndex % 3 == 2 , money == 0{
                secCardIV.isHidden = false
                resultLabel.text = "請下注！\(fristCard.cardNum)~\(secCard.cardNum)"
//                如果第二張牌的點數跟第一張相近會重新洗牌發牌
            }else if secCard.cardNum - 1 == fristCard.cardNum {
                secCardIV.isHidden = false
                cardReturn()
                gameStar()
            }else if secCard.cardNum + 1 == fristCard.cardNum {
                secCardIV.isHidden = false
                cardReturn()
                gameStar()
            }else if secCard.cardNum == fristCard.cardNum {
                secCardIV.isHidden = false
                gameStar()
                cardReturn()
//                跑到第二張牌 有打下注金額 第一張牌不等於 第二張牌時
            }else if cardIndex % 3 == 2 , money != 0 , fristCard.cardNum != secCard.cardNum {
//                顯示第二張牌
                secCardIV.isHidden = false
//                跑出提示文字
                resultLabel.text = "請下注！\(fristCard.cardNum)~\(secCard.cardNum)"
                print("第二圈第\(cardIndex)張牌")
                print("第一張號碼\(fristCard.cardNum)")
                print("第2張號碼\(secCard.cardNum)")
                print("第3張號碼\(thridCard.cardNum)")
//                當跑到第三張牌時
            } else if cardIndex % 3 == 0 {
                print("第三圈第\(cardIndex)張牌")
                print("第一張號碼\(fristCard.cardNum)")
                print("第2張號碼\(secCard.cardNum)")
                print("第3張號碼\(thridCard.cardNum)")
//                顯示第三張牌
                thirdCardIV.isHidden = false
                print("範圍第一張：\(fristCard.cardNum)")
                print("範圍第一張：\(secCard.cardNum)")
//                如果第一張牌點數 小於 第二張牌
                if fristcardsNum < secondCardsNum{
//                    卡片的範圍就會是 第一張...第二張
                    cardRange = fristCard.cardNum...secCard.cardNum
//                    如果 第一張 > 第二張
                }else{
//                    卡片的範圍 第二張...第一張
                    cardRange = secCard.cardNum...fristCard.cardNum
                }
//                用switch casr來判斷
                switch thridCard.cardNum {
//                    如果第三張點數等於第一張 就是中柱
                case fristCard.cardNum:
                    resultLabel.text = "恭喜你中柱啦！賠\(money! + money!)!"
                    hitCardIV.isHidden = false
                    pullmoney.INpullMoney = pullmoney.INpullMoney + money! + money!
                    moneyLabel.text = "\(Int(pullmoney.INpullMoney))"
                    print("檢查池底中柱\(pullmoney.INpullMoney)")
//                    如果第三張點數等於第二張 就是中柱
                case secCard.cardNum:
                    resultLabel.text = "恭喜你中柱啦！賠\(money! + money!)!"
                    hitCardIV.isHidden = false
                    pullmoney.INpullMoney = pullmoney.INpullMoney + money! + money!
                    moneyLabel.text = "\(Int(pullmoney.INpullMoney))"
                    print("檢查池底中柱\(pullmoney.INpullMoney)")
//                    如果在範圍內就是贏錢
                case cardRange:
                    print("範圍\(cardRange)")
                    resultLabel.text = "恭喜你贏了\(moneyTF.text!)!"
                    pullmoney.INpullMoney = pullmoney.INpullMoney - money!
                    moneyLabel.text = "\(Int(pullmoney.INpullMoney))"
                    print("檢查池底贏錢\(pullmoney.INpullMoney)")
//                    沒有在範圍內就是輸錢
                default:
                    resultLabel.text = "射偏了！賠\(money!)!"
                    pullmoney.INpullMoney = pullmoney.INpullMoney + money!
                    moneyLabel.text = "\(Int(pullmoney.INpullMoney))"
                    print("檢查池底輸\(pullmoney.INpullMoney)")
                }
//                如果當底池沒錢時
                if pullmoney.INpullMoney == 0{
//                    圖片都隱藏
                    fristCardIV.isHidden = true
                    thirdCardIV.isHidden = true
                    secCardIV.isHidden = true
                    hitCardIV.isHidden = true
//                    叫大家丟錢
                    sentYourPullMoneyTF.text = ""
                    sentYourPullMoneyTF.isHidden = false
                    resultLabel.text = "池底沒錢了！大家丟錢！"
                }
//                如果當cardIndex > 3 然後 cardIndex 除以3的餘數為1時
            } else if cardIndex > 3 ,cardIndex % 3 == 1 ,pullmoney.INpullMoney != 0 {
//                圖片隱藏
                fristCardIV.isHidden = true
                thirdCardIV.isHidden = true
                secCardIV.isHidden = true
                hitCardIV.isHidden = true
//                提示字
                resultLabel.text = "再射一場吧！"
//                卡片為零
                cardIndex = 0
//                錢不會動
                pullmoney.INpullMoney = pullmoney.INpullMoney
                moneyLabel.text = "\(Int(pullmoney.INpullMoney))"
//                重新洗牌取三張
                gameStar()
                print("檢查池底3\(pullmoney.INpullMoney)")
                
            }
        }
        
    }
    @IBAction func pokeRule(_ sender: Any) {
//        按一下就會讓Index＋1
        ruleIndex += 1
//        等於1的時候規則就會顯示
        if ruleIndex == 1 {
            pokeRuleTV.isHidden = false
            ruleIndex += 1
//            大於2就會隱藏
        }else if ruleIndex > 2 {
            pokeRuleTV.isHidden = true
            ruleIndex = 0
        }
    }
    @IBAction func sentMoney(_ sender: UIButton) {
//先宣告一個下注金額
        let moneyCount = Int(moneyTF.text!)
//        如果他是空值的話
        if moneyCount == nil{
//            跑出提示字
            typeBetMoney()
        }else{
//            如果不是會顯示你下注的金額
            yourBetLb.text = "\(moneyCount!)"
        }
//        如果你下注的金額大於你池底的金額
        if moneyCount! > pullmoney.INpullMoney {
//            跑出提示字
            pullMoneyEnought()
        }
    }
    
    @IBAction func allIN(_ sender: UIButton) {
//        讓你的標題變文字
        resultLabel.text = "All In啦！臉色特變！"
//        你的金額 ＝ 你全部的金額
        moneyTF.text = "\(pullmoney.INpullMoney)"
//        你下注的金額 ＝ 你全部的金額
        yourBetLb.text = "\(pullmoney.INpullMoney)"
    }
    @IBAction func resetGame(_ sender: UIButton) {
//        重新洗牌再取三張
        gameStar()
//        把撲克隱藏
        sentYourPullMoneyTF.isHidden = false
        fristCardIV.isHidden = true
        thirdCardIV.isHidden = true
        secCardIV.isHidden = true
        hitCardIV.isHidden = true
//        金額歸零
        pullmoney.INpullMoney = 0
//        把輸入的值都清空
        sentYourPullMoneyTF.text = ""
        moneyLabel.text = ""
        moneyTF.text = ""
        yourBetLb.text = ""
    }
    @IBAction func sentPullMoney(_ sender: UIButton) {
//        先宣告一個你池底金額
        let checkMyPull = Int(sentYourPullMoneyTF.text!)
//        如果他是空值的話
        if checkMyPull == nil{
//            跑出提示
            typePullMoney()
        } else {
//            如果他有值的話，把他的TextField隱藏
            sentYourPullMoneyTF.isHidden = true
//            輸入的金額 ＝ 你池底的金額
            pullmoney.INpullMoney = checkMyPull!
//            顯示你的金額
            moneyLabel.text = "\(Int(pullmoney.INpullMoney))"
        }
    }
//    遊戲開始時要跑的函式
    func gameStar(){
//        把全部的卡片打亂
        allCard.shuffle()
//        取第一張
        fristCardIV.image = UIImage(named: allCard[0].cardIV)
//        取第二張
        secCardIV.image = UIImage(named: allCard[1].cardIV)
//        取第三張
        thirdCardIV.image = UIImage(named: allCard[2].cardIV)
        fristcardsNum = allCard[0].cardNum
        secondCardsNum = allCard[1].cardNum
        thridCardsNum = allCard[2].cardNum
    }
//    如果有順序太相近的
    func cardReturn(){
//        把卡片的index歸零
        cardIndex = 0
//        卡片全部隱藏
        secCardIV.isHidden = true
        fristCardIV.isHidden = true
        thirdCardIV.isHidden = true
        resultLabel.text = "順序太近重發一次！"
    }
//    用alert跑出提示字
    func typePullMoney(){
        let moneyAlert = UIAlertController(title: "尚未輸入池底金額！", message: "請輸入您池底金額！", preferredStyle: .alert)
        let okType = UIAlertAction(title: "了解", style: .default, handler: nil)
        moneyAlert.addAction(okType)
        present(moneyAlert, animated: true, completion: nil)
    }
    //    用alert跑出提示字
    func typeBetMoney(){
        let moneyAlert = UIAlertController(title: "尚未輸入賭注金額！", message: "請輸入您賭注金額！", preferredStyle: .alert)
        let okType = UIAlertAction(title: "了解", style: .default, handler: nil)
        moneyAlert.addAction(okType)
        present(moneyAlert, animated: true, completion: nil)
    }
    //    用alert跑出提示字
    func pullMoneyEnought(){
        let moneyAlert = UIAlertController(title: "池底金額不足！", message: "您輸入的賭注金額高於池底！", preferredStyle: .alert)
        let okType = UIAlertAction(title: "了解", style: .default, handler: nil)
        moneyAlert.addAction(okType)
        present(moneyAlert, animated: true, completion: nil)
    }
}

