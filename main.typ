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
  - NO INHERENT NOTION OF PROBABILITY!

- functions of random variables are random variables! _statistics_ are _functions of data_ are _random variables_

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
  [$ 0 <= p_X (x) <= 1 $], [$ f_X (x) >= 0 $],
  [],[$ display(sum_("all" x)) p_X (x) = 1 $], [$ integral_("all" x) f_X (x)d x = 1 $],
  [],[$ P(a <= X <= b) = sum_(x in [a,b])p_X (x) $], [$ P(a <= X <= b) = integral_a^b f_X (x) d x $],
  [],[$ P(a < X < b) = sum_(x in (a,b)) p_X (x) $], [$ P(a < X < b) = integral_a^b f_X (x) d x $],
  [],[$ E[X] = sum_("all" x) x p_X (x) $], [$ E[X] = integral_("all" x) x f_X (x) d x $],
  [(law of \ unconscious \ statistician)],[$ E[g(x)] = sum_("all" x) g(x) p_X (x) $], [$ E[g(x)] = integral_("all" x) g(x) f_X (x) d x $],
)

- expected value operator $E[X] = mu_X$, mean of the distribution $X$ was sampled from
  - $E[c X] = c E[X]$
  - $E[c] = c$
  - $E[x + y] = E[x] + E[y]$

- variance operator $V[X] = sigma^2$
  - $V[X] = E[(x-mu)^2] = "(simplifies to)" E[X^2] - (E[X])^2$
  - apparently $V[x + y] = V[x] + V[y]$??? sep 18 class example 2
  - variance is not width, but the square of the width. think about units of $V[X]$ vs units of $E[X]$

- translation/scaling's effects on mean and variance: ($X -> X + b$)
  - $E[X + b] = E[X] + b$ (translation shifts mean)
  - $E[a X] = a E[X]$ (scaling shifts mean multiplicatively)
  - $V[X + b] = V[X]$ (translation doesn't effect width)
  - $V[a X] = a^2 V[X]$ (scaling widens exponentially. verify via shortcut formula)

#pagebreak(weak: true)
- cumulative distribution function (cdf)
  - accumlated prob up to $x$, inclusive
  #table(
    columns: (7em, 1fr, 1fr),
    stroke: none,
    align: horizon,
    table.vline(x: 1),
    [], [Discrete], [Continuous], 
    table.hline(),
    [Symbol], [$F_X (x)$], [$F_X (x)$],
    table.hline(),
    [Definition], [$ F_X (x) = sum_(y <= x) p_Y (y) $], [$ F_X (x) = integral_(-infinity)^x f_Y (y) d y $],
    table.hline(),
    [Limiting Properties], table.cell(colspan: 2, align: center)[for both, $F_X (-infinity) = 0$ and $F_X (infinity) = 1$],
    table.hline(),
    [Reln to pmf/pdf], [$ p_X (x) "is magnitude of jump"\ "in" F_X (x) "at coord" x $], [$ f_X (x) = d/(d x) F_X (x) $],
    table.hline(),
    [Reln to Quantile $q$], [$ X = "min"{x : F_X (x) >= q} $], [$ "inverse cdf," X = F_X^(-1) (q) $],
    table.hline(),
    [Reln to Prob. Over Range], [$ "It's complicated." $], [$ &P(a <= X <= b)\ = &P(a < X < b)\ = &F_X (b) - F_X (a) $]
  )

  - inverse cdf: given total prob $q$ to left of (and including) some $x_0$, what is $x_0$?
    #table(
      columns: 3, 
      stroke: none,
      align: horizon,
      table.vline(start: 1, x:1),
      table.vline(start: 1, x:2),
      [],[input],[output], 
      [cdf],$ x_0 $, $ q $,
      table.hline(),
      [inverse cdf], $ q $, $ x_0 $
    )

=== families of distributions
- up till now, practice problems have fixed $theta$ in equations. we often have to find it. (use law of total prob)
- deriving from Law of Total Prob ($P(A) = sum^k_(i=1) P(A|B_i)P(B_i)$) if we know
  - $p_(X|theta) (x|theta)$ 
  - with $theta$ weights from $p_Theta (theta)$,
  $
  p_X (x) = sum_theta p_(X|theta) (x|theta) p_Theta (theta)
  $
  - if $theta$ is continuous, we may just use an integral
  - #image("media/lotp_randomvariable.png")

