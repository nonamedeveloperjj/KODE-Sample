//
//  EmployeeProfileView.swift
//  KODE-Sample
//
//  Created by John Snow on 29/11/2022.
//

import SwiftUI
import Kingfisher

struct EmployeeProfileView: View {
    @ObservedObject private var viewModel: EmployeeProfileViewModel
    
    private var headerView: some View {
        VStack(spacing: 0.0) {
            Rectangle()
                .frame(height: 0.0)
            KFImage(URL(string: viewModel.employee.avatarUrl))
                .resizable()
                .clipShape(Circle())
                .frame(width: 104.0, height: 104.0)
                .padding(.top, 60.0)
                .padding(.bottom, 24.0)
            HStack(spacing: 0.0) {
                Text(viewModel.employee.firstName + " " + viewModel.employee.lastName)
                    .font(.system(size: 24.0, weight: .bold))
                    .foregroundColor(Color(hex: "#050510"))
                Text(viewModel.employee.userTag.lowercased())
                    .font(.system(size: 17.0))
                    .foregroundColor(Color(hex: "#97979B"))
                    .padding(.leading, 4.0)
            }
            .padding(.bottom, 12.0)
            Text(viewModel.employee.position)
                .font(.system(size: 13.0))
                .foregroundColor(Color(hex: "#55555C"))
                .padding(.bottom, 24.0)
        }
        .background(Color(hex: "#F7F7F8"))
    }
    
    private var birthdayView: some View {
        HStack(spacing: 0.0) {
            Image("employees_profile_favorite")
                .resizable()
                .frame(width: 24.0, height: 24.0)
                .padding(.leading, 16.0)
            Text(viewModel.formattedBirthday)
                .font(.system(size: 16.0, weight: .medium))
                .padding(.leading, 12.0)
                .foregroundColor(Color(hex: "#050510"))
            Spacer()
            Text(viewModel.employeeAge)
                .font(.system(size: 16.0, weight: .medium))
                .foregroundColor(Color(hex: "#97979B"))
                .padding(.trailing, 20.0)
        }
        .frame(height: 74.0)
    }
    
    private var phoneNumberView: some View {
        Button {
            print("PHONE")
        } label: {
            HStack(spacing: 0.0) {
                Image("employees_profile_phone")
                    .resizable()
                    .frame(width: 24.0, height: 24.0)
                    .padding(.leading, 16.0)
                Text(viewModel.employee.phone)
                    .font(.system(size: 16.0, weight: .medium))
                    .foregroundColor(Color(hex: "#050510"))
                    .padding(.leading, 12.0)
                Spacer()
            }
        }
        .frame(height: 74.0)
    }
    
    private var separatorView: some View {
        Rectangle()
            .frame(height: 0.5)
            .foregroundColor(Color(hex: "#F7F7F8"))
            .padding(.horizontal, 16.0)
    }
    
    private var personalInfoView: some View {
        VStack(spacing: 0.0) {
            birthdayView
            separatorView
            phoneNumberView
        }
    }
    
    var body: some View {
        VStack(spacing: 0.0) {
            headerView
            personalInfoView
            Spacer()
        }
    }
    
    init(viewModel: EmployeeProfileViewModel) {
        self.viewModel = viewModel
    }
}

struct EmployeeProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeProfileView(viewModel: EmployeeProfileViewModel(employee: Employee.placeholderModel))
    }
}
