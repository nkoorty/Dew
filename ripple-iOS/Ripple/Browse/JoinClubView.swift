//
//  JoinClubView.swift
//  Ripple
//
//  Created by Artemiy Malyshau on 11/12/2023.
//

import SwiftUI

struct JoinClubView: View {
    var body: some View {
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 40, height: 5)
                    .foregroundColor(.white.opacity(0.4))
            }
            .padding(.top, 10)
            
            
            Text("Imperial College Robotics Society")
                .bold()
                .padding(.vertical, 12)
            
            Button {
                joinMembership()
            } label: {
                HStack {
                    Text("Join for 5 XRP")
                        .foregroundStyle(.white)
                        .font(.system(size: 18, weight: .bold))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(.blue)
                        .cornerRadius(10)
                }
            }
            Text("By joining, you agree to pay 5 XRP towards this subscription. You will be charged 5 XRP yearly. The value of XRP is very volatile and therefore subject to change.")
                .font(.caption)
                .padding(.top, 20)
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding(.horizontal, 16)
    }
    
    func joinMembership() {
        guard let url = URL(string: "http://localhost:3000/interact_join_membership") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error making request: \(error.localizedDescription)")
                return
            }
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                print("Response: \(responseString)")
            }
        }.resume()
    }
}

#Preview {
    JoinClubView()
        .preferredColorScheme(.dark)
}
