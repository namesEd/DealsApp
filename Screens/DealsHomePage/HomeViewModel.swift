//
//  HomeViewModel.swift
//  DealsApp
//
//  Created by renupunjabi on 7/3/23.
//




import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var deals: [Deal] = []
    
    let service = DealsService()
    
    func getDeals() {
        Task {
            do {
                let deals = try service.fetchDeals()
                DispatchQueue.main.async {
                    self.deals = deals
                }
            } catch {
                print("Error fetching deals: \(error)")
            }
        }
    }
}


//import Foundation
//
//struct DealData {
//
//}
//
//class HomeViewModel: ObservableObject {
//    // Call the fetch call using DealsService
//    @Published var deals: [DealData] = []
//    let dealsService = DealsService();
//    init() {
//        self.loadDeals()
//    }
//
//    func loadDeals() {
//        do {
//            let rawDealData = try dealsService.fetchDeals();
//            self.deals = rawDealData.map({item in
//                DealData(rawData: item)
//            })
//        }
//        catch {
//            if let error = error as? APIError {
//                print(error.description)
//            }
//            else {
//                print(error.localizedDescription)
//            }
//        }
//
//    }
//}
