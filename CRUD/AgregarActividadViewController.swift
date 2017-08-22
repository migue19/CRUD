//
//  AgregarActividadViewController.swift
//  CRUD
//
//  Created by Miguel Mexicano Herrera on 21/08/17.
//  Copyright © 2017 Miguel Mexicano Herrera. All rights reserved.
//

import UIKit

class AgregarActividadViewController: UIViewController {
    let actividadesDAO = ActividadesDAO()
    var titulo = String()
    var descripcion = String()

    @IBOutlet weak var agregarBtn: UIButton!
    @IBOutlet weak var tituloTxt: UITextField!
    @IBOutlet weak var descripcionTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(titulo != ""){
            tituloTxt.text = titulo
            descripcionTxt.text = descripcion
            agregarBtn.setTitle("Actualizar", for: .normal)
        }
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }
    
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func agregarActividad(_ sender: Any) {
        if(tituloTxt.text == "" && descripcionTxt.text == "") {
          Utils().alerta(context: self, title: "Error", mensaje: "Los campos son Obligatorios")
        }
        else{
           actividadesDAO.InsertActivity(titulo: tituloTxt.text!, descripcion: descripcionTxt.text!)
           Utils().alerta(context: self, title: "Exito", mensaje: "Operacion Exitosa")
            
           actividadesDAO.getData()
        }
        
        
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
