//
//  ViewController.swift
//  calculator
//
//  Created by Anand Tiwari on 19/08/19.
import UIKit

class ViewController: UIViewController {
    var opera:String=""
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var button9: UIButton!
    @IBOutlet var button0: UIButton!
    @IBOutlet var button7: UIButton!
    @IBOutlet var button5: UIButton!
    @IBOutlet var button8: UIButton!
    @IBOutlet var button6: UIButton!
    @IBOutlet var buttondot: UIButton!
    @IBOutlet var buttone: UIButton!
    @IBOutlet var buttonm: UIButton!
    @IBOutlet var buttons: UIButton!
    @IBOutlet var buttona: UIButton!
    @IBOutlet var buttond: UIButton!
    @IBOutlet var answer: UILabel!
    var temp:String=""
    var flag=0
//    var result:String="0"
    var eq:[String]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
        
    }
// to change the label of answer
    func labelChange(value:String)  {
            answer.text = value
    }

    
    @IBAction func Cancel(_ sender: Any) {
        temp=""
        if !eq.isEmpty{
        for i in 0..<eq.count{
            eq.popLast()
            }}
answer.text="0"
        print("label changed")
        }
    func  changeOperator(code:String)->String{
        if(code == "222")
        {        return "/"}
        else if(code == "444")
        {   return "-"}
        else if(code == "444")
    {return "-"}
        else if(code == "333")
        {return "+"}
        else{
            return "nothing"
        }
    }
    @IBAction func digitButton(_ sender:UIButton){
        print(sender.tag)
        temp+=String(sender.tag)
        labelChange(value: temp)}
    
    @IBAction func operators(_ sender:UIButton){
        if eq.isEmpty{
            eq.append(temp)}
        if(!eq.isEmpty && eq[eq.count-1] != "/" && eq[eq.count-1] != "*" && eq[eq.count-1] != "+" && eq[eq.count-1] != "-" ){
            opera=changeOperator(code:String(sender.tag))
            eq.append(opera)
            flag=0
            temp=""
            labelChange(value:eq[0]+eq[1])
        }}
        
    
    
    
    @IBAction  func havingVallue(_ sender:UIButton){
    switch sender{
        case buttondot :
            if(flag != 1){
            temp+="."
            flag=1
                labelChange(value:temp)}
        case buttone:
            if (eq.count>1){
                    eq.append(temp)
                    temp=""
                    flag=0
                        while(eq.count>1){
                            var num1=Float(eq.popLast()!)
                            var oper=(eq.popLast()!)
                            var num2=Float(eq.popLast()!)
                            if(oper == "/")
                            {
                                eq.append(String(num2!/num1!))
                            }
                            else if(oper == "*")
                            {
                                eq.append(String(num1!*num2!))
                            }
                            else if(oper == "+")
                            {
                                eq.append(String(num1!+num2!))
                            }
                            else if(oper == "-")
                            {
                                eq.append(String(num2!-num1!))
                            }
                    
                            }
                        labelChange(value: eq[0])
                    }
            default:
                break
        }
    }

}

