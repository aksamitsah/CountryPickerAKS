//
//  ViewController.swift
//  SampleExample
//
//  Created by Amit Shah on 14/11/23.
//

import UIKit
import CountryPickerAKS

class ViewController: UIViewController {
    
    @IBOutlet weak var responseLbl: UILabel!
    @IBOutlet weak var btn001: UIButton!
    @IBOutlet weak var btn002: UIButton!
    @IBOutlet weak var btn003: UIButton!
    @IBOutlet weak var btn004: UIButton!
    @IBOutlet weak var btn005: UIButton!
    @IBOutlet weak var btn006: UIButton!
    @IBOutlet weak var btn007: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn001.isHidden = true
        btn002.isHidden = true
        btn003.isHidden = true
        btn004.isHidden = true
        btn005.isHidden = true
        btn006.isHidden = true
        btn007.isHidden = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {

        btn001.customUI()
        
        UIView.animate(withDuration: 0.2, delay: 0.05) { [self] in
            btn002.customUI()
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.10) { [self] in
            btn003.customUI()
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.15) { [self] in
            btn004.customUI()
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.20) { [self] in
            btn005.customUI()
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.25) { [self] in
            btn006.customUI()
        }

        UIView.animate(withDuration: 0.2, delay: 0.30) { [self] in
            btn007.customUI()
        }
    }

    func updateValue(result: Result<CountryList, CustomError>){
        
        UIView.animate(withDuration: 0.6) {
            switch result {
            case .success(let data):
                self.responseLbl.text = "Country Name: \(data.name) \n Flag: \(data.emoji) \n Code: \(data.code) \n Country Code: \(data.dial_code)"
            case .failure(let err):
                debugPrint(err.localizedDescription)
                self.responseLbl.text = err.localizedDescription
                
            }
        }
    }
    
    @IBAction func listViewBtn(_ sender: UIButton) {
        
        switch sender {
        case btn001:
            //Default
            CountryListVC.open(from: self) { result in
                self.updateValue(result: result)
            }
            
        case btn002:
            //Display type update
            CountryListVC.open(from: self, config: Config(display: ShowContent(Flag: true, CountryName: true))) { result in
                self.updateValue(result: result)
            }
            
        case btn003:
            //Text Color Update
            CountryListVC.open(from: self, config: Config(color: ThemeColor(primary: .systemGray6, secondary: .systemBackground, textColor: .systemBlue))) { result in
                self.updateValue(result: result)
            }
            
        case btn004:
            //Font Update
            CountryListVC.open(from: self, config: Config(
                font: ThemeFont(
                    searchBar: UIFont(name: "Lemonada-Medium", size: 16) ?? UIFont(),
                    countryName: UIFont(name: "Lemonada-Regular", size: 16) ?? UIFont(),
                    countryCode: UIFont(name: "Lemonada-Light", size: 16) ?? UIFont(),
                    countryFlag: UIFont(name: "Lemonada-Bold", size: 22) ?? UIFont())
            )) { result in
                self.updateValue(result: result)
            }
            
        case btn005:
            //Show Local Country On Top Off
            CountryListVC.open(from: self, config: Config(
                data: CustomizeCountryList(showLocalOnTop: false)
            )) { result in
                self.updateValue(result: result)
            }
            
        case btn006:
            //Update country list Position
            CountryListVC.open(from: self, config: Config(
                data: CustomizeCountryList(alterExisting: [
                    .onTopAfterLocal(["NP","US"]),
                    .onTop(["AQ"]),
                    .onBottom(["AD"])
                ])
            )) { result in
                self.updateValue(result: result)
            }
        
        case btn007:
            //Add New country list Position
            CountryListVC.open(from: self, config: Config(
                data: CustomizeCountryList(
                    addNew: [
                        CountryList(name: "New Country", dial_code: "+12", emoji: "🫡", code: "NCA"),
                        CountryList(name: "New Country B", dial_code: "+13", emoji: "😵‍💫", code: "NCB")
                    ],
                    alterExisting: [
                        .onTop(["NCA", "NCB"]),
                        .onTopAfterLocal(["NP"]),
                        .onBottom(["US"])
                    ]
                )
            )) { result in
                self.updateValue(result: result)
            }
            
        default: break
            
        }
        
    }
    
}
