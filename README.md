# ToricDesigns

Code accompanying our paper [arXiv:2311.13479](https://arxiv.org/abs/2311.13479)

**TO DO:**

- Clean up this README and all the files. Add better summary than below.

Most important files

- `enumerate-all-group-design.nb`
- `check6.jl`: Does the same thing but only for the four possible groups for d=6. Way faster because Julia. Proves Proposition 4.6.
- `minimal-torus-2design.nb`: enumerates all minimal Sidon sets
- `nonMUB2design-dimension3.nb` and `nonMUB2design-dimension6.nb`: explicit counterexamples to Zhu's conjecture using the prpojective toric design (coming from Sidon sets) construction of quantum state designs.
- `singer-toric-designs.nb`: generates Singer sets and the corresponding projective toric and toric designs.