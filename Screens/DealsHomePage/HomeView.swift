//
//  ContentView.swift
//  DealsApp
//
//  Created by renupunjabi on 7/3/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path){
            VStack {
                HomeCell(viewModel: viewModel)
            }
            .padding(10)
            .onAppear {
                viewModel.getDeals()
            }
            .navigationBarTitle("Your Deals")
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
