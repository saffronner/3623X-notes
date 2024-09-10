#set page(numbering: "1/1")
#set text(font: "CMU Serif")
#show "•": set text(font: "")
#show math.nothing: set text(font: "");

= intro
- foreshadowing/context: under all prob computations are _sample spaces_
- rarely work with sample spaces directly, unless they're simple (heads/tails)
  - (so, we start here)

= what is prob?
- objective prob: long run freq of occurrence (eg heads in coin flip)
  - often called frequentist/classical methods. 
  - used more often in undergrad CMU
- subjective prob: a possibly informed belief in rate of occurrence of event
  - can called bayesian 

= set notation
- $A supset B, A subset B , A union B , A sect B , overline(A) "aka" A^C$
- let the set of all experimental outcomes $Omega = A union overline(A)$
- $A sect B = nothing ==> A "and" B "are mutually exclusive aka disjoin"$
- distributive/associative laws
- de morgan's ($overline(A union B) = overline(A) sect overline(B)$, etc)

= what are experiments?
- make observations
- passive: just collect data
- active: control setting 
- sample space ($Omega$)
  - two coins tossed? $Omega = {"HH", "HT", "TH", "TT"}$
    - HH is simple event
    - TH is compound event ("at least one tail")
  -  free throws until miss? $Omega = {"M, HM, HHM," ...}$
  - relative freqs of above? don't know! need more info

= probability
== sample space probabilities
- conditional probability: $A$, when we know $B$
#image("media/conditional_probability.png")
- $A$ and $B$ are independent
  - iff $P(A | B) = P(A)$
  - iff $P(B | A) = P(B)$
  - iff $P(A sect B) = P(A) P(B)$
- if there are three events, $A$ and $B$ are _conditionally_ independent
  - if $P(A sect B | C) = P(A | C)P(B | C)$
  #image("media/independence.png")

- multiplicative law:
  $
  P(A sect B) &= P(A)P(B | A) = P(B)P(A|B) \
  &= 0 "if" A,B "disjoint" \
  &= P(A)P(B) "if" A,B "independent"
  $
  #image("media/n-long_multiplicative_law.png")

- additive law:
  $
  P(A union B) &= P(A) + P(B) - P(A sect B) \
  &= P(A) + P(B) "if" A,B "disjoint" \
  &= P(A) + P(B) - P(A)P(B) "if" A,B "independent"
  $

- decision trees: good for when probabilities change 
  - eg picking colored balls without replacement, not like probability of heads of fair coin
  #image("media/decision_tree_ex.png")

- for these next two, let ${B_i}$ be a partition of $Omega$.

- law of total probability.
  $
  P(A) = sum^k_(i=1) P(A|B_i)P(B_i)
  $
  #image("media/law_of_total_prob.png", width: 25%)
  - "probability of $B_1$. then times the probability that $i$ landed in $A$, in $B_1$, etc etc"
  - helpful when given conditional probs but not $A$ itself

- Bayes' Rule: 
  $
  P(B_j|A) = (P(A|B_j)P(B_j))/(sum^k_(i=1)P(A|B_i)P(B_i)) = (P(A|B_j)P(B_j))/P(A)
  $
  #image("media/bayes's_rule_ex.png")

== other probability paradigm??
- need better paradigm for continuous situations/nondiscrete outcomes: random variables, prob distributions

- random variable: like a function, maps events in $Omega$ to, eg, real number line (the output. meters ran maybe)
  - but tbh just think of random variables as their outputs
  - can have diff random variables for same experiment: number of tails observed, number of heads, whether not heads observed
  - denoted with uppercase Latin eg $X$, $P(X=x)$

- functions of random variables are random variables! _statistics_ are _functions of data_ are _random variables_

- expected value operator $E[X] = mu$
  - $E[c X] = c E[X]$
  - $E[c] = c$
  - $E[x + y] = E[x] + E[y]$

- variance operator $V[X] = sigma^2$
  - $V[X] = E[(x-mu)^2] = "(simplifies to)" E[X^2] - (E[X])^2$
  - variance is not width, but the square of the width. think about units of $V[X]$ vs units of $E[X]$

- translation/scaling's effects on mean and variance: ($X -> X + b$)
  - $E[X + b] = E[X] + b$ (translation shifts mean)
  - $E[a X] = a E[X]$ (scaling shifts mean multiplicatively)
  - $V[X + b] = V[X]$ (translation doesn't effect width)
  - $V[a X] = a^2 V[X]$ (scaling widens exponentially. verify via shortcut formula)

- properties of discrete and continuous prob distributions
#table(
  columns: 3,
  stroke: none,
  align: horizon,
  table.vline(x: 1),
  [], [Discrete], [Continuous], 
  table.hline(),
  [Name], [pmf: probability mass function], [pdf: probability density function],
  table.hline(),
  [Symbol], [$p_X (x)$], [$f_X (x)$],
  table.hline(),
  [Properties], 
  [$ 0 <= p_X (x) <= 1 $], [$ f_X(x) >= 0 $],
  [],[$ display(sum_("all" x)) p_X (x) = 1 $], [$ integral_("all" x) f_X (x)d x = 1 $],
  [],[$ P(a <= X <= b) = sum_(x in [a,b])p_X (x) $], [$ P(a <= X <= b) = integral_a^b f_X (x) d x $],
  [],[$ P(a < X < b) = sum_(x in (a,b)) p_X (x) $], [$ P(a < X < b) = integral_a^b f_X (x) d x $],
  [],[$ E[X] = sum_("all" x) x p_X (x) $], [$ E[X] = integral_("all" x) x f_X (x) d x $],
  [],[$ E[g(x)] = sum_("all" x) g(x) p_X (x) $], [$ E[g(x)] = integral_("all" x) g(x) f_X (x) d x $],
)
