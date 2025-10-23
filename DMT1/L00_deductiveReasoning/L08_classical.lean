/- @@@

# Classical vs Constructive Disjunction

## Classical

In classical logic and ordinary intuition for
many people, *especially* for programmers who
have grown up on the *Boolean* abstraction, it
is self-evident that any factual statment (any
proposition) is either true or false. If it's
one, it's not the other, and it has to be one
of the two.

In this logic, if one is given proposition, *P*,
of unknown truth/validity, there are just two
cases one ever has to consider: one where *P* is
true, one where *P* is false. For example, when
we program, we need code for only *two* branches
of an *(if)* statement. There are just two cases
for which you need code to get to good endings.

In classical logic, given a proposition, P,
it's *axiomatic* that *P = true ∨ P = false*
is true. To be mathematically more precise,
we'll introduce the notation, *⟦P⟧*, to mean
*the value of P*. Now we can properly state
the point: *it's an axiom of classical logic*
that *⟦P⟧ = true ∨ ⟦P⟧ = false*. (Again, use
the words *the value of* to pronounce ⟦·⟧,
now return and read it outloud to yourself.)

### Constructive

Is this axiom of *classical* logic an axiom
we've met so far in constructive logic? No,
it's not. It's not among the introduction or
elimination rules for any of the connectives
we've seen so far; and the only one we have
left is the existential, *∃ (a : α), P a*.
So, no, it's not an axiom in this logic.

Is it a theorem? From our constructive axioms
we've been able to prove numerous important
and interesting theorems, including, e.g., that
*And* (∧) and *Or* (∨) are both *commutative*
and *associative*. It seems reasonable to try
to prove *{P : Prop} : P ∨ ¬P* similarly. Ok
so let's try.

Let *P* be any proposition.
@@@ -/


axiom P : Prop

/- @@@
Assuming only that P is a proposition, can we
prove P ∨ ¬P?
@@@ -/

-- UNCOMMENT TO EXPLOER PROOF ATTEMPT
-- example : P ∨ ¬P :=
--   Or.inl
--   (
--     -- P is some Prop. We have no proof of it.
--     -- That's the end of the line; quit
--     _
--   )

/- @@@
Given only this assumption, can we prove
*P ∨ ¬P*? The rub is in the difference between
accepting *P ∨ ¬P* as an *axiom* (always true),
or insisting on evidence one way or the other
to justify the conclusion that one or the other
is actually in-real-life true. The problem then
is that to get a proof of *P ∨ ¬P* you have to
have either a proof of *P* or a proof of *¬P*
from which to build a proof of *P ∨ ¬P*, and
no one's handing out free proofs of arbitrary
propositions, or of their negations.
Ok but let's at least see how far we can get.

At this point we have to choose Or.inl or
Or.inr. Or.inl requires a proof of P, but
we don't have one. Or.inr requires a proof
of Q but we don't have one. Let's go left
one more step. Then that's it. Stuck!
@@@ -/


/- @@@
### The Law (Axiom) of the Excluded Middle

A crucial property of classical logic is that
given any proposition, is either truth or false.
There is no muddled middling state. But in the
constructive logic of Lean, if you don't have
either have a proof that *P* is true or a proof
that *¬P* is true, then you do not know that
*P ∨ ¬P* is. This is a muddled middle state
of unknown truth value in constructive logic.

It's also the state dispensed with by the *law
of the excluded middle*. That phrasing makes it
sound like something imposed by an authority,
but it's really just an axiom you can include
in your logic or not.

Lean provides such an axiom in the Classical
namespace. If you *open* that you'll have
direct access to *Classical.em*, stipulating
*∀ (P : Prop), P ∨ ¬P* as an axiom.

In terms of constructive logic reasoning the
way to think about this is that if all you
know is that *P* is some proposition, and
you really need to finish your proof with a
case analysis with *P* true (and a proof of
it) in one case, and *¬P* true in the other
case (with a proof of it), then what you do
is apply *em* to *P* to get a *free* proof
of *P ∨ ¬P*. You then do a case analysis on
the result. The code pattern will usually
look like this:

match (Classical.em P) with
|  p => _    -- in this case p proves P
| np => _    -- in this case np proves ¬P

If you  want classical reasoning, just
use *Classical.em*. If you *open* the
*Classical* namespace, you can just write
*em P*.
@@@ -/

#check Classical.em P
-- a proof of P ∨ ¬P for free!

/- @@@
## Why Reject Some Axioms

