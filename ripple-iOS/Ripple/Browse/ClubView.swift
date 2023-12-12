//
//  SocietyView.swift
//  Ripple
//
//  Created by Artemiy Malyshau on 11/12/2023.
//

import SwiftUI

struct ClubView: View {
    
    @State private var searchStr = ""
    @State private var selectedSegment = "Upcoming"
    @State private var showJoinView = false
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
                                showJoinView.toggle()
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
                    Picker("Upcoming", selection: $selectedSegment) {
                        Text("Upcoming").tag("Upcoming")
                        Text("Past").tag("Past")
                    }
                    .pickerStyle(.segmented)
                    .listRowSeparator(.hidden)

                    ForEach(society.sessions ?? [], id: \.id) { session in
                        HStack(spacing: 10) {
                            Image(session.imageUrl)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 60)
                                .cornerRadius(6)
                            
                            VStack(alignment: .leading) {
                                Text(session.name)
                                
                                Text(session.timeAndDate)
                                    .font(.footnote)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                } header: {
                    Text("Sessions")
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
        .sheet(isPresented: $showJoinView) {
            JoinClubView()
                .presentationDetents([.fraction(0.3)])
        }
    }
}

#Preview {
    ClubView(society: loyalties[0])
        .preferredColorScheme(.dark)
}
