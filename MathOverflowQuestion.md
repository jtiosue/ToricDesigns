# Conjecture relating to complete sets of mutually unbiased bases


### Context

In a recent [paper](https://arxiv.org/abs/2311.13479), we studied the relationship between what we call *projective toric designs* and, among other things, [complete sets of mutually unbiased bases (MUBs)](https://en.wikipedia.org/wiki/Mutually_unbiased_bases).
There is a long-outstanding conjecture that complete sets of MUBs do not exist in dimensions that are not a prime power. The first dimension for which existence is unknown in therefore $d=6$. 
For all prime power dimensions, there is an [explicit construction](https://www.sciencedirect.com/science/article/abs/pii/0003491689903229) known.

### Background

Let $T = \mathbb R / 2\pi \mathbb Z$. 
A complete set of MUBs exists in $d$ dimensions if and only if there exists an $X \subset T^d$ satisfying Eqs. (1) (2), and (3) below.
(Here I am using $\{\!\!\{ \star \}\!\!\}$ to denote [multisets](https://en.wikipedia.org/wiki/Multiset).)

$$\lvert X \rvert = d^2 \tag{1}$$

$$\forall a,b,c,d\in\{1,2,\dots,d\}\colon~ \frac{1}{\lvert X \rvert}\sum_{\phi\in X}e^{i(\phi_a + \phi_b - \phi_c - \phi_d)} = \begin{cases} 1 & \text{if }\{\!\!\{ a,b \}\!\!\} = \{\!\!\{ c,d \}\!\!\}  \\ 0 & \text{otherwise} \end{cases}  \tag{2}$$

$$\forall \phi\neq\theta \in X \colon~ \left\lvert \sum_{j=1}^d e^{i(\phi_j - \theta_j)} \right\rvert^2 \in \{0, d \} \tag{3}$$

Obviously, it would be great to show that when $d=6$, there is no $X$ satisfying Eqs. (1-3). 
But of course that's really difficult, which is why the conjecture has been open for so long.

### Group designs and our conjecture

In all prime-power dimensions, the well-known construction (and I *think* all known constructions) of complete sets of MUBs correspond to $X$ that are subgroups of $T^d$.
Motivated by this, we conjecture the following.

**Conjecture A**: Let $d$ be a non-prime-power and let $X \subset T^d$ be a group. Then $X$ cannot simultaneously satisfy Eqs (1-3).

If Conjecture A is true, it would nicely characterize a fundamental difference between $d$ being a prime power and $d$ not being a prime power with regards to complete sets of MUBs.
In dimension $d=6$, we prove Conjecture A via an exhaustive numerical search. Specifically, we enumerate all possible generators of the four possible groups of order $36$: $\mathbb Z_4 \times \mathbb Z_9$, $\mathbb Z_3 \times \mathbb Z_3 \times \mathbb Z_4$, $\mathbb Z_2 \times \mathbb Z_2 \times \mathbb Z_9$, and $\mathbb Z_2 \times \mathbb Z_2 \times \mathbb Z_3 \times \mathbb Z_3$. We show that none satisfy all of Eqs (1-3).

*Side note*: In the case that $X$ is a cyclic group that satisfies Eq (2), then such sets $X$ are in one to one correspondence with modular [Sidon sets](https://en.wikipedia.org/wiki/Sidon_sequence) (specifically, Sidon sets of size $d$, where addition is considered modulo $\lvert X \rvert$), and thus we have many of these.


### Summary

We of course don't expect to be able to show that there do not exist *any* $X$ satisfying Eqs (1-3) when $d$ is a non-prime-power, as that would prove a very long-outstanding conjecture.
However, when restricting to $X$ being a group, it strongly seems that there is enough structure to prove the analogous result, but we were unable to prove it.
We know the result is true for $d=6$, and are wondering if it can be proven in general.
