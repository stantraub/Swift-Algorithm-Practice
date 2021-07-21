func getCommonSuperview(with firstView: UIView, and secondView: UIView) -> UIView? {
    var currentView = firstView.superview
    var otherView = secondView.superview
    firstView.tag = -1  // -1 means this node is visited.

    while currentView != nil {
        currentView.tag = -1  // -1 means this node is visited.
        currentView = currentView?.superview
    }

    if secondView.tag == -1 { return secondView }

    while otherView != nil {
        // if view is visited before then return view
        guard otherView?.tag != -1 else { return otherView }
        otherView = otherView?.superview
    }

    return nil
}