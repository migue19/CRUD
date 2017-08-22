//
//  ViewController.swift
//  CRUD
//
//  Created by Miguel Mexicano Herrera on 21/08/17.
//  Copyright © 2017 Miguel Mexicano Herrera. All rights reserved.
//

import UIKit
import CoreData

class ActividadesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var actividadesDAO = ActividadesDAO()
    var actividadesArray = [Actividades]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        actividadesArray = actividadesDAO.ObtenerActividades()
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let isAdd = (sender is UIBarButtonItem ? true : false)
        

        if segue.identifier == "actualizarAct" {
        
            let destination = segue.destination as! AgregarActividadViewController
            
            
            if !isAdd{
                let auxactividad = sender as! Actividades
                destination.titulo = auxactividad.titulo!
                destination.descripcion = auxactividad.descripcion!
            }
            else{
                destination.titulo = ""
                destination.descripcion = ""
            }
        }
    }
}

extension ActividadesViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hola")
        let actividadesAux = actividadesArray[indexPath.row]
        
        self.performSegue(withIdentifier: "actualizarAct", sender: actividadesAux)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


extension ActividadesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actividadesArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //let cell = Bundle.main.loadNibNamed("PromocionesTableViewCell", owner: self, options: nil)?.first as! PromocionesTableViewCell
        let indice = indexPath.row
        
        
        cell.textLabel?.numberOfLines = 0;
        cell.textLabel?.lineBreakMode = .byWordWrapping;
        cell.textLabel?.text = actividadesArray[indice].titulo
        //cell.imagen.image = promociones[indice].image
        //cell.descripcion.text = promociones[indice].descripcion
        //cell.fecha.text = promociones[indice].fecha
        //cell.textLabel?.text = array[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        actividadesDAO.deleteActividadCoreData(actividad: actividadesArray[indexPath.row])
        actividadesArray.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
        
    }



}

