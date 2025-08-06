//
//  LocationListView.swift
//  SwiftUIMVVPMap
//
//  Created by Jesus Lara on 8/5/25.
//

import SwiftUI

struct LocationListView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
                .padding(.vertical,4)
                .listRowBackground(Color.clear)
                
            }
        }
        .listStyle(PlainListStyle())
    }
}

extension LocationListView {
    
    private func listRowView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.subheadline)
                Text(location.cityName)
                    .font(.subheadline)
            }
    
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    LocationListView()
        .environmentObject(LocationsViewModel())
}
