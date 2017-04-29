//
//  ViewController.swift
//  Lab1
//
//  Created by student on 08.02.17.
//  Copyright (c) 2017 Oleg Pyatko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var rublesTextEdit: UITextField!
    @IBOutlet var dollarsLabel: UILabel!
    @IBOutlet var eurosLabel: UILabel!
    @IBOutlet var poundsLabel: UILabel!
    
    let dollarsCourse = 1.9;
    let eurosCourse = 2.1;
    let poundsCourse = 2.3;
    
    @IBAction func convertButton(sender: UIButton) {
        
        var rubles : Double?;
        if (checkforEmptyInput(rublesTextEdit.text))
        {
            rubles = 1;
        }
        else{
            rubles = convertToDouble(rublesTextEdit.text);
        }
        
        if (rubles != nil)
        {
            if (rubles == 0)
            {
                rubles = 1;
            }
            if (rubles > 0)
            {
                var converter : Converter = Converter(rubles : rubles!);
                dollarsLabel.text = "Dollars: " + converter.convert(dollarsCourse).description;
                eurosLabel.text = "Euros: " + converter.convert(eurosCourse).description;
                poundsLabel.text = "Pounds: " + converter.convert(poundsCourse).description;
            }
            else{
                showMessage()
            }

        }
        else{
            showMessage();
        }
    }
    
    func checkforEmptyInput(input : String) -> Bool
    {
        return input.isEmpty
    }
    
    func convertToDouble(value : String) -> Double?
    {
        var formatter : NSNumberFormatter = NSNumberFormatter();
        return formatter.numberFromString(rublesTextEdit.text)?.doubleValue;
    }
    
    func showMessage()
    {
        let alertControllder = UIAlertController(
            title: "Error",
            message: "Wrong input",
            preferredStyle: UIAlertControllerStyle.Alert
        );
        alertControllder.addAction(
            UIAlertAction(
                title: "Cancel",
                style: UIAlertActionStyle.Default,
                handler: nil)
        );
        self.presentViewController(alertControllder, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

class Converter{
    var rubles : Double;
    init(rubles: Double){
        self.rubles = rubles;
    }
    func convert(divider: Double) -> Double
    {
        return rubles / divider;
    }
}