func phoneNumberMnemonics(_ phoneNumber: String) -> [String] {
    var currentMnemonic = Array(repeating: Character("0"), count: phoneNumber.count)
    var mnemonicsFound = [String]()
    let phoneNumberArr = Array(phoneNumber)

    phoneNumberMnenomicsHelper(0, phoneNumberArr, &currentMnemonic, &mnemonicsFound)
    return mnemonicsFound
}

func phoneNumberMnenomicsHelper(_ idx: Int, _ phoneNumber: [Character], _ currentMnemonic: inout [Character], _ mnemonicsFound: inout [String]) {
    if idx == phoneNumber.count {
        let mnemonic = String(currentMnemonic)
        mnemonicsFound.append(mnemonic)
    } else {
        let digit = phoneNumber[idx]
        let letters = digits[digit]!
        for letter in letters {
                currentMnemonic[idx] = letter
                phoneNumberMnenomicsHelper(idx + 1, phoneNumber, &currentMnemonic, &mnemonicsFound)
        }
    }
}

let digits: [Character: [Character]] = [
    "0": ["0"],
    "1": ["1"],
    "2": ["a", "b", "c"],
    "3": ["d", "e", "f"],
    "4": ["g", "h", "i"],
    "5": ["j", "k", "l"],
    "6": ["m", "n", "o"],
    "7": ["p", "q", "r", "s"],
    "8": ["t", "u", "v"],
    "9": ["w", "x", "y", "z"]
]