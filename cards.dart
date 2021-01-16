void main() {
  var deck = new Deck();

  print(deck);
  print(deck.cardsWithSuit("Diamonds"));
  deck.removeCard("Ace", "Diamonds");
  print(deck.cardsWithSuit("Diamonds"));
}

class Card {
  String suit;
  String rank;

  Card({this.suit, this.rank});

  toString() {
    return "${rank} of ${suit}";
  }
}

class Deck {
  List<Card> cards = [];

  Deck() {
    var ranks = ["Ace", "Two", "Three", "Four", "Five"];
    var suits = ["Diamonds", "Hearts", "Spades", "Clubs"];

    for (var suit in suits) {
      for (var rank in ranks) {
        var card = new Card(suit: suit, rank: rank);

        cards.add(card);
      }
    }
  }

  shuffle() {
    cards.shuffle();
  }

  cardsWithSuit(String suit) {
    return cards.where((card) => card.suit == suit);
  }

  deal(int handSize) {
    var hand = cards.sublist(0, handSize);

    cards = cards.sublist(handSize);

    return hand;
  }

  removeCard(String rank, String suit) {
    cards.removeWhere((card) => (card.rank == rank && card.suit == suit));
  }

  toString() {
    return cards.toString();
  }
}
