//
//  Aghs.swift
//  
//
//  Created by zzzwco on 2022/11/12.
//
//  Copyright (c) 2021 zzzwco <zzzwco@outlook.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation
import SwiftUI

/// Source of **Aghs**.
///
/// Example:
///
/// ```swift
///
/// ```
public struct Aghs {}

public extension Aghs {
  
  /// A storage bag for package itself that makes using `Aghs` enjoyable.
  /// There's no need to use it.
  struct Bag {}
}


/// Source of **ax**.
///
/// Example:
///
///```swift
///
///```
///
public struct Ax<T> {

  public let base: T

  init(_ base: T) {
    self.base = base
  }
}

public protocol Axable {

  associatedtype T

  var ax: T { get }
  
  static var ax: T.Type { get }
}

public extension Axable {

  var ax: Ax<Self> {
    Ax(self)
  }
  
  static var ax: Ax<Self>.Type {
    Ax.self
  }
}

extension NSObject: Axable {}

public extension View {
  
  var ax: Ax<some View> {
    Ax(self)
  }
}
