---
layout: review
title: "Superhuman AI for multiplayer poker"
tags: gofai
author: "Antoine Théberge"
cite:
    authors: "Noam Brown, Tuomas Sandholm"
    title:   "Superhuman AI for multiplayer poker"
    venue:   "Science"
pdf: "https://science.sciencemag.org/content/early/2019/07/10/science.aay2400"
---


# Highlights
- First AI to beat humans in six-players no-limit Texas hold'em poker

# Introduction

Poker has always been the poster child for imperfect/hidden information games in game theory and AI. Prior breakthroughs in Poker AI, like [Libratus](https://science.sciencemag.org/content/359/6374/418), and games in general (Starcraft, Go, Dota, etc.) have been limited to two-player zero-sum games. While such AI typically approximates a Nash equilibrium strategy, however, finding or even approximating such equilibria in more-than-two-player games can be extremely hard and possibly not even worth it. 

Tree search algorithms, like ABP and MCTS, have also been used extensively in prior games. However, using such algorithms in hidden information games lead to intractable search spaces.

# Methods

## Nash equilibrium

A [Nash equilibrium](https://en.wikipedia.org/wiki/Nash_equilibrium) is reached when all players of a game are assumed to know the equilibrium strategies of the other players, and no player can gain by changing their own strategy. An example of this is the lemonade stand game, where every player must stay as far from every other player as possible.
![](https://scontent.fyhu1-1.fna.fbcdn.net/v/t39.2365-6/67125564_680986665659447_1357790886280298496_n.gif?_nc_cat=103&_nc_oc=AQmje7JZHa4PZzM2z3k5YltkGUOxApzeFPMkw0Fp0QicfvLrzaLgcyg-1xMlX5XYUx4&_nc_ht=scontent.fyhu1-1.fna&oh=187da90f735c77a8b3e624bb7a211efd&oe=5DE92A5D)
> source: facebook.com

In this game, there are infinite ways the equilibrium can be reached. However, if every player computes this equilibrium separately, it is very unlikely the players will end up equally spaced. In six-player poker, the authors decided that the algorithm should try to find such equilibrium, and instead focus on creating an AI that beats humans empirically.

## Hidden information

A successful poker-playing AI must reason about the game's information and pick the optimal strategy. However, Poker involves bluffing, where the optimal strategy might not only depend on your cards. It is, therefore, necessary to balance the probability of your opponent having a strong hand versus them bluffing. Perfect information games can use tree search algorithms such as [Alpha-Beta Pruining](https://en.wikipedia.org/wiki/Alpha%E2%80%93beta_pruning) to estimate future action outcomes. In imperfect information games, the value of an action is dependant on the probability it would be taken. 

Pluribus was trained via self-play, where the agent plays against copies of itself, with a modified version of [Monte-Carlo Counterfactual Regret Minimization](https://papers.nips.cc/paper/4569-efficient-monte-carlo-counterfactual-regret-minimization-in-games-with-many-player-actions.pdf)(MCCFRM) to update its policy. 

MCCFRM explores the decision tree up to a certain depth and then backtracks and explores what would have happened if other actions would have been selected. A "regret" is then calculated based on how high the value of other paths are. The regret then influences the probability of selecting actions in the future. The video below shows how Pluribus updates its policy.

[![](/article/images/pluribus/thumbnail.jpeg)](https://www.facebook.com/FacebookAI/videos/459177014638910/)

Because the agent is playing against itself, it can know what would have happened if a different action had been chosen. As you can imagine, maintaining regret for every action in a game would be intractable. Therefore, the authors used "bucketing", where similar actions and states are grouped together. For example, raising 200$ or 201$ dollar will provide similar outcomes, and an opponent having a 10-straight or a 9-straight will usually act the same.

The self-play training provides only a "blueprint" strategy that influences only the first betting round. Afterward, the agent uses MCCFRM to adapt its strategy to opponents. Moreso, tree search algorithms usually presume that the opponent will stick to a single strategy throughout the whole game, which is not something poker players do. Pluribus instead uses an approach where it will assume that each player may act according to different strategies beyond the leaf nodes. With Pluribus, the different strategies are variations of the blueprint, each more biased towards folding, calling or raising.

Finally, in Poker, the optimal strategy depends on how the opponents perceive the player's hand. If the player never bluffs, the opponents will know to fold in response to a big raise. To add uncertainty, Pluribus computes the probability of reaching the current situation regardless of the hand it is holding. Once the strategy balanced across all hands is computed, it executes an action for the hand it is actually holding.

## Data

Pluribus was trained for eight days on a 4-core server and required less than 512GB of RAM. No GPU were used. 

![](https://scontent.fyhu1-1.fna.fbcdn.net/v/t39.2365-6/67064888_389656325232510_2098761968490905600_n.gif?_nc_cat=102&_nc_oc=AQkGZRPHZJnG3Rb_zLEaFbmzzANhl8BoL4w69hjqk80FALB7xdDRP5s_wk0Kr-CgVxc&_nc_ht=scontent.fyhu1-1.fna&oh=09f8e261126a376ebc7bf1dbad63bb1b&oe=5DA6F83A)

The score is reported against the final snapshot of the bot, and "BB/100" means the number of big blinds won per 100 games. Limping is a strategy often employed by beginner players where the player bets the absolute minimum to stay in a hand. More advanced players prefer to be more aggressive.

# Results

Pluribus was tested against five poker professionals over 12 days where 10 000 hands were played. A prize of 50 000$ was divided amongst the human pros to incentivize them to play their best. Pluribus was estimated to have a win rate of 5 BB/100, which means an average of 5$ per hand. 

![](https://scontent.fyhu1-1.fna.fbcdn.net/v/t39.2365-6/67271157_2381364728803152_1411046105633783808_n.gif?_nc_cat=108&_nc_oc=AQkwmbRhLvih96_6zPLvU0MmxlBDcgQxiOGFXfxmdH8auVeTmlyqS93kzZN6aV-GoYo&_nc_ht=scontent.fyhu1-1.fna&oh=9a72ad5d926103dc0f0859f770cb420e&oe=5DA6A805)

And here it is in action

[![](/article/images/pluribus/thumbnail2.jpeg)](https://www.facebook.com/FacebookAI/videos/2087259478050682/)


# Remarks

- Pluribus tends to do "donk betting", where a player starts a round with a bet after ending the other with a call, a lot, which is contrarian to the folk wisdom saying it is not a good idea to do so.

- On the opposite, it confirmed that limping is not a good strategy.

- A lot of feedback coming from human pros seems to be that Pluribus plays in very differently from humans.

[Supplmentary materials](https://science.sciencemag.org/content/sci/suppl/2019/07/10/science.aay2400.DC1/aay2400-Brown-SM.pdf) (includes pseudo code and a most of the technical stuff)
[Blog post](https://ai.facebook.com/blog/pluribus-first-ai-to-beat-pros-in-6-player-poker/)
[HN discussion](https://news.ycombinator.com/item?id=20414905)