There are innumerable variant logics that
mix  and match a variety of such axioms. Adding
axioms usually enlarges the set of propositions
that can be proved as theorems.

So why would anyone want fewer propositions to
be provable as theorems? Well, if from the axioms
you can prove really weird ____ (RWS), then you
might want to reject as self-evident the axioms
that enabled such terrible logical creatures to
emerge, by deduction!, from self-evident truths.

For example ...

we interrupt for a special announcement. Prof.
Sullivan did not have time to type the following
himself, so he let his humanoid robot do it for
him. Just remember that as in photography real
greatness is in the selection of just exactly
what to shoot (photographically, of course).

So here you go.

First, I pointed my camera with this prompt:
What's a great example of a weird or monstrous
theorem in mathematics enabled by acceptance
of certain non-constructive axioms?

You see. If you had not been patient enough
to sit in my class, you'd have no conceivable
path to posing just that question. But now
you do. So, you can practice using your new
capability to take much more interesting
shots than you ever would have before. Here
what then skittered across my screen.

This material has been written about hundreds
if not thousands of times in the digital record,
so we can at least reasonably hope that what we
get back will stand a good chance of being not
too wrong.

Thank you to the many original sources.

The Robotic response is basically what I'd have
written. No outsourcing of thinking. I knew
exactly what I wanted and was able to express
it fluently. Expertise still matters. One can
reasonably believe it matters even more.

GPT Response:

The Banach-Tarski Paradox is perhaps the
most gloriously monstrous example!

The Statement: You can take a solid 3D ball, decompose it into finitely many pieces, and then reassemble those pieces using only rotations and translations into two solid balls, each the same size as the original.

This seems to violate conservation of volume in the most egregious way possible—you're literally doubling matter through pure rearrangement! But
it's a theorem if you accept the so-called
Axiom of Choice in your logic. That axiom says
roughly that if you've got an infinite list
of sets that you can form a new set with one
member from each set in that infinite list even
if you don't have a method for *choosing* one
specific element from any one of those sets.

Seems totally reasonable. But if you accept it
you also have to accept that logical monter, the  Banach Tarski "paradox." Most mathematicians accept the axiom of choice and other such assumptions.

The Non-Constructive Culprit: This result relies on the so-called *Axiom of Choice* (AC), particularly in constructing the truly bizarre decompositions. The pieces are *non-measurable sets* of points in 3D space. They're so pathological that you can't assign them a meaningful volume. They don't have integrals in the usual sense.

The proof uses AC to:

- Create subset of the sphere's surface
- Build these unmeasurable pieces that can be rotated and rearranged in contradictory ways

It's a monstrous theorem because:

- The pieces have no volume in any meaningful sense.
- You cannot actually describe or construct them in the real world
- It's purely an existence proof: AC guarantees such decompositions exist, but provides no algorithm to find them

## The Constructivist Objection

Mathematicians who reject AC (like constructivists and some intuitionists) don't accept this paradox and therefore reject the axiom of choice. Without it, you can actually prove that such "paradoxical decompositions are impossible for measurable sets. They'd argue: "If you can't construct these pieces explicitly, why should we believe they exist?"

In the constructive logic of Lean and other such
proof assistants, the core logic comes with zero
non-constructive axioms. If you want to assume
them, you easily can. Just declare them as axioms
and have a good time.

As you might suspect, however, there are tradeoffs.
Accepting more axioms could make more propositions]provable; but in practice not carrying around proofs
that explain *why* propositions are true, there's a
lot you can't do. Being able to generate code that
is *proven correct* for all inputs, even when their number is infinite is one good case. Proofs contain
code and code can contain and handle proofs. More on
this later, perhaps.

END OF (lightly edited) GPT RESPONSE.
@@@ -/



/- @@@
## Not All DeMorgan Laws Are THeorems Constructively
As another example of a theorem in Boolean algebra,
propositional logic, and classical predicate logic,
both of DeMorgan's famous theorems are demonstrably
valid.

- #1: Not Over Or Iff And Over Nots: ¬(P ∧ Q) ↔ (¬P ∨ ¬Q)*
- #2: Not Over And Iff Or Over Nots: ¬(P ∨ Q) ↔ ¬P ∧ ¬Q

Each of the two theorems is an equivalence, which
means (constructively) that a proof of it gives
you proof/truth of the implication in each direction.
So if you have a proof for one direction, then you
can derive  a proof for the other. So really we
have four claims.

