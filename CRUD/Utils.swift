//
//  Utils.swift
//  CRUD
//
//  Created by Miguel Mexicano Herrera on 21/08/17.
//  Copyright © 2017 Miguel Mexicano Herrera. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    
    
    func alerta(context: UIViewController, title: String, mensaje: String ){
        let alert = UIAlertController(title: title, message: mensaje, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        context.present(alert, animated: true, completion: nil)
    }
}
