//
//  EmployeesService.swift
//  KODE-Sample
//
//  Created by John Snow on 06/10/2022.
//

import Foundation

// sourcery: AutoMockable
protocol EmployeesServiceProtocol: AnyObject {
    func fetchEmployees(completion: @escaping (Result<EmployeesResponse, Error>) -> Void)
}

final class EmployeesService: EmployeesServiceProtocol {
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func fetchEmployees(completion: @escaping (Result<EmployeesResponse, Error>) -> Void) {
        let requestComponents = RequestComponents(
            scheme: "https",
            host: "stoplight.io",
            path: "/mocks/kode-education/trainee-test/25143926/users",
            method: .get,
            header: ["Content-Type": "application/json"]
        )
        
        httpClient.sendRequest(requestComponents: requestComponents) { result in
            DispatchQueue.main.async {
                switch result {
                case let .success(data):
                    if let data = data {
                        do {
                            let employeesResponse = try JSONDecoder().decode(EmployeesResponse.self, from: data)
                            completion(.success(employeesResponse))
                        } catch {
                            completion(.failure(error))
                        }
                    }
                case let .failure(error):
                    completion(.failure(error))
                }                
            }
        }
    }
}
