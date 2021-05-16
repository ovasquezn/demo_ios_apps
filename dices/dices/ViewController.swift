//
//  ViewController.swift
//  dices
//
//  Created by Orlando on 15-05-21.
//

import UIKit

class ViewController: UIViewController {

    //Dado Izquierdo
    @IBOutlet weak var imageViewDiceLeft: UIImageView!
    //Dado derecho
    @IBOutlet weak var imageViewDiceRight: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Se llama la función desde un inicio
        generateRandomDices()
    }
    //Varibles
    var randomDiceIndexLeft : Int=0
    var randomDiceIndexRight : Int=0
    //Constante. Coleccion con las posibles caras de los dados
    //let diceImages : [String] = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    
    //Constante inicializada
    let diceImages : [String]
    let nFaces : UInt32
    
    required init?(coder aDecoder: NSCoder) {
        diceImages = ["dice1","dice2","dice3","dice4","dice5","dice6"]
        nFaces = UInt32(diceImages.count)
        super.init(coder: aDecoder)
    }
    
    //Boton "Tirar los dados"
    @IBAction func rollPressed(_ sender: Any) {
        generateRandomDices()
    }
    //Funcion que geenra los números aleatorioas entre las caras de los dados
    func generateRandomDices(){
        //Se generan los números aleatorios
        randomDiceIndexLeft = Int(arc4random_uniform(nFaces))
        randomDiceIndexRight = Int(arc4random_uniform(nFaces))
        //Se cambian las imágenes segun los números obtenidos
        imageViewDiceLeft.image = UIImage(named: diceImages[randomDiceIndexLeft])
        imageViewDiceRight.image = UIImage(named: diceImages[randomDiceIndexRight])
        
        UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            
            //Animaciones de los dados
            self.imageViewDiceLeft.transform = CGAffineTransform(translationX: 0, y: 10).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi)).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
            
            self.imageViewDiceRight.transform = CGAffineTransform(translationX: 0, y: 10).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi)).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
            
            self.imageViewDiceLeft.alpha = 0.0
            self.imageViewDiceRight.alpha = 0.0
            
        }) { (completed) in
            
            //Recuperamos los valores iniciales
            self.imageViewDiceLeft.image = UIImage(named: self.diceImages[self.randomDiceIndexLeft])
            self.imageViewDiceRight.image = UIImage(named: self.diceImages[self.randomDiceIndexRight])
        
            self.imageViewDiceLeft.transform = CGAffineTransform.identity
            self.imageViewDiceRight.transform = CGAffineTransform.identity
            
            self.imageViewDiceLeft.alpha = 1.0
            self.imageViewDiceRight.alpha = 1.0
        }
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            generateRandomDices()
        }
    }
}

