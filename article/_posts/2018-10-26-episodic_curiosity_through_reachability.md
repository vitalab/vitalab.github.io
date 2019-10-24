---
layout: review
title: "Episodic curiosity through reachability"
tags: deep-learning reinforcement
author: "Antoine Théberge"
cite:
    authors: "Nikolay Savinov, Anton Raichuk, Raphaël Marinier, Damien Vincent, Marc Pollefeys, Timothy Lillicrap, Sylvain Gelly"
    title:   "Episodic curiosity through reachability"
    venue:   "Arxiv"
pdf: "https://arxiv.org/abs/1810.02274"
---

## The idea

Reinforcement learning agents struggle in sparse reward environments. Curiosity, rewarding the agent when it explores, has already been thought of and implemented. The authors theorize that simple curiosity alone is not enough and the agent should only be rewarded when it sees novel observations.

## The method

![](/article/images/episodic_curiosity_through_reachability/curiosity.jpg)
![](/article/images/episodic_curiosity_through_reachability/model.jpg)

The agent keeps track of novel observations that it has seen and estimates how much the current observation is novel. If it is estimated to be novel enough, the agent is rewarded and the observation is kept in memory.

## The results
![](/article/images/episodic_curiosity_through_reachability/rooms.jpg)
![](/article/images/episodic_curiosity_through_reachability/convergence.jpg)
![](/article/images/episodic_curiosity_through_reachability/reward.jpg)

The agent was given 9 actions: move forward/backward, turn left/right, strafe left/right, turn left or right and move forward, fire. The observations are RGB values from the screen. The first figure in this section is the room setup they used. Sparse, very sparse in this context means that the reward was placed further than the agent's spawn point. Sparse + doors means that keys were placed around the environment and the agent was rewarded for finding keys and opening doors. No reward means that the task completion bears no reward (to encourage exploration) and the only reward the agent receives is self-given through curiosity. No reward - fire means (quite unintuitively) that the agent has his fire action, which produces a blue circular thing, removed as well as having no task reward. This is to discourage the agent of just staying still and firing at the walls. Dense is similar to the second figure, but the agents were placed closer to the reward.

[Videos](https://sites.google.com/view/episodic-curiosity)




