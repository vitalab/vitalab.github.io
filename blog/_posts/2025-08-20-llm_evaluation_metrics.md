---
layout: review
title:  "A Survey of LLM Evaluation Metrics"
tags:   deep-learning machine-learning
author: Pierre-Marc Jodoin
---


Large Language Models (LLMs) are increasingly applied to critical domains such as **medical report generation**, where accuracy and trust are essential. Evaluating the quality of generated text is non-trivial: surface word matches may miss key semantic errors, while semantic metrics may overlook domain-specific mistakes.  
This review goes through four categories of evaluation metrics, using a consistent medical example to illustrate their differences:  


> **Reference report**: "The chest X-ray shows evidence of pneumonia. No pleural effusion is present."  
> **Generated report**: "The lungs show infection, and a small pleural effusion is visible."

---

## LLM Evaluation Metrics

### 1. Lexical Overlap Metrics (BLEU, ROUGE)

**BLEU (Bilingual Evaluation Understudy)**  
  - **Equation**:  
    $$
    \text{BLEU-n} = BP \cdot \exp\left( \sum_{n=1}^{N} w_n \log p_n \right)
    $$  
    where $$p_n$$ = precision of n-gram overlap, $$w_n$$ = weights (often uniform), $$BP$$ = brevity penalty.  
  - **Range**: 0 (no overlap) → 1 (perfect overlap).  
  - In our example: → unigram overlap is low → BLEU-1 near **0.32**.  

The reason for 0.32 with n=1.

**Reference report**:
"The chest X-ray shows evidence of pneumonia. No pleural effusion is present."

= 12 tokens

**Generated report**:
"The lungs show infection, and a small pleural effusion is visible."

= 10 tokens

Overlap between generated and reference unigrams:

* "the" ✅
* "pleural" ✅
* "effusion" ✅
* "is" ✅

That’s 4 matches out of 10 candidate tokens.   If we set BP = 0.8 (could also be computed), we get that $$BLEU-1=BP*p_1=0.8*0.4=0.32$$.

**ROUGE (Recall-Oriented Understudy for Gisting Evaluation)**  
  - **Equation (ROUGE-N)**:  
    $$
    \text{ROUGE-N} = \frac{\text{Count}_{\text{match}}(n\text{-grams})}{\text{Count}_{\text{reference}}(n\text{-grams})}
    $$  
  - **Range**: 0 (no recall) → 1 (perfect recall).  
  - Example: both texts contain *“pleural effusion”* → ROUGE-2 ≈ **0.33**, despite opposite clinical meaning.  

The reason for 0.33 is :

**Reference bigrams** (selected for relevant parts):

* “evidence of”
* “of pneumonia”
* “no pleural”
* “pleural effusion”
* “effusion is”
* “is present”

**Generated bigrams** (selected for relevant parts):

* “show infection”
* “a small”
* “small pleural”
* “pleural effusion”
* “effusion is”
* “is visible”

Both contain “pleural effusion” and “effusion is” so 2 matches out of 6 = $$0.33$$

