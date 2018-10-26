---
layout: review
title: "Episodic curiosity through reachability"
tags: deep-learning reinforcement
author: "Antoine Théberge"
cite:
    authors: "Wei Yang, Xiaolong Wang, Ali Farhadi, Abhinav Gupta, Roozbeh Mottaghi5"
    title:   "Episodic curiosity through reachability"
    venue:   "Arxiv"
pdf: "https://arxiv.org/abs/1810.02274"
---

## The idea

Reinforcement learning agent struggle in sparse reward environment. Curiosity, rewarding the agent when it explores has already been thought of and implemented. The authors theorize that simple curiosity alone is not enough and the agent should only be reward when it sees novel observations.

## The method

![](/deep-learning/images/episodic_curiosity_through_reachability/curiosity.png)
![](/deep-learning/images/episodic_curiosity_through_reachability/model.png)

The agent keeps track of novel observations that it has seen and estimates how much the current observation is novel. If it is estimated to be novel enough, the agent is rewarded and the observation is kept in memory.

## The results
![](/deep-learning/images/episodic_curiosity_through_reachability/rooms.png)
![](/deep-learning/images/episodic_curiosity_through_reachability/convergence.png)
![](/deep-learning/images/episodic_curiosity_through_reachability/reward.png)

The agent was given 9 actions: move forward/backward, turn left/right, strafe left/right, turn left or right and move forward, fire. The first figure in this section is the room setup they used. Sparse, very sparse in this context mean that the reward was placed further than the agent's spawn point. Sparse + doors means that keys were placed around the environment and the agent was rewarded for finding keys and opening doors. No reward means that the task completion bears no reward (to encourage exploration). No reward - fire means (quite unintuitively) that the agent had his fire action, which produces a blue circly thing, was removed as well as having no task reward. Dense is similar to the second figure, but the agents were placed closer to the reward.




