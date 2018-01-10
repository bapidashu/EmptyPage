//
//  Empty+UIScrollView.swift
//  EmptyPage
//
//  Created by bigl on 2018/1/10.
//

import UIKit

public extension UIScrollView {

  private struct EmptyDataKey {
    static let emptyViewKey = UnsafeRawPointer(bitPattern:"scroll_emptyViewKey".hashValue)!
    static let oldEmptyViewKey = UnsafeRawPointer(bitPattern:"scroll_oldEmptyViewKey".hashValue)!
  }

  var oldEmptyView: UIView? {
    get {
      return objc_getAssociatedObject(self,EmptyDataKey.oldEmptyViewKey) as? UIView
    }
    set {
      if let emptyView: AnyObject = newValue {
        objc_setAssociatedObject(self,EmptyDataKey.oldEmptyViewKey,emptyView,.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      }
    }
  }

  public var emptyView: UIView? {
    get {
      return objc_getAssociatedObject(self,EmptyDataKey.emptyViewKey) as? UIView
    }
    set {
      if let emptyView: AnyObject = newValue {
        self.oldEmptyView = self.emptyView
        objc_setAssociatedObject(self,EmptyDataKey.emptyViewKey,emptyView,.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      }
    }
  }

}