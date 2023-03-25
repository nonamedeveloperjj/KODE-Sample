//
//  EmployeesListErrorView.swift
//  KODE-Sample
//
//  Created by John Snow on 16/11/2022.
//

import SwiftUI

struct EmployeesListErrorView: View {
    var onRetry: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 0.0) {
            Image("flying-saucer")
                .resizable()
                .frame(width: 56.0, height: 56.0)
            Text("EmployeesListModule.ErrorState.Title".localized())
                .padding(.top, 8.0)
                .font(.system(size: 17.0, weight: .semibold))
            Text("EmployeesListModule.ErrorState.Description".localized())
                .padding(.top, 14.0)
                .font(.system(size: 16.0))
                .foregroundColor(Color(hex: "#97979B"))
            Button {
                onRetry?()
            } label: {
                Text("EmployeesListModule.ErrorState.TryAgainTitle".localized())
                    .foregroundColor(Color(hex: "#6534FF"))
                    .font(.system(size: 16.0, weight: .semibold))
            }
            .padding(.top, 14.0)
        }
    }
}

struct EmployeesListErrorView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeesListErrorView()
    }
}
