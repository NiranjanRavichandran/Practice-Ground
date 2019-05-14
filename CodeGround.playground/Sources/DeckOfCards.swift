import Foundation

public enum CardSuit: Int {
    case heart
    case diamond
    case spade
    case clover
}

public enum CardRank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case king, queen, jack
    
    public var value: String {
        switch self {
        case .ace:
            return "Ace"
        case .king:
            return "King"
        case .queen:
            return "Queen"
        case .jack:
            return "Jack"
        default:
            return self.numberToText(number: self.rawValue)
        }
    }
    
    private func numberToText(number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        return formatter.string(from: number as NSNumber)?.capitalized ?? " "
    }
}

private typealias Suit = CardSuit
private typealias Rank = CardRank

private struct Card {
    let suit: Suit
    let rank: Rank
}

private class Deck {
    var cards: [Card]!
}
