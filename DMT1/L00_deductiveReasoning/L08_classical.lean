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
Now prove P ∨ ¬P.
@@@ -/

example : P ∨ ¬P :=

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

  Or.inl
  (
    -- P is some Prop. We have no proof of it.
    -- That's the end of the line; quit
    _
  )

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
can't deduce its truth from the axioms of the logic we've been using
for most of the semester.

To prove ¬(P ∧ Q) → (¬P ∨ ¬Q) constructively, we would need to decide
which disjunct holds. But from ¬(P ∧ Q) alone, we only know that P and
Q can't both be true simultaneously. We don't have enough information
to determine whether:

- P is false (left disjunct), or
- Q is false (right disjunct), or
- both are false

@@@ -/

/- @@@
## Excluded Middle Implies Remaining DeMorgan

Homework: Formalize and prove that statement in Lean.
@@@ -/
