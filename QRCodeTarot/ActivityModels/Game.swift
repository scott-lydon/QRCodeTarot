//
//  Game.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/12/22.
//

import Foundation

struct Game: CanDisplayTutorial, CaseIterable {
    var title: String
    var subTitle: String
    var summary: String?
    var tutorial: Tutorial

    var topDesription: LabelLabel.ViewModel {
        .init(topText: title, bottomText: subTitle)
    }

    static var allCases: [Game] {
        [
            Game(
                title: "BS",
                subTitle: "a Game of Bluffing",
                summary: nil,
                tutorial: [
                    TutorialItem.Step(
                        title: "What You Need",
                        description: "To play BS you will need: 3 or more people, A deck of 52 playing cards, with or without jokers Sunglasses(optional)-You'll see why later!"
                    ),
                    TutorialItem.Step(
                        title: "Preparation",
                        description: "The very first thing you need to do is take out the Jokers of the deck if you are playing the normal version.(More on that later) Once you have done this, shuffle the deck very well. You want the deck to be mixed up! Depending on how many people you have, start dealing the cards out to each individual. Continue until you have dealt all of the cards. You are now ready to begin!"
                    ),
                    TutorialItem.Step(
                        title: "Choosing Who Goes First",
                        description: "In the traditional rules, whoever has the ace of spades goes first. They would place that card down, along with any other aces they have."
                    ),
                    TutorialItem.Step(
                        title: "The Rules of the Game and Organizing Cards",
                        description:
                            """
                            The object of BS is to get rid of one's cards. To do this you "bluff" your opponents. The play will go by card number, starting at aces, then two's, three's, four's, and so on. The starting player must place the ace of spades facedown on their first hand if they have it. If not, then they can place down as many aces as they have. If they do not have any aces then they have to bluff. They do this by placing down 1 to 4 different number cards. For example, if it is my turn and I do not have any six's, and the play is on six's, I put down an ace and say, "One six." That was my turn and now it is the next player's turn.

                            If someone can tell that I was bluffing, they must shout "BS!!!" before the next player goes. If nothing is said, one cannot come back to a turn and proclaim that a bluff was in action. If small children are playing, substitute with words like "Peanut Butter!!!" or "Baloney Sandwich!!!" I have always liked the latter phrase. If the bluff is true, and the player did not place only the designated card(s) down, then the bluffing player must take all the cards in the middle of the table. If a bluff wasn't actually in play and the player was being honest, the accuser must take all of the cards. Played cards will be facedown until challenged.

                            Back to the beginning, after the initial starting turn, the play goes by number. Example: The player before me was required to play five's. I now play six's. Whomever is after me plays seven's. The game continues like this.

                            If a bluff is called out, the top cards that were just played are flipped over for everyone to see. Based on the cards, someone will have to take them. Play continues on the NEXT number with the NEXT player! If a bluff was called on an ace, with player number 3, then player number 4 begins the next turn on two's.

                            Organizing your cards will make the game quicker and flow smoother, and might even help you win. See pictures for examples. There are several ways to do this:

                            Number order - Exactly as the name says - Makes it easier to find cards
                            Jumbled - Makes it harder for your opponents to tell if you are bluffing; they can't tell if your cards are in order and if you are pulling out the wrong card to bluff
                            By suit - Place your cards in groups of suit, hearts, spades, clubs, and diamonds - makes it slightly more difficult for your opponents to tell if you are bluffing
                            **Update**

                            All of the side notes on the pictures aren't showing up, but if you click on the picture, you can see the notes.
                            """
                    ),
                    TutorialItem.Step(
                        title: "Winning the Game",
                        description: "To win the game, get rid of all your cards. If you have more than three people, you can also play for first place, second place, third place, etc...It can be advantageous to always call a bluff whenever a player puts their last card(s) down. The winner now has earned bragging rights."
                    ),
                    TutorialItem.Step(
                        title: "Advanced Play",
                        description: "More experienced players can enjoy some variations, such as adding in Jokers. A Joker counts as any card at all, and can lead to some interesting bluffs. Another variation is adding an extra deck or two into play, which is especially useful when playing large rounds. Tournaments are also another possibility. The list is endless!"
                    )
                ]
            )
        ]
    }
}
