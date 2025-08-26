---
layout: review
title:  "A Survey of LLM Evaluation Metrics"
tags:   deep-learning machine-learning
author: Pierre-Marc Jodoin
---



Large Language Models (LLMs) are increasingly applied to critical domains such as **medical report generation**, where accuracy and trust are essential. Evaluating the quality of generated text is non-trivial: surface word matches may miss key semantic errors, while semantic metrics may overlook domain-specific mistakes.  

This review goes through **five categories of evaluation metrics**, using a consistent medical example to illustrate their differences:

> **Reference report**: "The chest X-ray shows evidence of pneumonia. No pleural effusion is present."  
> **Generated report**: "The lungs show infection, and a small pleural effusion is visible."

---

### 1. Lexical Overlap Metrics (BLEU, ROUGE)

Lexical metrics evaluate how many words or short sequences (**n-grams**) in the generated text match those in the reference text. They do **not** consider synonyms or meaning.


## 1.1 ROUGE (Recall-Oriented Understudy for Gisting Evaluation)

- **Equation (ROUGE-N):**  
  $$
  ROUGE\text{-}N = \frac{\text{Count}_{\text{match}}(n\text{-grams})}{\text{Count}_{\text{reference}}(n\text{-grams})}
  $$

- **Range:** 0 (no recall) → 1 (perfect recall).  

- **Step-by-step medical example (unigram recall, ROUGE-1):**
     
  **Reference unigrams:**  
  *The*, *chest*, *X-Ray*, *shows*, *evidence*, *of*, *pneumonia*, *no*, *pleural*, *effusion*, *is*, *present* 

  **Generated unigrams:**
*The*, *lungs*, *show*, *infection*, *and*, *a*, *small*, *pleural*, *effusion*, *is*, *visible*

  **Matches:** *the*, *pleural*, *effusion*, *is* (4 matches).

  $$
  ROUGE\text{-}1 = \frac{4}{12} = 0.33
  $$

- **interpretation:** 
one-third of the reference words are recalled.


- **Step-by-step medical example (bigram recall, ROUGE-2):**

  **Reference bigrams:**  
  *The chest*, *chest X-Ray*, *X-Ray shows*, *show evidence*, *evidence of*, *of pneumonia*, *no pleural*,*<u> pleural effusion, effusion is</u>*, *is present*  

  **Generated bigrams:**  
  *The lungs*, *lungs show*, *show infection*, *infection and*, *and a*, *a small*, *small pleural*,*<u> pleural effusion, effusion is</u>*, *is visible*  

  **Matches:** *pleural effusion*, *effusion is* (2 matches).  

  $$
  ROUGE\text{-}2 = \frac{2}{10} = 0.2
  $$

- **Interpretation:**  
  ROUGE finds overlap on the phrase *pleural effusion*, but cannot detect that *“no effusion”* and *“small effusion”* have opposite meanings. This inflates the score.


## 1.2 BLEU (Bilingual Evaluation Understudy)

- **Equation:**  
  $$
  BLEU = BP \cdot \exp\left( \sum_{n=1}^{N} w_n \log p_n \right)
  $$  

  where:  
  - $$p_n$$ = precision of n-gram matches  
  - $$w_n$$ = weights (commonly uniform, e.g., 0.5 for bigrams)  
  - $$BP$$ = brevity penalty  

- **Step-by-step medical example (BLEU-2):**

  1. **1-gram precision:**  
     Reference unigrams: 12 words  
     Candidate unigrams: 11 words  
     Matches: *The, pleural, effusion, is* (4 words)  
     $$
     p_1 = \frac{4}{11} \approx 0.36
     $$  

  2. **2-gram precision:**  
     Matches: *pleural effusion*, *effusion is* (2 out of 10)  
     $$
     p_2 = \frac{2}{10} = 0.20
     $$  

  3. **Brevity penalty:**  
     Reference length = 12, Candidate length = 11  
     $$
     BP = \exp\left(1 - \frac{12}{11}\right) \approx 0.91
     $$  

  4. **Final BLEU score:**  
     $$
     BLEU = 0.91 \cdot \exp\Big(0.5 \cdot \log(0.36) + 0.5 \cdot \log(0.20)\Big)\\
     BLEU \approx 0.25 
     $$

