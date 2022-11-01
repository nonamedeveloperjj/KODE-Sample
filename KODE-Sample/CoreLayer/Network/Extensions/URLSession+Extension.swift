//
//  URLSession+Extension.swift
//  KODE-Sample
//
//  Created by John Snow on 31/10/2022.
//

import Foundation

// sourcery: AutoMockable
protocol URLSessionProtocol: AnyObject {
    func createDataTask(
        with request: URLRequest,
        completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTaskProtocol
}

extension URLSession: URLSessionProtocol {
    func createDataTask(
        with request: URLRequest,
        completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTaskProtocol {
        return dataTask(with: request, completionHandler: completionHandler)
    }
}