- #1A: ¬(P ∧ Q) → (¬P ∨ ¬Q)
- #1B (¬P ∨ ¬Q) → ¬(P ∧ Q)
- #2A: ¬(P ∨ Q) →  ¬P ∧ ¬Q
- #2B: ¬P ∧ ¬Q → ¬(P ∨ Q)

We'll now see which of these propositions are valid
(have proofs) constructively.

## DeMorgan #1: Not Over Or ↔ And Over Nots

The proposition is ¬(P ∧ Q) ↔ (¬P ∨ ¬Q)*. It's
valid because both directions are constructively
valid.

### Forward Direction
@@@ -/

theorem demorgan_or_to_and {P Q : Prop} : ¬(P ∨ Q) → (¬P ∧ ¬Q) :=
  (
    fun (nporq : ¬(P ∨ Q)) =>
    (
      And.intro
      (
        fun p =>
        (
           nporq (Or.inl p)
        )
      )
      (
        fun q =>
        (
          nporq (Or.inr q)
        )
      )
    )
  )
--  fun h => ⟨fun hp => h (Or.inl hp), fun hq => h (Or.inr hq)⟩

/- @@@
### Reverse Directin
@@@-/

theorem demorgan_and_to_or {P Q : Prop} : (¬P ∧ ¬Q) → ¬(P ∨ Q) :=
(
  fun h =>
  (
    fun porq =>
    (
      let np := h.left
      let nq := h.right
      match porq with
      | Or.inl p => let f := (np p); nomatch f
      | Or.inr q => nq q
    )
  )
)
--  fun ⟨hnp, hnq⟩ hpq => hpq.elim hnp hnq

/- @@@
### Equivalence: ¬(P ∨ Q) ↔ (¬P ∧ ¬Q)
@@@ -/
theorem demorgan_or_iff {P Q : Prop} : ¬(P ∨ Q) ↔ (¬P ∧ ¬Q) :=
(
  Iff.intro
    demorgan_or_to_and
    demorgan_and_to_or
)
--  ⟨demorgan_or_to_and, demorgan_and_to_or⟩

/-@@@
## #2: The Hard DeMorgan Law

¬(P ∧ Q) vs (¬P ∨ ¬Q)

### Forward Direction

@@@ -/
theorem demorgan_or_neg_to_neg_and {P Q : Prop} : (¬P ∨ ¬Q) → ¬(P ∧ Q) :=
(
  fun h =>
  (
    fun pandq =>
    (
      let p := pandq.left
      let q := pandq.right
      Or.elim h
      (
        fun np =>
        (
          np p
        )
      )
      (
        sorry   -- You can finish this
      )
    )
  )
)
--  fun h ⟨hp, hq⟩ => h.elim (fun hnp => hnp hp) (fun hnq => hnq hq)

-- DeMorgan #2, Reverse Direction (This One's Trouble)
-- Commented out to eliminate failed build problems (details)
-- theorem not_a_theorem { P Q : Prop } : ¬(P ∧ Q) → (¬P ∨ ¬Q) :=
-- fun h =>
-- (
--   Or.inl
--   (
--     fun p => _   -- Understand this proof state! Cannot finish proof.
--   )
-- )

/- @@@
One direction is constructively valid. The other direction is not. In
constructive predicate logic¬(P ∧ Q) → (¬P ∨ ¬Q) is not a theorem. We
can't deduce its truth from the axioms of constructive predicate logic
we've been studying for most of the semester. But there's good news, too.
@@@ -/

/- @@@
## Classical vs Intuitionistic Logic

∀ (P Q :Prop), ¬(P ∧ Q) → ¬P ∨ ¬ Q.

Valid or no? It seems right. In English one
can express the prosition as sayting that *if*
it's not the case that both P and Q are true
*then* either P us false or Q is false. Seems
logical.

### Classical

Indeed, in classical (essentially Boolean-value,
truth-theoretical) logic, it is a valid statement.
It's a theorem. There is no world in which this is
a false statement. You can rely on it as a valid
way to reason in any world.

One form of proof in classical logic is by truth
table. With just two possible truth values for each
proposition, and a finite number of propositions,
there's always but a finite (though possibly very
large) number of cases to consider.

This truth table shows that *¬(P ∧ Q) → (¬P ∨ ¬Q)*
is true in every possible world, where a world is
modeled as capable being in some number of Boolean
states (e.g., isCold, isDark, isWindy).

