//
//  MemberView.swift
//  Ripple
//
//  Created by Artemiy Malyshau on 11/12/2023.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct MemberView: View {
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var membership: Membership
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(membership.clubName)
                        .bold()
                    
                    Text(membership.name)
                }
                .offset(x: -40)
                .frame(width: 200)
                
                Spacer()
                
                Image(uiImage: generateQRCode(from: membership.qrCode))
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 20)
        }
        .background(.gray.opacity(0.2))
        .cornerRadius(20)
    }
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

#Preview {
    MemberView(membership: memberships[1])
        .preferredColorScheme(.dark)
}

struct Membership: Identifiable, Hashable {
    var clubName: String
    var name: String
    var qrCode: String
    var id = UUID()
}

var memberships: [Membership] = [
    Membership(clubName: "Imperial College Robotics Society", name: "Artemiy Malyshau", qrCode: "Imperial College Robotics SocietyIOAEGI"),
    Membership(clubName: "NGFC", name: "Artemiy Malyshau", qrCode: "Imperial Robotics SocietyIOAEGI"),
    Membership(clubName: "Ole & Steen", name: "Artemiy Malyshau", qrCode: "Imperial College Ole SocietyIOAEGI"),
    Membership(clubName: "Honest Burgers", name: "Artemiy Malyshau", qrCode: "Imperial College So honest SocietyIOAEGI"),
]
