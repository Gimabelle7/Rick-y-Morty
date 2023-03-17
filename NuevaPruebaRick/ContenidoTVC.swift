//
//  ContenidoTVC.swift
//  NuevaPruebaRick
//
//  Created by Gimabelle Garcia vasquez on 11/10/22.
//
import UIKit
class ContenidoTVC: UITableViewCell {
    
    @IBOutlet weak var view_Lbl_Contacto: UIView!
    @IBOutlet weak var lbl_Contacto: UILabel!
    @IBOutlet weak var lbl_Name: UILabel!
    @IBOutlet weak var lbl_Air_Date: UILabel!
    @IBOutlet weak var lbl_Episode: UILabel!
    @IBOutlet weak var img_Icono: UIImageView!
    @IBOutlet weak var click_Ico: UIButton!

    static let identifier = "ContenidoTVC" // nuestro id
    
    static func nib() -> UINib{
        return UINib(nibName: "ContenidoTVC", bundle: nil)
    } // funcion estatic
    
    public func
    configureContenidoTVC(with result: ResultRickYMorty?){ // nuestro configure para mostrar nuestros datos de nuestra estrutura y nuestro modelo
        self.lbl_Name.text = result?.name
        self.lbl_Air_Date.text = result?.air_date
        self.lbl_Episode.text = result?.episode
        self.view_Lbl_Contacto.backgroundColor = .random() // para que muestre los colores
        
        view_Lbl_Contacto.layer.cornerRadius =
        view_Lbl_Contacto.frame.size.width/2
      //  view_Lbl_Contacto.backgroundColor = UIColor.magenta
        
        let contenido = result?.name // para que nos de la primera letra de nuestro nombre  creando nuestra variable
        if let first  = contenido?.first {
           // print(contenido?.first)
            lbl_Contacto.text = "\(first)"
        }
      }
    @IBAction func click_Ico(_ sender: UIButton) {
        print("funciona click icono")
    }
    }
extension CGFloat { // con esto tambien llamammos para que nos muestre los colores 
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor { // con este codigo se llama nuestros colores
    static func random() -> UIColor {
        return UIColor (
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