| P | Q | P ∧ Q | ¬(P ∧ Q) |  ¬P |  ¬Q | ¬P ∨ ¬Q | ¬(P ∧ Q) → (¬P ∨ ¬Q) |
| - | - | :---: | :------: | :-: | :-: | :-----: | :------------------: |
| T | T |   T   |     F    |  F  |  F  |    F    |           T          |
| T | F |   F   |     T    |  F  |  T  |    T    |           T          |
| F | T |   F   |     T    |  T  |  F  |    T    |           T          |
| F | F |   F   |     T    |  T  |  T  |    T    |           T          |

### Constructive

On the other hand, this proposition cannot be
proved to be valid in Lean without an explicit
addition of new inference rules as new axioms.
In classical logic, ∀ P : Prop, P ∨ ¬P is valid
as it's an axiom, but in constructive logic you
need a proof of P or a proof of ¬P to construct
a proof of P ∨ ¬P.

We can't prove this variant of DeMorgan's laws
because from a proof that *not both P and Q are
true* we can't derive either a proof that ¬P is
true or a proof that ¬Q is true, so we lack what
is required to construct a proof of ¬P ∨ ¬Q.

Uncomment the following code to explore it.
@@@ -/

-- example { P Q : Prop } : ¬(P ∧ Q) → ¬P ∨ ¬ Q :=
-- (
--   fun (h : ¬(P ∧ Q)) =>
--     Or.inl _
-- )


/- @@@
The core logic of Lean is constructive. It does
not assume axioms that are strong enough to make
our favorite of DeMorgan's laws a theorem.

There are multiple places in the predicate logic
Lean provides where the axioms are weaker than in
classical logic. We say they're weaker precisely
because they require more information to construct
a proof (e.g., of P ∨ Q), and so are able to prove
fewer theorems.

Another example, concerns the meaning of (∃). The
question is what's required to conclude that some
particular thing of some particular kind *exists*.
*∃ (x : X), Y* asserts there exists some such *x*
in the context of which *Y* is true. For example,
I might claim that *there exists life elsewhere*,
writted, *∃ (life : Life), (FromElsewhere life)*.

To prove this in constructive logic I'd have to show
you two things: first, an actual lifeform, and second
compelling evidence that it's from elsewhere.  But in
everyday mathematical reasoning (mostly classical) it
is fine to show that a crazy mathematical thing exists
just by showing that it can't not exist, *without* any
need to put an actual alien on the table for everyone
see (or talk to, or maybe run from).

