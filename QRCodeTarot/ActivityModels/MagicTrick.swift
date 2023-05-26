//
//  MagicTrick.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/12/22.
//

import Foundation

struct MagicTrick: CaseIterable {
    var title: String
    var subTitle: String
    var summary: String
    var tutorial: Tutorial
    var videoURL: URL?
    var topDescription: LabelLabel.ViewModel {
        .init(topText: title, bottomText: subTitle)
    }

    static var allCases: [MagicTrick] {
        [
            .init(
                title: "The Mind Reading Card Trick",
                subTitle: "A prediction in a sealed envelope matches a card chosen by your spectator.",
                summary: "A prediction in a sealed envelope matches a card chosen by your spectator.",
                tutorial: [
                    TutorialItem.Step(description: "Before you begin, write down a prediction on a piece of paper (i.e. 10 of Hearts) and seal it in an envelope. Then, take your deck of cards and secretly place the 10 of Hearts on top."),
                    TutorialItem.Step(description: "Hand the envelope to an audience member and instruct them not to open it."),
                    TutorialItem.Step(description: "Fan the playing cards in your hand and show the audience they’re all mixed up. If someone asks to shuffle the deck. Don’t panic! Once they’ve shuffled, fan through the cards again to verify they’re properly shuffled. While you do this, locate the 10 of Hearts and cut it back to the top of the deck."),
                    TutorialItem.Step(description: "Now, you will get them to select the 10 of Hearts using a super easy self-working card force known as the Cross Cut Force."),
                    TutorialItem.Step(description: "Place the deck face down on the table and invite an audience member to cut the deck in half and place the cards to their right."),
                    TutorialItem.Step(description: "You then immediately pick up the original bottom half on the left, turn it sideways and place it on top of the cards to the right."),
                    TutorialItem.Step(description: "For this force to be effective, you’ll now need to let a few moments pass so your audience forgets which half came from where."),
                    TutorialItem.Step(description: "To do this, look up from the deck of cards and begin recapping how you used a regular deck of cards that was fairly shuffled. Remind your volunteer that they could have cut anywhere but chose to “cut here.”"),
                    TutorialItem.Step(description: "As you say “cut here” pick up the sideways top half and then point to the top card of the bottom half (the Ten of Hearts) and say “and you selected this card.”"),
                    TutorialItem.Step(description: "Have the volunteer turn over the selected card and then reveal it matches your prediction!")
                ],
                videoURL: nil
            ),
            .init(
                title: "The Impossible Three Card Trick",
                subTitle: "Mind reading time! Read your spectator’s mind and name a card they were merely thinking of.",
                summary: "Mind reading time! Read your spectator’s mind and name a card they were merely thinking of.",
                tutorial: [
                    TutorialItem.Step(description: "Remove the Ace of Spades, Queen of Hearts and Ace of Clubs from a deck of cards and place them on the table in that order left to right."),
                    TutorialItem.Step(description: "Turn your back and tell your spectator to simply think of 1 of the 3 cards."),
                    TutorialItem.Step(description: "Then, to secretly tell the other audience members what card they mentally selected, instruct them to pick up the 2 cards they DIDN’T select and swap their positions. (i.e. If they chose the Ace of Clubs, they would swap the Queen of Hearts and Ace of Spades)."),
                    TutorialItem.Step(description: "Once this is complete, have your spectator turn all 3 cards face down."),
                    TutorialItem.Step(description: "Turn back around and have them mix all 3 cards on the table casino style. As they do this, carefully follow the center card."),
                    TutorialItem.Step(description: "Once they’re done shuffling, flip over the card you followed. If this card is the Queen of Hearts (the original center card), then this was their selected card. If it is an Ace of Spades, then their mental selection was the Ace of Clubs. And, if it’s an Ace of Clubs, then they selected the Ace of Spades."),
                    TutorialItem.Step(description: "Flip over the other 2 cards and tell them to think about their card. After pretending to read their mind, push their selected card forward.")
                ],
                videoURL: nil
            )
        ]
    }
}
