//
//  BrowseView.swift
//  Ripple
//
//  Created by Artemiy Malyshau on 11/12/2023.
//

import SwiftUI

struct BrowseView: View {
    
    @State private var searchStr = ""


    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section {
                        VStack {
                            ZStack(alignment: .bottomLeading) {
                                Image("background")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 180)
                                    .clipped()
                                VStack {
                                    Spacer()
                                    Text("Explore all memberships from an incredible selection of societies and establishments.")
                                        .fontWeight(.regular)
                                        .foregroundColor(.primary)
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(.thinMaterial)
                                }
                            }
                        }
                        .listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets())
                        .cornerRadius(20)
                        .padding(.horizontal, 16)
                    }
                    .listRowSeparator(.hidden)
                    .listStyle(.plain)
                    
                    Section {
                        NavigationLink {
                            
                        } label: {
                            HStack(spacing: 12) {
                                Image("docsoc")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(10)
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("University Club")
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                    
                                    Text("DocSoc")
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                }
                            }
                        }
                        NavigationLink {
                            ClubView(society: roboticsSocieties[0])
                        } label: {
                            HStack(spacing: 12) {
                                Image("icrs")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(10)
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("University Club")
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                    
                                    Text("Imperial College Robotics Society")
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                }
                            }
                        }
                    } header: {
                        HStack {
                            Text("University Clubs")
                            
                            Spacer()
                            
                            NavigationLink {
                                
                            } label: {
                                Text("See more")
                                    .font(.system(size: 16))
                                    .foregroundStyle(.blue)
                            }
                        }
                    }
                    .headerProminence(.increased)
                    
                    Section {
                        NavigationLink {
                            
                        } label: {
                            HStack(spacing: 12) {
                                Image("chelsea")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(10)
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Sports Club")
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                    
                                    Text("Chelsea FC")
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                }
                            }
                        }
                        
                        NavigationLink {
                            
                        } label: {
                            HStack(spacing: 12) {
                                Image("celtics")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(10)
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Sports Club")
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                    
                                    Text("Boston Celtics")
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                }
                            }
                        }
                    } header: {
                        HStack {
                            Text("Sports Clubs")
                            
                            Spacer()
                            
                            NavigationLink {
                                
                            } label: {
                                Text("See more")
                                    .font(.system(size: 16))
                                    .foregroundStyle(.blue)
                            }
                        }
                    }
                    .headerProminence(.increased)
                    .listStyle(.inset)
                    
                    Section {
                        NavigationLink {
                            
                        } label: {
                            HStack(spacing: 12) {
                                Image("ngfc")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(10)
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Sports Club")
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                    
                                    Text("North Greenwich FC")
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                }
                            }
                        }
                        NavigationLink {
                            
                        } label: {
                            HStack(spacing: 12) {
                                Image("icrs")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(10)
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("University Club")
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                    
                                    Text("Imperial College Robotics Society")
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                }
                            }
                        }
                    } header: {
                        HStack {
                            Text("Societies")
                            
                            Spacer()
                            
                            NavigationLink {
                                
                            } label: {
                                Text("See more")
                                    .font(.system(size: 16))
                                    .foregroundStyle(.blue)
                            }
                        }
                    }
                    .headerProminence(.increased)
                    .listStyle(.inset)
            
                }
                .listStyle(.inset)
            }
            .navigationTitle("Browse")
            .searchable(text: $searchStr, placement: .navigationBarDrawer(displayMode: .always))
        }
    }
}

#Preview {
    BrowseView()
        .preferredColorScheme(.dark)
}