How about you? Would you accept that life exists
elsewhere in the universe if all I gave you was a
proof that it can't not exist? Or would you demand,
before believing, an actual certified alien (not to
mention proof that it's really from elsewhere)?
Are you okay with classical reasoning, or would you
demand to see a real alien before you'd accept the
truth of alien life forms? Now you know whether you
are at heart a classicist or a constructivist when
it comes to mathematical (or even astrobiological)
truth.

### Classical Reasoning in Lean

Most mathematicians use classical axioms without
a second thought. ¬¬P always means P, for example,
in everyday mathematics. So how could anyone be a
happy mathematician and still use Lean. It seems
like it's missing something very fundamental? But
no! It's trivial to add assumptions in Lean. We've
been doing it all semester.

If you want to make an assumption globally, you
can use the axiom keyword. You can always make an
assumption globally by making it argument of a
function, in which case it's assumed to hold only
within the body of that function.

As an example, we used the *axiom* keyword in class
to introduce *em : ∀ P, P ∨ ¬P* as an axiom globally.
But we could also assume a proof this proposition as
an argument, *em*, to a function, then use it only
within that function.

The last homework assignment asked you actually to
prove that *excluded middle implies DeMorgan's law
for Not over And*

### In class
@@@ -/


-- Uncomment: Not a theorem in constructive logic
-- example : ∀ P : Prop, P ∨ ¬P :=
-- fun P =>
-- Or.inr _   -- stuck!

-- But we can just stipulate it as an axiom
-- UNCOMMENT to check out but comment it out again when done
-- axiom em : ∀ P : Prop, P ∨ ¬P

/- @@@
#### Quick Note on *sorry*

Warning. Whenever you use *sorry* to escape having
to give a proof right at the moment, you're telling
Lean to admit the proposition to be proved, whatever
it is, as an axiom. Be careful with that not to admmit
something as an axiom making the logic inconsistent.
@@@ -/

/- @@@
#### Excluded Middle Into Or Elimination: Two Cases

Applying excluded middle first to P then to Q reduces
the problem to analysis of just four cases (just like
in a truth table: both P and Q true, P true and Q false,
P false and Q true, and both P and Q false.

Before considering the proof in Lean, just think about
it truth theoretically.
-If P and Q are both true, then we don't have to think beyond the premise, ¬(P ∧ Q), because *in this case* it's false.
- If P is true and Q is false, then  ¬P ∨ ¬Q is true by right introduction on falsity of Q.
- If P is false then whether Q is true or not ¬P ∨ ¬Q is true by left introduction on the falsity of P.

Here's the corresponding formal *and machine-checked*
proof construction in Lean. @@@ -/

example { P Q : Prop } : ¬(P ∧ Q) → ¬P ∨ ¬Q :=
(
  fun (h : ¬(P ∧ Q)) =>             -- Assume premise
  let pornp := Classical.em P       -- Excluded middle!
  match pornp with                  -- Case analysis: P ∨ ¬P
  | Or.inl p =>                     -- Cases where P true
      match (Classical.em Q) with   -- Case analysis Q ∨ ¬Q
      | Or.inl q =>                 -- case P true and Q true
        False.elim (h (And.intro p q))  -- contradicts premise
      | Or.inr nq => Or.inr nq      -- P true and ¬Q true (easy)
  | Or.inr np => Or.inl np          -- ¬P true (easy, Q irrelevant)
)

/- @@@
#### Excluded Middle Implies Fourth DeMorgan Theorem

Here's a variant of the precising reasoning that's
fully responsive to the homework assignment: to show
that *excluded middle implies ¬(P ∧ Q) → ¬P ∨ ¬Q.*
Just write it as an implication and prove it by the
usual means.
@@@ -/

example { P Q : Prop } :
  (∀ P : Prop, P ∨ ¬P)              -- Excluded middle ...
  →                                 -- ... implies ...
  (¬(P ∧ Q) → ¬P ∨ ¬Q) :=           -- DeMorgan's classical case
(
  fun em =>                           -- Assume em as local axiom
    fun (h : ¬(P ∧ Q)) =>             -- Assume premise
    let pornp := em P                 -- Use local E.M. axiom
    match pornp with                  -- Case analysis: P ∨ ¬P
    | Or.inl p =>                     -- Cases where P true
        match (em Q) with             -- Case analysis Q ∨ ¬Q
        | Or.inl q =>                 -- case P true and Q true
          False.elim (h (And.intro p q))  -- contradicts premise
        | Or.inr nq => Or.inr nq      -- P true and ¬Q true (easy)
    | Or.inr np => Or.inl np          -- ¬P true (easy, Q irrelevant)
)

/- @@@
Voila! You're advancing rapidly now!

Oh, Homework.

## HOMEWORK

#1: Try to prove negation elimination in Lean.
That's the axiom of classical logic that makes
*∀ P, ¬¬P → P* always true. It's what allows you
to conclude, classically, that if it's impossible
for aliens not to exist then aliens exist! But
in Lean, we're more conservative. Try to prove
this principle is valid in Lean 4. You won't be
able to. Understand where you got stuck. Leave
you incomplete proof commented out with a quick
comment explaining exactly why you get stuck.

#2. Provide that if you accept (assume) the axiom
of the excluded middle, then negation elimination
is valid.

### Negation Elimination (Proof by Contradiction)

The axiom of Negation introduction says that if
you prove P → False, then you can deduce ¬P. This
is called *proof by negation*. Your goal in proof
by negation is to prove *a negation*. It would be
better called *by proof `of` negation*.

By contrast, one proof by contradiction, using
negation elimination, seeks to prove P by proving
that it's impossible for it to be false.

- P
- ¬P    -- P is false, P is impossible¸
- ¬¬P   -- ¬P is false, ¬P is impossible

Again, one uses proof by contraction to prove
P by proving that ¬P is impossible. If you show
that ¬P is impossible, you've proved ¬P → False,
thus by definition ¬¬P. The fundamental question
is whether you can deduce P from that! Id you
are reasoning classically, yes; constructively,
no.
@@@ -/

/- @@@
We looked at this theorem as a warmup to this
class. Is not P equivalent to P → False? Yes,
and intuitively you just say one is defined to
be the other so they have to be equivalent.
But we can do better and be completely precise.
First, express the proposition precisely. Then
construct a proof of it "as usual".

You should really annotate this entire proof
with English language explanation
@@@ -/

-- Worked out (to reinforce your own learning)
example : ∀ P, ¬P ↔ P → False :=
  fun (_ : Prop)=>
  (
    Iff.intro
    (
      fun np =>
        fun p =>
          (np p)
    )
    (
      fun pimpf => pimpf
    )
  )
