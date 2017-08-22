//
//  ActividadesDAO.swift
//  CRUD
//
//  Created by Miguel Mexicano Herrera on 21/08/17.
//  Copyright © 2017 Miguel Mexicano Herrera. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class ActividadesDAO {
    var actividades: [Actividades] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func InsertActivity(titulo:String, descripcion:String){
        let context = AppDelegate.viewContext
        
        let request: NSFetchRequest<Actividades> = Actividades.fetchRequest()
        
        request.predicate = NSPredicate(format: "titulo = %@", titulo)
        
        do{
            let fetchResult = try context.fetch(request)
            if fetchResult.count > 0{
                print("Updateando Actividad")
                UpdateActivityCoreData(actividad: fetchResult[0], titulo: titulo, descripcion: descripcion)
            }else{
                print("Insertando Actividad")
                let actividad = Actividades(context: context)
                
                actividad.titulo = titulo
                actividad.descripcion = descripcion
                
                
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
            }
        }
        catch{
            print("No se pudo hacer la conexion con la DB")
            
        }
    }
    
    func UpdateActivityCoreData(actividad: Actividades,titulo: String, descripcion: String) {
        actividad.setValue(titulo, forKey: "titulo")
        actividad.setValue(descripcion, forKey: "descripcion")
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }

    
    func ObtenerActividades()->[Actividades]{
        
        do {
           let actividades = try context.fetch(Actividades.fetchRequest())
            return actividades as! [Actividades]
            
        }catch{
          print("Error al obtener los Datos de la DB-> AppDelegate ")
           return []
        }
    }
    
    
    
    func deleteActividadCoreData(actividad: Actividades){
        let context = AppDelegate.viewContext
        
        context.delete(actividad)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    }

    
    
    func getData(){
        do{
            actividades = try context.fetch(Actividades.fetchRequest())
            
            if actividades.count > 0 {
                for actividad in actividades{
                    print(actividad.titulo ?? "")
                    print(actividad.descripcion ?? "")
                    print("")
                }
            }else{
                print("No Hay Datos Para Mostrar")
            }
        }
        catch{
            print("Failed feching")
        }
        
    }

    
    


}
