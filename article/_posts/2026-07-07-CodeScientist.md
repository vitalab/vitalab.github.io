---
layout: review
title: "CodeScientist: End-to-End Semi-Automated Scientific Discovery with Code-based Experimentation"
tags: Automated Scientific Discovery, LLM Agents, Genetic Search
author: "Arnaud Judge"
cite:
    authors: "Peter Jansen, Oyvind Tafjord, Marissa Radensky, Pao Siangliulue, Tom Hope, Bhavana Dalvi Mishra, Bodhisattwa Prasad Majumder, Daniel S. Weld, Peter Clark"
    title:   "CodeScientist: End-to-End Semi-Automated Scientific Discovery with Code-based Experimentation"
    venue:   "Findings of ACL 2025"
pdf: "https://aclanthology.org/2025.findings-acl.692.pdf"
---

# CodeScientist

CodeScientist is a semi-automated scientific discovery system that frames ideation and experiment construction as a *genetic search* jointly over combinations of research papers and reusable codeblocks, then autonomously builds, runs, reports, and meta-analyzes code-based experiments (with light human input to select and comment on ideas).

## Background

Authors highlight the two main issues in ASD systems:

1. **Constrained design spaces.** Existing systems mostly explore variants of existing codebases or otherwise restricted spaces, limiting the diversity and novelty of their discoveries.
2. **Weak evaluation of artifacts.** Outputs (papers and code) are typically judged only by conference-style paper review, with little scrutiny of the code — so a paper's *claims* can diverge from what its code actually does.

They also note two methodological challenges: **evaluating discoveries** (no gold outcomes at the edge of knowledge, so review is expensive or relies on imperfect LLM judges) and **variability** (LM pipelines rarely reproduce the same ideas/code/results across runs).

## Method


![](/article/images/codescientist/codescientist-overview.png)

The pipeline has five stages, mostly implemented as LLM prompts. 
It takes two human-curated inputs: a corpus of papers in the target domain and a small library of example codeblocks.

Codeblocks are reusable snippets for common tasks, e.g. calling an LLM, creating a plot, running a benchmark, etc.

1. **Ideation.** An LLM acts as a mutation/crossover operator in a genetic search, generating candidate ideas from combinations of papers and codeblocks. Conditioning on codeblocks biases ideas toward ones the builder can actually implement. Each idea is structured, with a hypothesis, variables, metrics, baselines, and a pilot design.
2. **Planning.** A human selects a promising subset of ideas and adds brief comments; the planner then turns each idea into a concrete experiment plan and a list of codeblocks needed to implement it.
3. **Experiment building & execution.** A generate–execute-reflect loop writes the artifact and experiment code, runs it in an sandbox (capturing logs, output, and API usage/cost), and debugs iteratively until it completes or hits a limit. It first runs a cheap pilot, then scales to the full experiment.
4. **Reporting.** Successful runs are summarized into a written report plus a short summary that flags whether the hypothesis was *confirmed*, *rejected*, or *inconclusive*.
    - Reports are summarized further for human analysis.
5. **Meta-analysis.** Each plan is run N times (5 here) to counter LM variability, and a meta-analysis aggregates the runs into an overall verdict on the hypothesis.

## Experiments

The system was run in the domain of **agents and virtual environments**, using a corpus of 57 papers and 10 example codeblocks, with benchmarks like TextWorldExpress and DiscoveryWorld and Claude-Sonnet-3.5 as the base model. From ~2000 generated ideas, a domain expert selected 50, each run 5 times → 250 experiments (avg ~$4 and ~2h each). The generated artifacts were things like ReAct agents with graph/memory augmentations, new tasks/benchmarks, metrics, and statistical analyses.

These environments are text-based interactive loops. In *CookingWorld*, for example, the agent gets a goal ("make a fried apple"), reads text observations of its surroundings, issues text actions (`open fridge`, `cook apple with stove`), and earns score as sub-goals are met — cheap to simulate, so agents can be compared over many episodes automatically.

Of the 250 runs, only 41% completed successfully. CodeScientist flagged 19 discoveries; 13 passed external conference-style review, but only **6 survived the internal code review + replication** — e.g. that an LLM's self-assessed confidence correlates poorly with its state-prediction accuracy, and that LLMs are weak at predicting action success from a single observation. All 6 were judged incremental rather than transformational.

Example; one of the 6 validated discoveries:

| Field | Content |
|---|---|
| **Discovery** | State Prediction Confidence |
| **Hypothesis** | An LLM's self-assessed confidence in a state-prediction task will correlate with its actual accuracy. |
| **Setup** | Crawl ~200 state-prediction pairs from a benchmark; prompt the LLM to predict a state property and score its confidence (0–1). |
| **Finding** | Correlation is consistently low → confidence does *not* track accuracy. Hypothesis **rejected**. |
| **Verdict** | Judged minimally sound and incrementally novel (extends confidence-calibration findings to state prediction in virtual environments). |

### Faithfulness and failure modes

The key finding is that **paper-level review is not enough**: 7 of 13 externally-approved discoveries were rejected on code inspection. 
A recurring failure is *unfaithful* code — e.g. a "graph verification agent" that reported outperforming a baseline while its code never actually used the graph, picking actions randomly (result #12). Such bugs may be one line in a long program and are laborious to catch. Other failures: effects vanishing when rerun with more samples, weak baselines, and poor adherence to research practices (evaluating on the training set, misusing statistics) even when prompted otherwise.

### Human input vs. fully-automated

Humans are involved at 5 points (papers, codeblocks, idea selection, comments, final validation). A fully-automated pilot on 100 ideas yielded only ~2 candidate discoveries (2%), and dropping just the expert comments cut candidate discoveries by roughly a third (6 → 4). The authors caveat that the sample is small and system variance high, so this may partly reflect noise rather than the comments alone.


## Interpretation and conclusion

CodeScientist is a nice step toward broader automated discovery: grounding ideation in a *combination* of literature and executable codeblocks pushes the system past mere benchmark tweaking and lets it propose genuinely diverse artifacts (new tasks, metrics, agents).

Only relying on conference-style paper review is insufficient for code-based discovery, since more than half of the paper-approved results fell apart under code inspection.

That same result is the main cautionary note: the effective yield is low (6 incremental discoveries from 250 runs), and faithfulness bugs are hard to detect at scale, so the human-in-the-loop steps (idea selection, comments, code-level validation) remain load-bearing rather than optional.