**References**  
- ROUGE overview: [Wikipedia](https://en.wikipedia.org/wiki/ROUGE_(metric))  
- BLEU explained: [medium.com](https://medium.com/data-science-in-your-pocket/llm-evaluation-metrics-explained-af14f26536d2)
---

### 2. Semantic Similarity Metrics (METEOR, BERTScore)

- **METEOR**  
  - **Equation**:  
    $$
    \text{METEOR} = F_{mean} \cdot (1 - Penalty)
    $$  
    where $$F_{mean} = \frac{10 \cdot P \cdot R}{R + 9P}$$, with precision $$P$$, recall $$R$$.  
  - **Range**: 0 → 1. Higher = better alignment (including synonyms/paraphrases).  
  - Example: maps *“infection”* ↔ *“pneumonia”* → METEOR ≈ **0.6**, better than BLEU.  

- **BERTScore**  
  - **Equation**:  
    $$
    \text{BERTScore}(c, r) = \frac{1}{|c|} \sum_{x \in c} \max_{y \in r} \cos(e(x), e(y))
    $$
    where $$c$$ = candidate tokens, $$r$$ = reference tokens, $$e(\cdot)$$ = embeddings.  
  - **Range**: -1 → 1 (usually reported 0–1).  
  - Example: *“small pleural effusion”* vs. *“No pleural effusion”* → embeddings capture negation, score ≈ **0.3** (low similarity).  

**References**  
- METEOR overview: [Wikipedia](https://en.wikipedia.org/wiki/METEOR)  
- BERTScore explained: [Medium blog](https://rumn.medium.com/bert-score-explained-8f384d37bb06)  

---

### 3. Clinical Accuracy Metrics (Sensitivity, Specificity, F1)

- **Entity/Label Metrics**  
  - Reports mapped to structured labels (e.g., pneumonia present/absent).  
  - **Equations**:  
    - Sensitivity (Recall):  
      $$
      \frac{TP}{TP + FN}
      $$  
    - Specificity:  
      $$
      \frac{TN}{TN + FP}
      $$  
    - F1-Score:  
      $$
      \frac{2 \cdot TP}{2 \cdot TP + FP + FN}
      $$  
  - **Range**: 0 → 1. Higher = better classification.  
  - Example: Reference = pneumonia **present**, effusion **absent**. Generated = pneumonia **present**, effusion **present**.  
    - Sensitivity (pneumonia) = 1.0  
    - Specificity (effusion) = 0.0  
    - F1 (overall) = lower than 1.  

**References**  
- RadGraph dataset: [PhysioNet project](https://physionet.org/content/radgraph/1.0.0/)  
- CheXbert labels: [Stanford CheXbert GitHub](https://github.com/stanfordmlgroup/CheXbert)  

---

### 4. Human-Centric & Readability Metrics

- **Readability (Flesch Reading Ease)**  
  - **Equation**:  
    $$
    RE = 206.835 - 1.015 \cdot \frac{\text{words}}{\text{sentences}} - 84.6 \cdot \frac{\text{syllables}}{\text{words}}
    $$  
  - **Range**: 0 (very hard) → 100 (very easy).  
  - Example:  
    - *“The chest X-ray shows pneumonia”* → RE ≈ 80 (easy).  
    - *“Evidence of parenchymal infiltrates consistent with pneumonia”* → RE ≈ 30 (difficult).  

- **Human Expert Ratings**  
  - **Method**: clinicians assign Likert scores (1–5) for factual accuracy, clarity, completeness.  
  - **Range**: typically 1 (poor) → 5 (excellent).  
  - Example: Generated report with hallucinated effusion would score **1–2** for accuracy despite decent BLEU/METEOR.  

**References**  
- Readability overview: [Wikipedia – Flesch Reading Ease](https://en.wikipedia.org/wiki/Flesch%E2%80%93Kincaid_readability_tests)  
- Human eval in NLP: [Evidently AI guide](https://www.evidentlyai.com/llm-guide/llm-evaluation-metrics)  

---

## Conclusion
This example illustrates why **no single metric suffices**.  
- **Lexical metrics** (BLEU, ROUGE) measure surface overlap but miss meaning.  
- **Semantic metrics** (METEOR, BERTScore) capture paraphrasing yet may misjudge domain-specific errors.  
- **Clinical metrics** directly validate factual correctness of findings.  
- **Human/readability metrics** ensure clarity and trustworthiness.  

A robust evaluation of LLM-generated **medical reports** requires a **hybrid pipeline**, combining automated and human-centered approaches to capture accuracy, semantics, and usability.

---

## Comparison Table of Metrics

| **Category** | **Metric** | **Equation (simplified)** | **Range** | **Strengths** | **Weaknesses** | **Medical Example Outcome** |
|--------------|------------|---------------------------|-----------|---------------|----------------|-----------------------------|
| **Lexical Overlap** | **BLEU** | \( BLEU = BP \cdot \exp\big(\sum w_n \log p_n\big) \) | 0–1 | Fast, standard, language-independent | Fails on synonyms/paraphrases | Low score (~0.2) since “infection” ≠ “pneumonia” |
|              | **ROUGE-N** | \( \text{ROUGE-N} = \frac{\text{match n-grams}}{\text{ref n-grams}} \) | 0–1 | Good recall measure, common in summarization | Matches words even if meaning opposite | Medium score (~0.5) since “pleural effusion” overlaps despite negation difference |
| **Semantic Similarity** | **METEOR** | \( \text{METEOR} = F_{mean} \cdot (1 - Penalty) \) | 0–1 | Rewards synonyms/stemming | Limited synonym coverage | Medium score (~0.6), gives credit to “infection” ≈ “pneumonia” |
|              | **BERTScore** | \( \frac{1}{|c|}\sum_{x\in c}\max_{y\in r}\cos(e(x),e(y)) \) | -1–1 (often 0–1) | Captures paraphrase & context | Heavy compute, domain-limited embeddings | Low score (~0.3), detects mismatch between “small effusion” vs. “no effusion” |
| **Clinical Accuracy** | **Sensitivity** | \( \frac{TP}{TP+FN} \) | 0–1 | Checks if positives are correctly found | Ignores negatives | Pneumonia correctly flagged → 1.0 |
|              | **Specificity** | \( \frac{TN}{TN+FP} \) | 0–1 | Checks absence detection | Ignores positives | Effusion wrongly added → 0.0 |
|              | **F1 Score** | \( \frac{2TP}{2TP+FP+FN} \) | 0–1 | Balances precision/recall | Needs labeled data | Drops due to false effusion |
| **Human & Readability** | **Flesch Reading Ease** | \( 206.835 - 1.015\frac{W}{S} - 84.6\frac{Sy}{W} \) | 0–100 | Objective readability | Not clinical-specific | “Chest X-ray shows pneumonia” → ~80 (easy); “parenchymal infiltrates…” → ~30 (hard) |
|              | **Expert Ratings** | Likert 1–5 | 1–5 | Captures trust, nuance | Expensive, subjective | Radiologist flags effusion error → ~2 |

---
