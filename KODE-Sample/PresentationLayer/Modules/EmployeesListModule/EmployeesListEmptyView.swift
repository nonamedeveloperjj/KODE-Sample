//
//  EmployeesListEmptyView.swift
//  KODE-Sample
//
//  Created by John Snow on 23/11/2022.
//

import SwiftUI

struct EmployeesListEmptyView: View {
    var body: some View {
        VStack(spacing: 0.0) {
            Image("empty_state_magnifying_glass")
                .resizable()
                .frame(width: 56.0, height: 56.0)
                .padding(.top, 80.0)
            Text("Мы ничего не нашли")
                .font(.system(size: 17.0, weight: .semibold))
                .padding(.top, 8.0)
            Text("Попробуй скорректировать запрос")
                .font(.system(size: 16.0))
                .foregroundColor(Color(hex: "#97979B"))
                .padding(.top, 12.0)
            Spacer()
        }
    }
}

struct EmployeesListEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeesListEmptyView()
    }
}
