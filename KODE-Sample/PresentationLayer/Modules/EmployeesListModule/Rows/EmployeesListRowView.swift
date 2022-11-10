//
//  EmployeesListRowView.swift
//  KODE-Sample
//
//  Created by John Snow on 03/11/2022.
//

import SwiftUI
import Kingfisher

struct EmployeesListRowView: View {
    private let employee: Employee
    
    var body: some View {
        HStack(spacing: 0) {
            KFImage(URL(string: employee.avatarUrl))
                .resizable()
                .frame(width: 72.0, height: 72.0)
                .clipShape(Circle())
                .onAppear()
            VStack(alignment: .leading, spacing: 0.0) {
                HStack(spacing: 0.0) {
                    Text("\(employee.firstName) \(employee.lastName)")
                        .font(.system(size: 16.0))
                    Text(employee.userTag.lowercased())
                        .foregroundColor(Color(hex: "#97979B"))
                        .font(.system(size: 14.0))
                        .padding(.leading, 4.0)
                }
                .padding(.bottom, 3.0)
                Text(employee.position)
                    .font(.system(size: 13.0))
                    .foregroundColor(Color(hex: "#55555C"))
            }
            .padding(.leading, 16.0)
            Spacer()
        }
        .padding(EdgeInsets(top: 6.0, leading: 16.0, bottom: 6.0, trailing: 0.0))
    }
    
    init(employee: Employee) {
        self.employee = employee
    }
}

struct EmployeesListItemView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeesListRowView(
            employee: Employee(
                id: "id",
                avatarUrl: "https://raw.githubusercontent.com/nonamedeveloperjj/fake-avatars/main/avatars/5.png",
                firstName: "Андрей",
                lastName: "Иванов",
                userTag: "QA",
                department: "pr",
                position: "Specialist",
                birthday: Date(),
                phone: "997-546-8116"
            )
        )
    }
}
