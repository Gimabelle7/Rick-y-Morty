//
//  DescripcionViewController.swift
//  NuevaPruebaRick
//
//  Created by Gimabelle Garcia vasquez on 2/11/22.
//

import UIKit

class DescripcionViewController: UIViewController {

    var rickYMorty : ResultRickYMorty?
    
    @IBOutlet weak var lbl_Des: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl_Des.text = rickYMorty?.name
    }
    

}
