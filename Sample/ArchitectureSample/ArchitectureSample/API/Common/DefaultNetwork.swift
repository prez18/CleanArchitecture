//
//  DefaultNetwork.swift
//  DefaultNetwork
//
//  Created by prez on 2019/01/02.
//  Copyright © 2019 prez. All rights reserved.
//

import Foundation
import RxSwift

/// URLSessionを利用したネットワーク
///
/// NOTE: - https://github.com/mixi-inc/iOSTraining/blob/master/Swift/pages/day3/4-2_HTTP-request-basic.md
/// http://www.utakata.work/entry/20180715/1531634457
final class DefaultNetwork: Network {
    // 多くの通信を実施するならば，sharedインスタンスを利用するのが良い．．
    public static let shared: DefaultNetwork = DefaultNetwork()

    // そうでもない場合などは，個別にインスタンスの生成もできる．
    public init() {
    }

    /// リクエストを送信する
    ///
    /// - Parameter request: リクエスト
    /// - Returns: レスポンス
    func send(for request: Request) -> Observable<Response> {
        return Observable.create { observe in
            var task: URLSessionDataTask?
            DispatchQueue.global(qos: .background).async {
                var urlComponents: URLComponents = URLComponents()
                urlComponents.scheme = request.scheme
                urlComponents.host = request.host
                urlComponents.path = request.path
                urlComponents.queryItems = request.parameter.map {
                    URLQueryItem(name: $0.key, value: $0.value)
                }

                var urlRequest: URLRequest = URLRequest(url: urlComponents.url!)
                urlRequest.networkServiceType = .background

                switch request.method {
                case .get:
                    urlRequest.httpMethod = "get"
                case .post:
                    urlRequest.httpMethod = "post"
                    urlRequest.httpBody = urlComponents.percentEncodedQuery?.data(using: .utf8)
                }
                request.header.forEach { httpHeaderField, value in
                    urlRequest.addValue(value, forHTTPHeaderField: httpHeaderField)
                }
                urlRequest.timeoutInterval = request.timeoutInterval

                let urlSession: URLSession = URLSession(configuration: .default)

                print("📡 \(request.scheme)://\(request.host)\(request.path)")
                print("    \(request.parameter)")

                task = urlSession.dataTask(with: urlRequest) { data, response, error in
                    guard error == nil else {
                        observe.onError(ConnectionError())
                        return
                    }
                    guard let data: Data = data,
                        let httpResponse: URLResponse = response,
                        let statusCode: Int = (httpResponse as? HTTPURLResponse)?.statusCode else {
                        return
                    }
                    guard 200 ..< 400 ~= statusCode else {
                        observe.onError(HttpStatusCodeError())
                        return
                    }

                    let response: Response = Response(
                        data: data,
                        mimeType: httpResponse.mimeType,
                        textEncodingName: httpResponse.textEncodingName,
                        url: httpResponse.url
                    )
                    observe.onNext(response)
                    observe.onCompleted()
                }
                task?.resume()
            }
            return Disposables.create {
                task?.cancel()
            }
        }.subscribeOn(ConcurrentDispatchQueueScheduler(qos: .default))
    }
}

struct ConnectionError: Error {
    
}

struct HttpStatusCodeError: Error {
    
}
