//
//  LoyaltyView.swift
//  Ripple
//
//  Created by Artemiy Malyshau on 11/12/2023.
//

import SwiftUI

struct LoyaltyView: View {
    
    @State private var searchStr = ""
    var society: Society
    
    var body: some View {
        VStack {
            List {
                Section {
                    VStack {
                        HStack(spacing: 14) {
                            Image(society.imageUrl)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(20)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(society.name)
                                
                                Text(society.type.rawValue)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Text(society.joined ? "Joined" : "Join")
                                    .font(.system(size: 16))
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 4)
                                    .background(society.joined ? .green : .blue)
                                    .cornerRadius(20)
                            }
                        }
                    }
                    
                    Text(society.description)
                        .font(.subheadline)
                }
                .listRowSeparator(.hidden)
                
                Section {
                    (Text("You have made ") + Text("6/10").bold() + Text(" purchases for a free pastry"))
                } header: {
                    Text("Loyalty Overview")
                }
                .headerProminence(.increased)
                
                Section {
                    Text("Members: \(society.memberCount ?? 0)\nAddress: \(society.address)")
                } header: {
                    Text("Information")
                }
                .listRowSeparator(.hidden)
                .headerProminence(.increased)
            }
            .listStyle(.inset)
        }
        .navigationTitle(society.name)
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchStr, placement: .navigationBarDrawer(displayMode: .always))
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
            }
            
        }
    }
}

#Preview {
    LoyaltyView(society: societies[0])
        .preferredColorScheme(.dark)
}