- **Interpretation:**  
  BLEU ≈ 0.25 is low, reflecting limited lexical overlap. However, it ignores that *infection* ≈ *pneumonia* semantically, and it cannot capture the **contradiction** between *“no effusion”* and *“small effusion”*.

---



### 2. Semantic Similarity Metrics (METEOR, BERTScore)

Semantic metrics attempt to evaluate **meaning**, not just word overlap. They consider synonyms, stems, or embeddings.  These methods **do not use n-grams**.


## 2.1 METEOR (Metric for Evaluation of Translation with Explicit ORdering)

- **Equation:**  
  $$
  METEOR = F_{mean} \cdot (1 - Penalty)
  $$  

  where:  
  - $$F_{mean} = \frac{10 \cdot P \cdot R}{R + 9P}$$ (recall weighted 9 times more than precision)  
  - $$P$$ = precision = matches / candidate length  
  - $$R$$ = recall = matches / reference length  
  - **Penalty** = fragmentation factor (scattered matches → larger penalty)

- **Step-by-step medical example:**

  1. **Word alignment:**  
     - Exact matches: *The, pleural, effusion, is*  
     - Synonym match via WordNet: *infection* ↔ *pneumonia* (c.f. [wordnet.princeton.edu](https://wordnet.princeton.edu/) for more details)
 
     → Total = 5 matches  

  2. **Precision and recall:**  
     $$
     P = \frac{5}{11} = 0.45, \quad R = \frac{5}{12} = 0.42
     $$  

  3. **F-mean:**  
     $$
     F_{mean} = \frac{10 \cdot 0.45 \cdot 0.42}{0.42 + 9 \cdot 0.45} \approx 0.42
     $$  

  4. **Fragmentation penalty:**  
  
    As for the $$Penalty$$, the equation is

    $$
    Penalty = \gamma \cdot frag^\beta    
    $$ 

    where *frag* stands for fragmentation ratio, a value based on the notion of "chunks".  In this example, the matches are in 3 chunks   
    * **Chunk 1:** *The*  
    * **Chunk 2:** *pleural effusion is*  
    * **Chunk 3:** *infection* ↔ *pneumonia* 

    Total matches: **m = 5** (The, pleural, effusion, is, infection↔pneumonia)  
    Number of chunks: **ch = 3**  
    Fragmentation ratio:  
    
$$
    frag = \frac{ch}{m} = \frac{3}{5} = 0.6
    $$   
       
    and if $$\gamma=0.5, \beta=3$$ (typical values) we get 
    
$$
     Penalty = 0.5 \cdot (0.6)^3 \approx 0.108
     $$  

  5. **Final score:**  
     $$
     METEOR = 0.42 \cdot (1 - 0.108) \approx 0.38
     $$  

- **Interpretation:**  
  METEOR (0.38) improves over BLEU (0.25) by using **WordNet** to give credit for *infection* ≈ *pneumonia*. However, it still penalizes scattered matches and does not fully capture the effusion contradiction.


## 2.2 BERTScore

- **Equation:**  
  $$
  BERTScore(c, r) = \frac{1}{|c|}\sum_{x \in c} \max_{y \in r} \cos(e(x), e(y))
  $$  

  where *c* is the list of candidate tokens, *r* is the list of reference tokens, and embeddings $$e(\cdot)$$ come from a pretrained model like BERT.

- **How it works:**  
  - Each word gets a **contextual embedding**.  
  - Similarities are based on **cosine similarity** of embeddings.  
  - Unlike BLEU/METEOR (and like METEOR), it does not need n-grams or WordNet.  

- **Step-by-step medical example:**
  - *infection* ↔ *pneumonia* → cos ≈ 0.7
  - *pleural (small)* ↔ *pleural (no)* → cos ≈ 0.4   
  - *effusion (small)* ↔ *effusion (no)* → cos ≈ 0.4  
  - *small/visible* ↔ *no/present* → cos ≈ 0.1
- Other matches (e.g., *lungs* vs *chest (X-ray)*) → cos ≈ 0.7  
- Averaging → BERTScore ≈ 0.3  

- **Interpretation:**  
BERTScore is harsher than METEOR because contextual embeddings **capture negation**. It penalizes the contradiction *“no effusion”* vs *“small effusion”* strongly, producing a lower score.

---

### 3. Clinical Accuracy Metrics (Sensitivity, Specificity, F1)

Clinical evaluation metrics assess the correctness of **medical findings**, not just the language. They require mapping reports to structured **labels** (done manually or via NLP pipelines like [CheXbert](https://techfinder.stanford.edu/technology/chexbert-radiologist-level-automated-radiology-report-labeler-using-deep-learning) or [RadGraph](https://datasets-benchmarks-proceedings.neurips.cc/paper/2021/file/c8ffe9a587b126f152ed3d89a146b445-Paper-round1.pdf)).


## 3.1 Definitions
- **Sensitivity (recall for positives):**  
$$
\frac{TP}{TP + FN}
$$  

- **Specificity (recall for negatives):**  
$$
\frac{TN}{TN + FP}
$$  

- **F1 score (balance of precision and recall):**  
$$
\frac{2TP}{2TP + FP + FN}
$$  


## 3.2 Medical Toy Example
- List of labels = {Pneumonia, Effusion}
- Reference: {Pneumonia = Present, Effusion = Absent}  
- Candidate: {Pneumonia = Present, Effusion = Present}  

 Pneumonia → True Positive (TP = 1, FN = 0) → Sensitivity = **1.0**  
 Effusion → False Positive (FP = 1, TN = 0) → Specificity = **0.0**  
 Overall → F1 = 2 / (2+1+0) ≈ **0.67**


## 3.3 Interpretation
- Sensitivity = 1.0 → no pneumonia cases were missed.  
- Specificity = 0.0 → effusion was falsely added (**hallucination**).  
- F1 ≈ 0.67 → score penalized by false positives.  

**Key point:** these metrics rely on **label extraction**. Without manually or automatically labeling *pneumonia* and *effusion*, the metric cannot know which words matter clinically.

---

### 4. Human-Centric & Readability Metrics

These metrics capture **clarity, usability, and trustworthiness**, not factual correctness.


## 4.1 Flesch-Kincaid Reading Ease
The Flesch-Kincaid Reading Ease score is given by:

$$
RE = 206.835 - 1.015 \cdot \frac{W}{S} - 84.6 \cdot \frac{Sy}{W}
$$

Where:  
- W  = total number of words  
- S  = total number of sentences  
- Sy = total number of syllables  


**Intuition behind each term**
- **Sentence length (W/S)**  
  - Longer sentences (more words per sentence) → harder to follow.  
  - So the coefficient **–1.015** penalizes long sentences.  

- **Word complexity (Sy/W)**  
  - Words with more syllables are harder to read.  
  - So the coefficient **–84.6** penalizes higher syllable density.  

- **Constant (206.835)**  
  - Ensures the scale typically falls between 0 and 100.  


**Scale**

| RE Score | Readability | 
|----------|-------------|
| 90-100   | Very easy   | 
| 60-70    | Standard    | 
| 30-50    | Difficult   | 
| 0-30     | Very hard   | 

**Reference-like text (simpler):**  
*"The chest X-ray shows pneumonia."*  
- Words \(W = 5\)  
- Sentences \(S = 1\)  
- Syllables \(Sy = 9\) (The=1, chest=1, X-ray=2, shows=1, pneumonia=4)  

$$
RE = 206.835 - 1.015 \cdot (5/1) - 84.6 \cdot (9/5)
$$  

$$
RE \approx 206.835 - 5.075 - 152.28 \approx 49.5
$$  

**Generated text (more complex):**  
*"Evidence of parenchymal infiltrates consistent with pneumonic infection is demonstrated."*  
- Words W = 11  
- Sentences S = 1
- Syllables $$Sy = 27$$   

$$
RE = 206.835 - 1.015 \cdot (11/1) - 84.6 \cdot (27/11)
$$  

$$
RE \approx 206.835 - 11.165 - 207.46 \approx -11.8
$$  


## 4.2 Expert Ratings
- Clinicians assign scores (1–5) on factual accuracy, clarity, completeness.  
- In our example, the hallucinated effusion report might score **1–2/5** for accuracy, even if BLEU/METEOR are moderate.  

---

### 5. Model-Based Metrics (Prometheus)

Unlike lexical, semantic, clinical, or readability metrics, **model-based methods** use an **LLM evaluator** (a model acting as a judge) to assess generated text. These methods aim to approximate **human judgment at scale**, capturing nuances like factual accuracy, reasoning, and coherence.


## 5.1 Prometheus

**Definition:**  
Prometheus is a family of **LLM-as-a-judge frameworks**. Instead of relying on fixed formulas like BLEU or ROUGE, a separate LLM (evaluator) is prompted with a **rubric** to rate the generated text across multiple dimensions:  
- Factual accuracy  
- Faithfulness to the reference  
- Coherence  
- Usefulness/appropriateness  

**Scoring Method:**  
- Candidate report and reference report are provided to the evaluator model.  
- The evaluator is asked to give **dimension-specific scores** (e.g., from 1 to 5, or 0 to 1).  
- Final score is the weighted sum of these dimensions.


**Medical Example**  
- **Reference:** "The chest X-ray shows evidence of pneumonia. No pleural effusion is present."  
- **Candidate:** "The lungs show infection, and a small pleural effusion is visible."  

Prometheus (if instructed to evaluate *accuracy* and *faithfulness*) might output:  
- Pneumonia ↔ infection → partial credit (score ~0.6)  
- Effusion contradiction (no ↔ small effusion) → strong penalty (score ~0.2)  
- Overall weighted score ≈ **0.4**  

**Interpretation:**  
Prometheus is a "black box" metric that recognizes **synonyms** like *infection ↔ pneumonia* but penalizes critical factual mistakes like hallucinated effusion, closer to how a clinician would judge.

---

## Conclusion

This analysis shows why **no single metric suffices**:  
- **Lexical metrics** (BLEU, ROUGE) → cheap but superficial.  
- **Semantic metrics** (METEOR, BERTScore) → capture synonyms and context, but may misjudge contradictions.  
- **Clinical metrics** (Sensitivity, Specificity, F1) → check factual correctness of findings, crucial for safety, need labels.  
- **Human/readability metrics** (expert rating, Flesch–Kincaid) → ensure clarity for clinicians and patients. 
- **Model-based metrics** → (Prometheus) leverage LLMs or structured evaluators as judges, offering more **holistic, human-like, and explainable assessments**. They are powerful for identifying critical errors and providing diagnostic insights, but come with higher complexity and cost.    The score of these metrics change depending on the LLM and the prompt used. 

A robust evaluation of medical LLMs must combine **more than one type of metrics**.

---

## References


### Individual Metric References
- **BLEU**: [Wikipedia – BLEU](https://en.wikipedia.org/wiki/BLEU)  
- **ROUGE**: [Wikipedia – ROUGE](https://en.wikipedia.org/wiki/ROUGE)  
- **METEOR**: [Wikipedia – METEOR](https://en.wikipedia.org/wiki/METEOR)  
- **BERTScore**: [Medium – BERTScore Explained](https://rumn.medium.com/bert-score-explained-8f384d37bb06)  
- **Flesch–Kincaid Readability Tests**: [Wikipedia – Flesch–Kincaid](https://en.wikipedia.org/wiki/Flesch%E2%80%93Kincaid_readability_tests)  

### General Overviews of Automatic Metrics
- ROUGE, BLEU, BERTScore: [Medium – LLM Evaluation Metrics Explained](https://medium.com/data-science-in-your-pocket/llm-evaluation-metrics-explained-af14f26536d2)  
- ROUGE, BLEU, METEOR, and BERTScore:  
  - [Plain English – Comprehensive Guide](https://plainenglish.io/blog/evaluating-nlp-models-a-comprehensive-guide-to-rouge-bleu-meteor-and-bertscore-metrics-d0f1b1)  
  - [DigitalOcean – Automated Metrics for Generated Text](https://www.digitalocean.com/community/tutorials/automated-metrics-for-evaluating-generated-text?utm_source=chatgpt.com)  
- ROUGE, BLEU, METEOR, BERTScore, and Prometheus:  
  - [Confident AI – LLM Evaluation Metrics](https://www.confident-ai.com/blog/llm-evaluation-metrics-everything-you-need-for-llm-evaluation)  


### Human-Centric & Readability Metrics
- **Flesch–Kincaid Readability in LLM Evaluation**: [PubMed – Evaluating the Readability of Patient Education Materials Revised by LLMs](https://pubmed.ncbi.nlm.nih.gov/39105460/)  
