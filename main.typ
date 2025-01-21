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

== families of distributions
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

== data sampling code
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

== statistics
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

== likelihood function
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

== bias and variance
- bias: $B[hat(theta)] = E[hat(theta) - theta] = E[hat(theta)] - theta$
  - estimator biased: $B[hat(theta)] = 0$, unbiased $B[hat(theta)] != 0$

- variance: $V[hat(theta)]$ (recall defn above)

- mean-squared error (MSE): $"MSE"[hat(theta)] = E[(hat(theta)-theta)^2] =_"simpl to" V[hat(theta)] + (B[hat(theta)])^2$
  - select "best" estimator by taking the one with lowest MSE

== Maximum Likelihood Estimation
- procedure (it's literally just AP Calc maximization):
  + find $cal(L) (theta | arrow(X))$
  + find $cal(l) (theta | arrow(X))$
  + compute $cal(l)'(theta | arrow(X))$, partial or normal with respect to $theta$
  + solve the above equal to 0 for $theta$, now called $hat(theta)_"MLE"$ (also replace $x_i$ with $X_i$)

- this does not work with domain-specifying parameters (e.g. $f_X (x) = 1/theta "for" x in [0, theta]$)

- property of MLEs: invariance property
  - if $theta' = g(theta)$, then $hat(theta)'_"MLE" = g(hat(theta)_"MLE")$
  - e.g., .0 what

== more abt confidence intervals
$P(hat(theta)_L <= theta <= hat(theta)_R)$ where the theta HATS are the r.v.s!

point estimates dont need sampling distributions! point estimates do!

when doing the math, finding lower and upper bound should be the same thing except having a swapped $q$


== erm.
we skipped a bunch of notetaking. it's exam 3 time.

== review of point estimation
- moment gen fn $M_X (t) = E[e^(t X)]$
  - if $Y = b + sum_(i=1)^n a_i X_i$, then $M_Y (t) = e^(b t)sum_(i=1)^n M_(X_i) (a_i t)$
  - match mgfs to match distributions
  - used for CIs and HTs
    - sum of $n$ indep normal r.v.s is a normal r.v.
    - sample mean of $n$ iid normal r.v.s is a normal r.v.
    - standardized normal r.v. ($(x-mu)/sigma$) is a standard normal r.v.
    - sum of $n$ squared standard normal r.v.s is $chi^2$ distr for $n$ deg of freedom

- general transformations of single random variable
  - given $f_X (x)$ and $U = g(X)$, what is $f_U (u)$?
  - why?
  - sqre of one std normal r.v. is $chi^2$ for 1 d.o.f.
  - in part, allows derivation of $t$ distr.

- distribution of $T = (overline(X) - mu)/(S \/ sqrt(n)) ~ t_(n-1) attach(->, t: "d") Z ~ N(0,1)$ as $n -> infinity$

- performance of point estimators
  - bias: $B[hat(theta)] = E[hat(theta) - theta] = E[hat(theta) - theta]$ (if bias tends to 0, asymptotically biased.)
  - variance: $V[hat(theta)]$
  - mean-squared error: $"MSE"[hat(theta)] = (B[hat(theta)])^2 + V[hat(theta)]$
  - consistency: tldr, whether $"MSE"[hat(theta)] -> 0$ as $n-> infinity$

- how can we get a good point estimator? Maximum Likelihood Estimation!
  - asymptotically unbiased
  - invariance property: $hat(g(theta))_"MLE" = g(hat(theta)_"MLE")$
  - maximuze $l$ (log-likelihood function)

== Cramer-Rao Lower Bound (CRLB) on variance
- valid when $n$ iid data from dist whose domain no depend on $theta$ and $hat(theta)$ unbiased.
- $V[hat(theta)] >= 1/(I_n ( theta)) = 1/(n dot I(theta))$
- where the Fischer information $I(theta) = - E[(delta^2)/(delta theta^2) log f_X (x | theta)]$ (p_X for discrete)

== Central Limit Theorem
- what if non-normal distributions but want infer about pop mean?
  - point estimates unaffected: don't need distr
  - CIs and HTs _are_, need sampl distrs.

- $overline(X) attach(->, t:"d") Y ~ N(mu, sigma^2/n)$

- ex: $n=100$ iid data from unknown dist with $mu=20, sigma^2 = 4$. Find $P(19.8 <= overline(X) <= 20.2)$
- ex: How many iid data do we need to draw from a dist with $mu = 10, sigma^2 = 2$ for $P(overline(X) < 10.2) > 0.9$?

== Confidence Intervals for norm dist parameters
- review:
  - two sided CI: a random interval that fulfills $P(hat(theta)_L <= theta <= hat(theta)_H) = 1 - alpha$
  - coverage: $100(1-alpha)%$ of eval'd intervals overlap $theta$
  - compute by: find statistic $Y$ with a $y_"obs"$. solve $F_Y (y_"obs" | theta) = q$ for parameter ($theta$), finding $q$ from the CI table

- now we must know how to uniroot it out

- ex: We draw $n=100$ iid data from unknown distribution with mean $mu$. have $overline(x)_"obs" = 10, S^2 = 9.$ find 95% two side CI for $mu$.

  trick! invoke CLT and just treat $S$ as $sigma$. proceed as expected with uniroot for compute step.
- ex: $n=8$ iid data from normal with mean $mu$, variance $sigma^2$. have $s^2_"obs"=6$. What is 90% upper bound on $sigma^2$?

== Hypothesis Tests again as well
- review:
  - preconceived notion about dist param $theta$ (e.g. normal mean). state that null hypothesis.
  - select a statistic $Y$ that informs $theta$, write down sampl dist given null, and see if $y_"obs"$ is consistent with null sampl distr.

- if $y_"obs"$ falls in a rejection region, decide to reject null (otherwise, fail to reject)
  - $P("reject null" | "null true") = alpha <--$ user-set Type I error
  - $P("fail to reject null" | theta "arb") = beta <--$ Type II error (function of $alpha, theta$)
  - $P("reject null" | theta "arb") = 1 - beta = "power"$

- Kolmorgorov-Smirnov (KS) test
  - $H_0 :$ observed data are from some continuous distribution
  - or $H_0:$ two datasets are from same continuous distribution
  #image("media/KS_test.png")

- Shapiro-Wilk test
  - stronger (more powerful) test
  - *only* for whether data are normally distributed
  - limited to $n<=5000$ data

=== lecture on p-value, power, the normal mean
- setting: let's say we want a hypothesis test about $mu$ after get $n$ iid data (we assume/know normally distr)

- null/alt hypotheses:
  
  $H_0 : & mu = mu_0\
   H_A : & mu < mu_0 "(lower-tail)"\
         & mu != mu_0 "(two-tail)"\
         & mu > mu_0 "(upper-tail)"$

- most common test statistic
  - $Y = overline(X)$
  - where $E[Y] = mu$, increases with $mu$

- what is sampl dist for that statistic?
  - $sigma^2$ known: $overline(X) ~ N(mu, sigma^2/n)$ or $(overline(X) - mu)/(sigma \/ sqrt(n)) ~ N(0,1)$
  - $sigma^2$ unknown: $(overline(X) - mu)/(S\/sqrt(n)) ~ t_(n-1)$

- do what with these dists?
  - solve for rr boundaries: $F_(overline(X)) (overline(x)_"RR" | mu_0) = q$
  - we fix $mu_0$ so we solve via `qnorm()`, not `uniroot()`.
  - use table!

- do we need $overline(x)_"RR", t_"RR"$ to decide reject/not? 
  - no! the $p$-value exists!

- $p$-value: prob that we observe $y_"obs"$ or "more extreme" statistic value, if $H_0$ is correct.
  - if $E[Y]$ incr with $theta$, then ...
    - lower: $p = P(Y <= y_"obs" | H_0)$
    - upper: $p = P(Y >= y_"obs" | H_0)$
    - lower: $p = 2 dot min[P(Y <= y_"obs" | H_0), P(Y >= y_"obs" | H_0)]$
    - can use cdf codes (e.g. `pnorm()`)
  - if $y_"obs" = y_"RR"$, then $p = alpha$
  - if $H_0$ is correct, then $p ~ "Uniform"(0,1)$, then $P(p <= alpha) = integral_0^alpha d p = alpha$ (think abt it! :3)
  - $p != $ prob that null correct! this makes no sense!
  - select $alpha$ before $p$. don't $p$ hack.

- ex: $n=9$ iid data from normal with mean $mu$ and variance $sigma^2 = 16$, $overline(x)_"obs" = 11, alpha = 0.05$. Find $p$ if $H_0 : mu = mu_0 = 10$ vs $H_A : mu > mu_0$

- test power: prob that we reject null given any (arb) value for $theta$
  - $"power"(theta) = P("reject null" | theta)$
  - implies $"power"(theta=theta_0) = alpha$
  - $y_"RR"$ NOT needed to compute $p$ but IS needed to compute power.

=== lecture on normal population variance
- setting: let's say we want a hypothesis test about $sigma^2$ after get $n$ iid data (we assume/know normally distr)

- null/alt hypotheses:
  
  $H_0 : & sigma^2 = sigma^2_0\
   H_A : & sigma^2 < sigma^2_0 "(lower-tail)"\
         & sigma^2 != sigma^2_0 "(two-tail)"\
         & sigma^2 > sigma^2_0 "(upper-tail)"$

- most common test statistic
  - $Y = S^2$
  - where $E[Y] = sigma^2$, increases with $sigma^2$

- what is sampl dist for that statistic?
  - $S^2 ~ ???$ (can be derived)
  - $W = ((n-1)S^2)/(sigma^2) ~ chi^2_(n-1)$

- do what with these dists?
  - solve for rr boundaries: $F_W (((n-1) S^2_"RR")/(sigma^2_0) | sigma_0^2) = q$
  - solve via `p/q chisq()`, not `uniroot()`.
  - use table!

TODO these have really weird examples, go check them out

== Simple Linear Regression
- predictor/indep/explanatory/feature vs response/dependent/target

- general model: $Y_i | x_i = f(x_i) + epsilon_i$

- in simple linear regression, $Y_i = beta_0 + beta_1 X_i + epsilon_i$
  - (note: linear means linear in parameters. $... b_1 X^2_i ...$ _is_ linear)

- $E[Y_i] = beta_0 + beta_1 X_i$
- $V[Y_i] = sigma^2$ by assumption

- each observed $Y_i$ is random variable sampled from *some* distribution w/ mean 0, constant variance $sigma^2$

- the regresion line is $hat(Y)_i = hat(beta)_0 + hat(beta)_1 X_i = $ expected value of $Y_i$ :0

- residuals are $e_i = Y_i - hat(Y)_i = Y_i - hat(beta)_0 - hat(beta)_1 x_i$

- convention: estimate beta params by minimizing sum of squared errors (SSE) $= sum^n_(i=1) e_i^2$
  - both beta hats via SSE are unbiased, consistent estimators

- some R interpretation thus far:
  #image("media/lm_1.png")

- is  there a significant reln bt x and Y?
  - $H_0 : &beta_1 = 0\
     H_A : &beta_1 != 0$

- to test this, we _finally_ need that distributional assumption (usually, the normal)

- i.e., our error assumptions are now:
  - $E[epsilon_i] = 0$
  - $V[epsilon_i] = sigma^2$
  - $epsilon_i ~ N$ for mu  and sigma above

- correlation bt two r.v.s is $rho_(X Y) = ("Cov"(X,Y))/sqrt(V[X]V[Y]),
|rho_(X Y)| <= 1$.
  - Cov covered in Ch 6, later
  - $rho$ from $0$ (no correlation) to $plus.minus 1$ (perfect correlation)
  - estimated by Pearson correlation coefficient, $R$.
  - $R^2$: coefficient of determination; proportion of variability in $Y_i$ accounted for by model

- more R interpretation: (TODO: what does the t value and p value mean?)
  #image("media/lm_2.png")

== ANOVA
- $Y_(i j) = mu + tau_i + epsilon_(i j)$ where $i$: group; $j$: datum within group $i$
  - $tau$ is the effect of each group in the discrete explanatory
  - $epsilon_(i j) ~ N(0, sigma^2)$ (normality assumption _required_)
  - test: null is all tau same, alt is at least one tau differs.

- ANOVA intuition:
  #image("media/ANOVA_intuition.png")

- math time:
  - uhhhhhhhhhh shucks