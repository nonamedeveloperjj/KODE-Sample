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
            Text("Какой-то сверхразум все сломал")
                .padding(.top, 8.0)
                .font(.system(size: 17.0, weight: .semibold))
            Text("Постараемся быстро починить")
                .padding(.top, 12.0)
                .font(.system(size: 16.0))
                .foregroundColor(Color(hex: "#97979B"))
            Button {
                onRetry?()
            } label: {
                Text("Попробовать снова")
                    .foregroundColor(Color(hex: "#6534FF"))
                    .font(.system(size: 16.0, weight: .semibold))
            }
            .padding(.top, 12.0)
        }
    }
}

struct EmployeesListErrorView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeesListErrorView()
    }
}
