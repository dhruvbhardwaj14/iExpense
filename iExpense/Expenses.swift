//
//  Expenses.swift
//  iExpense
//
//  Created by Dhruv Bhardwaj on 02/07/22.
//

import Foundation

class Expenses:ObservableObject{
    @Published var item=[ExpenseItem](){
    didSet{
        if let encoded=try? JSONEncoder().encode(item){
            UserDefaults.standard.set(encoded,forKey: "Items")
        }
    }
}
    init(){
        if let savedItems=UserDefaults.standard.data(forKey: "Items"){
            if let decodedItems=try? JSONDecoder().decode([ExpenseItem].self,from: savedItems){//.self represent that we are referring to that array of items itself
                item=decodedItems
                return
            }
        }
        item=[]
    }
}
