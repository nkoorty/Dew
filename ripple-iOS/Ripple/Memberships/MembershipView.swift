//
//  MembershipView.swift
//  Ripple
//
//  Created by Artemiy Malyshau on 11/12/2023.
//

import SwiftUI

struct MembershipView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(memberships) { membership in
                        MemberView(membership: membership)
                            .padding(.bottom, 6)
                    }
                }
                .navigationTitle("Memberships")
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    MembershipView()
        .preferredColorScheme(.dark)
}
