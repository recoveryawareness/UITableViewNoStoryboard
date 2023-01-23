//
//  BaseControl.swift
//  UITableViewNoStoryboard
//
//  Created by on 22/01/2023.
//  Copyright © 2023 JournalDev.com. All rights reserved.
//

import UIKit

public typealias SDSwitchValueChange = (_ value: Bool) -> Void
open class BaseControl: UIControl {
  // MARK: - Property

  open var valueChange: SDSwitchValueChange?

  open var isOn: Bool = false
}
