# Welcome to DMT1: Discrete Math Foundations for New Computer Scientists

## Some Forms of Reasoning

- Abductive
- Inductive
- Deductive

### Abductive Reasoning

Abductive reasoning is a form of logical inference where you start with an observation (or set of observations) and then look for the most plausible explanation. It’s often summarized as “inference to the best explanation.” Abduction hypothesizes an explanation that could make the observed facts true (plausible, but not guaranteed).

Example: If you walk outside and the ground is wet, you might abductively reason that it has rained. Other explanations are possible (sprinklers, someone washing a car), but rain may seem the most plausible.

Abduction is central in everyday reasoning: medical diagnosis, scientific discovery, and even debugging software: you notice an error, then propose the most likely cause, and next you test your hypothesis by placing the program under test and observing its behaving. If your first hypothesis was wrong, you try again. If it was right, now you know what's wrong, and that goes a long way to figuring out how to fix

### Inductive Reasoning

Inductive reasoning is about generalizing from particular cases to broader patterns or rules. Inductive reasoning underlies much of science, statistics, and machine learning. Inductive reasoning helps us to make good predictions (with survival value!) based on past experience.

Everyday you've seen the sun rise, so you might infer that the sun always rises. You measure a chemical reaction happening under certain conditions in multiple trials, so you might infer a more general law of chemistry. A machine fails whenever it overheats → you infer that overheating is more than a little likely the cause of failure.

### Deductive Reasoning: Of a Constructive Kind

Deductive reasoning is a process of deriving of necessary conclusions from given logical assumptions using specified rules of inference. In constructive logic, deduction must construct evidence (a proof) for the conclusion from evidence (proofs) for the assumptions.

In class we saw that to construct a proof of a proposition, P ∧ Q, one must have a proof (call it p) of the proposition, P, and one must have a proof (call it q) of the proposition Q.

Now contemplate a proof of P ∨ Q (pronounced P OR Q). To construct such a proof requires either a proof of P or a proof of Q but not both (though it is fine if both are available).

The inference rules of deductive logic correspond directly to *programs* that take proofs (and often other values) as arguments, and return proofs as results. If you grasp this point, it will make learning the small zoo of inference rules to come much easier. They're like a subroutine library.
