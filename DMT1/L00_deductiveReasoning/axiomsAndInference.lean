/- @@@
# Deductive Reasoning : The Case of Conjunction
@@@ -/
namespace DMT1.L00_reasoning

/- @@@
## Propositions

Assume that P, Q, and R are arbitrary propositions.
Another name for an assumption accepted without proof
is an *axiom*. This is mathematically correct lingo.

We can express axioms in the logic of Lean using
the *axiom* keyword. Here we *stipulate* (state as
an axioms to be accepted without further evidence)
that P, Q, and R are arbitrary (any) propositions.
@@@ -/
axiom P : Prop      -- assume P is a proposition
axiom Q : Prop      -- assume Q is a proposition
axiom R : Prop      -- assume R is a proposition

-- Use the #check command to check for yourself!
#check P            -- a proposition!
#check 5            -- a natural number!
#check "Hello!"     -- a string

/- @@@
## Proposition Builders: The Case of *And*
With P, Q, and R accepted axiomatically as propositions,
we can form exponentially growing larger propositions
by the iterated (repeated) application of *And.intro* to
increasingly large sub-propositions as arguments, starting
with the elementary propositions we just assumed we will
be given. All we need now is to be able to give short
names to large expressions. So here we go.
@@@ -/

/- @@@
In Lean, we can give names to arbitrary terms and then
use those names anywhere we *mean* those terms. Here we
bind the identifier (name), *n*, to the natural number,
five, usually written as *5* in Lean. Evaluating the
expression, *n* then reduces to the value it's bound to,
namely, *5*.

@@@ -/

def n : Nat := 5    -- n is a Nat, with 5 as a witness
#eval n             -- n evaluates to *5*
#reduce n           -- reduce works too
#eval n + 5         -- all kinds of expressions reduce


/- @@@
In Lean, propositions are terns (objects, values), too,
so we can give propositions names, too. Here, we bind the
name *PandQ* to the proposition, P ∧ Q, as its value. We
then use #reduce to evaluate *PandQ* to it's meaning, with
a mysterious bit of syntax intructs Lean to reduce names
for propositions into the propositions they name. Later
we'll see that propositions are types in Lean, at which
point the inscrutibility of this little snippet of code
will resolve.
@@@ -/

def PandQ : Prop := P ∧ Q
#check PandQ
#reduce (types := true) PandQ


/- @@@
We've already discussed proofs. Let's now assume that we have
a few and see what we can do with them. In particular, let's
assume that we have proofs (proof objects), p, q, and r, proving
P, Q, and R, respectively. Here's how we now say that *formally*.
@@@ -/

axiom p : P
axiom q : Q
axiom r : R

-- All is as expected
#check P    -- a proposition
#check p    -- a proof of it


-- Construct proof of P ∧ Q using And.intro
def pq :    P ∧ Q    :=  And.intro p q
def pq' :   P ∧ Q    :=  ⟨ p, q ⟩

-- Construct nested proofs of nested propositions
def p_qr :  P ∧ (Q ∧ R)  :=  And.intro p (And.intro q r)
def p_qr' :  P ∧ (Q ∧ R)  :=  ⟨ p, ⟨ q, r ⟩ ⟩

-- Here with the nesting in the other order
def pq_r :  (P ∧ Q) ∧ R  :=  And.intro (And.intro p q) r
def pq_r' :  (P ∧ Q) ∧ R  :=  ⟨ ⟨ p, q ⟩, r ⟩

-- Just 6 applications of ∧ gets us 64 Ps!
#reduce (types := true)
  let C0 := P ∧ P
  let C1 := C0 ∧ C0
  let C2 := C1 ∧ C1  
  let C3 := C2 ∧ C2
  let C4 := C3 ∧ C3
  let C5 := C4 ∧ C4
  C5

/- @@@
## Proof Destructure-ers: aka Eliminators

Just as we have ways of composing proofs of smaller
propositions into proofs of larger ones, so we have
way to extract information from "larger" proofs that
we can assume we have or will be given. For example,
from a proof, ⟨ p, q ⟩ of P ∧ Q, it is easy to see
that we should be able to extract a proof (it's just
*p*) of *P*. What this means is that if P and Q are
any propositions whatsoever, P ∧ Q → P, and P ∧ Q → Q.
These are exactly the elimination rules for *And*.
In Lean, if one has a proof h, of the form *P ∧ Q*,
the *.left* is a proof of *P*, and *h.right* is one
for *Q*. You can chain *.left*  and *.right* function
applications to navigate to nested sub-proofs.~
@@@ -/

#check pq.left
#check pq.right
#check p_qr
#check pq_r
#check pq_r.right
#check pq_r.left
#check pq_r.left.left
#check pq_r.left.right

end DMT1.L00_reasoning
