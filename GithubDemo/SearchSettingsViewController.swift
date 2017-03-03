//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by Aarnav Ram on 02/03/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class SearchSettingsViewController: UIViewController {
    
    weak var delegate: SettingsPresentingViewControllerDelegate?
    
    var searchSettings: GithubRepoSearchSettings!


    @IBOutlet weak var sliderOutlet: UISlider!
    var sliderStarValue: Int = 0
    
    @IBOutlet weak var sliderValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderOutlet.value = Float(searchSettings.minStars/100000)
        sliderValueLabel.text = "Stars: \(sliderOutlet.value)"

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        sliderOutlet.value = Float(searchSettings.minStars/100000)
        print(sliderOutlet.value)
        print(searchSettings.minStars/100000)


        sliderValueLabel.text = "Stars: 0"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        let slider = sender as! UISlider
        print(slider.value)
        sliderStarValue = Int(slider.value * 100000)
        self.searchSettings.minStars = sliderStarValue
        sliderValueLabel.text = "Stars: \(sliderStarValue)"
        print(sliderStarValue)
    }

    @IBAction func savePressed(_ sender: Any) {
        self.delegate?.didSaveSettings(settings: self.searchSettings)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.delegate?.didCancelSettings()
        self.dismiss(animated: true, completion: nil)
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
