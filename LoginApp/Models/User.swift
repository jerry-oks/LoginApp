//
//  User.swift
//  LoginApp
//
//  Created by HOLY NADRUGANTIX on 08.08.2023.
//

import Foundation
import UIKit

struct User {
    let login: String
    let password: String
    let name: String
    let person: Person
    
    static func getUser() -> User {
        User(
            login: "User",
            password: String(Int.random(in: 1000...9999)),
            name: "Алексей",
            person: .getPerson()
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let dateOfBirth: String
    let company: String
    let department: String
    let jobTitle: String
    let email: String
    let photo: UIImage
    let bio: String
    
    static func getPerson() -> Person {
        Person(
            name: "Крейг",
            surname: "Федериги",
            dateOfBirth: "27 мая 1969 г.",
            company: "Apple Inc.",
            department: "Разработка программного обеспечения",
            jobTitle: "Старший вице-президент",
            email: "federighi@apple.com",
            photo: UIImage(named: "Craig") ?? UIImage(ciImage: .red),
            bio: "Крейг Федериги - старший вице-президент Apple по разработке программного обеспечения. Крейг курирует разработку iOS и macOS. Его команды отвечают за разработку программного обеспечения, лежащего в основе инновационных продуктов Apple, включая пользовательский интерфейс, приложения и фреймворки. До своего возвращения в Apple в 2009 году Крейг работал в NeXT, а затем провел десять лет в Ariba, пионере интернет-электронной коммерции, где занимал несколько должностей, включая должность технического директора."
        )
    }
}
