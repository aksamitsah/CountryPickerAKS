//
//  CountryPicker.swift
//
//
//  Created by Amit Shah on 14/11/23.
//

import UIKit

public class CountryPicker: UIViewController {
    
    @IBOutlet private weak var notFoundImgView: UIImageView!
    @IBOutlet private weak var tableview: UIView!
    @IBOutlet private weak var searchImgView: UIImageView!
    @IBOutlet private weak var searchView: UIView!
    @IBOutlet private weak var seacrchCloseBtn: UIButton!
    @IBOutlet private weak var searchTf: UITextField!
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var backupData = [CountryList]()
    private var data = [CountryList](){
        didSet{
            notFoundImgView.isHidden = !data.isEmpty
        }
    }
    
    private var config : Config = Config()
    private var completion: ((Result<CountryList, CustomError>) -> Void)?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    private func setupUI(){
        
        let theme = config.color
        
        view.backgroundColor = theme.secondary
        
        searchImgView.tintColor = theme.secondary
        searchView.backgroundColor = theme.primary
        
        seacrchCloseBtn.tintColor = theme.secondary
        
        tableview.backgroundColor = theme.primary
        
        searchTf.textColor = theme.textColor
        searchTf.tintColor = theme.secondary
        
        tableview.layer.cornerRadius = 10
        searchView.layer.cornerRadius = 10
        
        seacrchCloseBtn.isHidden = true
        
        searchTf.delegate = self
        
        if let ds = CountryModelList().getCountryList(customize: config.data){
            
            data = ds
            backupData = data
            tableView.delegate = self
            tableView.dataSource = self
            tableView.keyboardDismissMode = .onDrag
            tableView.reloadData()
            
        }
        
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        
        if !config.display.checkValidation(){
            dismiss(animated: true) {
                self.completion?(.failure(.Custom(error: "Atleast One Config Display Required to Show the View")))
            }
        }
        
        if backupData.isEmpty{
            dismiss(animated: true) {
                self.completion?(.failure(.Custom(error: "Failed to Load Country List")))
            }
        }
    }
    
    @IBAction private func closeBtnTap(_ sender: Any) {
        
        seacrchCloseBtn.isHidden = true
        searchTf.text = ""
        data = backupData
        tableView.reloadData()
        
    }
    
    public static func show(from viewController: UIViewController, config: Config? = nil ,comp: @escaping (Result<CountryList,CustomError>) -> Void){
        
        if let vc = UIStoryboard(name: "Storyboard", bundle: Bundle._module).instantiateViewController(withIdentifier: "CountryPicker") as? CountryPicker{
            
            if let config{
                vc.config = config
            }
            
            vc.completion = comp
            
            if #available(iOS 15.0, *), let sheet = vc.sheetPresentationController {
                sheet.detents = [.large()]
                sheet.prefersScrollingExpandsWhenScrolledToEdge = false
                sheet.prefersGrabberVisible = true
                sheet.preferredCornerRadius = 24
                sheet.largestUndimmedDetentIdentifier = .large
            }
            
            viewController.present(vc, animated: true)
        }
        
    }
}

extension CountryPicker: UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    public func textFieldDidChangeSelection(_ textField: UITextField) {
        
        let ds = textField.text ?? ""
        seacrchCloseBtn.isHidden = ds.isEmpty
        
        data = ds.isEmpty ? backupData : backupData.filter { $0.name.lowercased().contains(ds.lowercased()) || $0.code.lowercased().contains(ds.lowercased()) || $0.dial_code.contains(ds) }
        
        ds.isEmpty ?  nil : data.sort { $0.name < $1.name }
        
        tableView.reloadData()
        
    }
    
}

extension CountryPicker: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryPickerCell.identifier, for: indexPath) as! CountryPickerCell
        cell.data = data[indexPath.row]
        cell.config = config
        cell.backgroundColor = .clear
        return cell
        
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = data[indexPath.row]
        dismiss(animated: true) {
            debugPrint("Selected List: Country Name: \(country.name), Flag: \(country.emoji), Code: \(country.code), Country Code: \(country.dial_code)")
            self.completion?(.success(country))
        }
    }
}


