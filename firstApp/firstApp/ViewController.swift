//
//  ViewController.swift
//  firstApp
//
//  Created by Orlando on 14-05-21.
//

import UIKit

class ViewController: UIViewController {

    //Propiedades
    @IBOutlet weak var labelTitle: UILabel!

    @IBOutlet weak var imageViewLogo: UIImageView!
    
    @IBOutlet weak var ButtonPush: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //Métodos
    @IBAction func buttonPressed(_ sender: UIButton) {
        //print("Botón pulsado")
        
        //self.labelTitle.text = "El botón se ha pulsado"
        //self.labelTitle.textColor = UIColor.yellow
        //self.labelTitle.font = UIFont.boldSystemFont(ofSize: 24)
        
        let controller = UIAlertController(title:"Mensaje de prueba", message: "String Test",
                                           preferredStyle: .actionSheet) //.alert
        let action1 = UIAlertAction(title: "Aceptar", style: .default) { (action) in
            print("Botón Aceptar pulsado")
            
        }
        let action2 = UIAlertAction(title: "Borrar", style: .destructive, handler: { (action) in
            print("Botón Borrar pulsado")
        })
        let action3 = UIAlertAction(title: "Cancelar", style: .cancel){ (_) in
            print("Botón Cancelar pulsado")
        }
        
        
        controller.addAction(action1)
        controller.addAction(action2)
        controller.addAction(action3)
        self.show(controller, sender: nil)
            
    }
    
}

