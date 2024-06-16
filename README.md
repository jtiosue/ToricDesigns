# ToricDesigns

Code accompanying our paper [arXiv:2311.13479](https://arxiv.org/abs/2311.13479).

**Description of the files**

- `enumerate-all-group-design.nb`. For a given dimension d, this file exhaustively searches all possible projective toric 2-designs of size d^2 that are groups, and checks if any of them are complete sets of MUBs (ie checks Eq 25 of our paper).
- `check6.jl`. This file does the same thing but only for the four possible groups for d=6. It is ugly code, but it is just doing the same thing as `enumerate-all-group-design.nb`, just specifically for d=6. It is *much* faster since it is written in Julia. `check6.jl` proves Proposition 4.6 of our paper; namely that a complete set of MUBs is dimension d=6 must correspond to a non-group projective toric 2-design.
- `minimal-torus-2design.nb`. Thisf file enumerates all minimal Sidon sets, therefore finding all projective toric 2-designs that are (a) isomorphic to cyclic groups, and (b) minimal 2-designs. In dimension 7, we find that there are no minimal projective toric 2-designs isomorphic to a cyclic group. This in fact implies (see our paper) that there are no minimal projective toric 2-designs in dimension 7 that are groups.
- `nonMUB2design-dimension3.nb` and `nonMUB2design-dimension6.nb`. These files give explicit counterexamples to Zhu's conjecture using the projective toric design (coming from Sidon sets) construction of quantum state designs. Namely, these files give explicit quantum state 2-designs of size d(d+1) that are not complete sets of MUBs.
- `singer-toric-designs.nb`. This file contains code to generate Singer sets (via finite fields) and the corresponding projective toric and toric t-designs. We summarize the construction of Singer sets in an appendix of our paper.
