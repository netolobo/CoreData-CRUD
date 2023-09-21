//
//  Navigate.swift
//  CoreData Trial
//
//  Created by Neto Lobo on 20/09/23.
//

import Foundation
import UIKit

struct Navigate {
    static func push(from currentScreen: UIViewController, to destinationScreen: UIViewController) {
        currentScreen.navigationController?.pushViewController(destinationScreen, animated: true)
    }
}
