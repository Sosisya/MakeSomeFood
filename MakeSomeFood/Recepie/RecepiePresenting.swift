//
//  RecepiePresenting.swift
//  MakeSomeFood
//
//  Created by Луиза Самойленко on 16.10.2022.
//

import UIKit

protocol RecepiePresenting: UIViewController {
    func showRecepie(_ recepie: Recepie)
}

extension RecepiePresenting {
    func showRecepie(_ recepie: Recepie) {
        let recepieVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RecepieViewController")
        show(recepieVC, sender: self)
    }
}
