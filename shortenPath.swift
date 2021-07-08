static func shortenPath(_ path: String) -> String {
	let startsWithSlash = path.first == "/"
	let splits = path.components(separatedBy: "/")
	var tokens = splits.filter { isImportantToken($0) }

	var stack = [String]()
	if startsWithSlash {
		stack.append("")
	}

	for token in tokens {
		if token == ".." {
			if stack.count == 0 || stack[stack.count - 1] == ".." {
				stack.append(token)
			} else if stack[stack.count - 1] != "" {
				stack.removeLast()
			}
		} else {
			stack.append(token)
		}
	}

	if stack.count == 1, stack[0] == "" {
		return "/"
	}

	return stack.joined(separator: "/")
}

    static func isImportantToken(_ token: String) -> Bool {
        token.length > 0 && token != "."
    }