#pagebreak(weak: true)
- plotting such a pdf: $f_X (x) = integral^infinity_0 theta x^(theta - 1) dot e^(-theta) d theta$
  ```R
  x   <- seq(0.001,1,by=0.001) 
  f.X <- rep(NA,length(x))     

  f <- function(theta,x) {
    return(theta*x^(theta-1)*exp(-theta))
  }
  for ( ii in 1:length(x) ) {  # we loop over x's indices (1, 2, ..., length(x))
    f.X[ii] <- integrate(f,0,Inf,x=x[ii])$value
  }

  # Now let's plot!
  library(ggplot2)
  df <- data.frame(x,f.X)
  ggplot(data=df,mapping=aes(x=x,y=f.X)) + 
    geom_line(col="firebrick") +
    ylim(c(0,3)) + 
    ylab(expression(f[X]*"(x)"))
  ```

=== data sampling code
- inverse-transform sampling
  + sample a $q in (0,1)$. (e.g. `runif()`, random uniform)
  + plug $q$ into $x = F_X^(-1) (q)$, record $x$
  + repeat $n$ times for a sample size of $n$
- rejection sampling
  + choose finite domain $[a,b]$ for $f_X (x)$ that's good enough
  + let $"max"(f_X (x)) = m$
  + repeat until $n$ samples recorded:
    + randomly sample $x' in  [a,b]$ and $y' in [0,m]$.
    + if $y' <= f_X (x')$, keep the data point. otherwise, reject it and continue
- see `media/data_sampling.Rmd`

=== statistics
- iid: independant and identically distributed

- reiterating: these are just functions of observed data
  - $Y = X_1 + cos(X_2) - (X_37)/pi$ is a statistic, but not informative
  - $overline(X) = 1/n sum_(i=1)^n X_1$ is as well, and is informative of $mu$
  - $S^2 = 1/(n-1) sum^n_(i=1) (X_1 - overline(X))^2$ is informative of $sigma^2$

- statistics are random variables!!!

  - drawn from sampling distributions (which are just pmfs/pdfs)file:///home/saffron/Downloads/36235%20exam3/all.pdf

- sample mean, stddev, range, median

- $E[overline(X)] = E[X]$, $V[overline(X)] = (V[X])/n$ hold for all distributions

- standard error is the width of the distribution; the standard deviation of a statistic; $sqrt(V[Y])$, where $Y$ is a random variable/sampling distribution/pmf or pdf for a statistic

- expected value of the sample variance $S^2$ is $sigma^2$ after LOTS of math
  - this is Wednesday: Statistics and Sampling Distributions class example 1
  - why is $1/(n-1)$ there? create an unbiased example of the population estimate??

=== likelihood function
- the likelihood function quantifies how likely a $theta$ is given our data
- let it be defined:
  $
  cal(L)(theta | arrow(X)) = product^n_(i=1) f_X (x_i | theta)
  $
  for continuous data, simply using $p_X (x_i | theta)$ for discrete

- notice that 
  #image("media/likelihood_function.png")

- why? in inference, we want to estimate $theta$ given data! so we maximize $cal(L)$ for $theta$

- to make math easier, we use the log-likelihood $cal(l)(theta | arrow(X)) = log cal(L)(theta | arrow(X))$

=== bias and variance
- bias: $B[hat(theta)] = E[hat(theta) - theta] = E[hat(theta)] - theta$
  - estimator biased: $B[hat(theta)] = 0$, unbiased $B[hat(theta)] != 0$

- variance: $V[hat(theta)]$ (recall defn above)

- mean-squared error (MSE): $"MSE"[hat(theta)] = E[(hat(theta)-theta)^2] =_"simpl to" V[hat(theta)] + (B[hat(theta)])^2$
  - select "best" estimator by taking the one with lowest MSE

=== Maximum Likelihood Estimation
- procedure (it's literally just AP Calc maximization):
  + find $cal(L) (theta | arrow(X))$
  + find $cal(l) (theta | arrow(X))$
  + compute $cal(l)'(theta | arrow(X))$, partial or normal with respect to $theta$
  + solve the above equal to 0 for $theta$, now called $hat(theta)_"MLE"$ (also replace $x_i$ with $X_i$)

- this does not work with domain-specifying parameters (e.g. $f_X (x) = 1/theta "for" x in [0, theta]$)

- property of MLEs: invariance property
  - if $theta' = g(theta)$, then $hat(theta)'_"MLE" = g(hat(theta)_"MLE")$
  - e.g., .0 what

=== more abt confidence intervals
$P(hat(theta)_L <= theta <= hat(theta)_R)$ where the theta HATS are the r.v.s!

point estimates dont need sampling distributions! point estimates do!

when doing the math, finding lower and upper bound should be the same thing except having a swapped $q$


=== erm.
we skipped a bunch of notetaking. it's exam 3 time.

