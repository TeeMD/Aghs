//
//  ViewModifiers.swift
//  
//
//  Created by zzzwco on 2022/7/23.
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

extension View {
  
  /// Transfrom according to different conditions.
  /// - Parameters:
  ///   - condition: A `true` or `false` condition.
  ///   - transform: Apply when `condition` return `true`.
  ///   - elseTransform: Apply when `condition` return `false`.
  /// - Returns: Transformed view.
  @ViewBuilder func `if`(
    _ condition: () -> Bool,
    apply transform: (Self) -> some View,
    else elseTransform: ((Self) -> some View)? = nil
  ) -> some View {
    if condition() {
      transform(self)
    } else {
      elseTransform?(self)
    }
  }
  
  /// Transform according to an optional value that could be unwrapped or not.
  /// - Parameters:
  ///   - value: An optional value.
  ///   - transform: Apply when `value` has some value.
  /// - Returns: Transformed view.
  @ViewBuilder func ifLet<V>(
    _ value: V?,
    apply transform: (Self, V) -> some View
  ) -> some View {
    if let value {
      transform(self, value)
    } else {
      self
    }
  }
}