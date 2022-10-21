//
//  RecepiePresenting.swift
//  MakeSomeFood
//
//  Created by Луиза Самойленко on 16.10.2022.
//

import UIKit

protocol RecepiePresenting: UIViewController {
    func showRecepie(_ recepie: ToodayCooking)
}

extension RecepiePresenting {
    func showRecepie(_ recepie: ToodayCooking) {
        let recepieVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RecepieViewController") as! RecepieViewController
        recepieVC.recepie = recepie
        show(recepieVC, sender: self)
    }
}
