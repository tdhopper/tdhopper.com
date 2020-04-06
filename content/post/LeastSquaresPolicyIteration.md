---
title: s on the Derivation of Least Squares Policy Iteration
date: 2012-02-16
Author: Tim
slug: lspi
category: Article
---

\(

\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\parens}[1]{\left(#1\right)}
\newcommand{\ang}[1]{\left\langle#1\right\rangle}
\newcommand{\floor}[1]{\left\lfloor#1\right\rfloor}
\newcommand{\bra}[1]{\left[#1\right]}
\newcommand{\bigbra}[1]{\bigl[#1\bigr]}
\newcommand{\psbra}[1]{\bra{\bra{#1}}}
\newcommand{\abs}[1]{\left|#1\right|}
\newcommand{\E}{\mathbb{E}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\g}{\,|\,}
\newcommand{\norm}[1]{\left\|#1\right\|}
\DeclareMathOperator*{\argmax}{arg\,max}
\)

## Notes on the Derivation of Least Squares Policy Iteration

> LSPI is a model-free, off-policy method which can use efficiently (and reuse in each iteration) sample experiences collected in any manner.

The state-action value function $Q^{\pi}(s,a)$ of any policy $\pi$, including a randomized policy, can be found by solving the Bellman equations:

\[
	Q^{\pi}(s,a)=\mathcal{R}(s,a)+\gamma\sum_{s'\in \mathcal{S}}\mathcal{P}(s,a,s')
		\sum_{a'\in \mathcal{A}}\pi(a';s')Q^{\pi}(s',a').
\]
$\pi(a;s)$ is the probability that policy $\pi$ chooses action $a$ in state $s$. We can write this in matrix form:
\[
	Q^{\pi}=\mathcal{R}+\gamma\mathbf{P}\mathbf{\Pi}_{\pi}Q^{\pi}.
\]

*  $Q^{\pi}$ and $\mathcal{R}$ are vectors of size $\abs{\mathcal{S}}\abs{\mathcal{A}}$.
*  $\mathbf{P}$ is a stochastic matrix of size $\abs{\mathcal{S}}\abs{\mathcal{A}}\times \mathcal{S}$ where
		\[
			\mathbf{P}\bigl((s,a),s'\bigr)=\mathcal{P}(s,a,s').
		\]
*  $\mathbf{\Pi}_{\pi}$ is a stochastic matrix of size $\mathcal{S}\times \abs{\mathcal{S}}\abs{\mathcal{A}}$ that describes $\pi$:
		\[
			\mathbf{\Pi}_{\pi}\bigl(s',(s',a')\bigr)=\pi(a';s')
		\]

Then we can find $Q^{\pi}$ by solving
\[
	(\mathbf{I}-\gamma \mathbf{P}\mathbf{\Pi}_{\pi})Q^{\pi}=\mathcal{R}.
\]

We can also think of this as a fixed point of the Bellman operator $T_{\pi}$:
\[
	(T_{\pi}Q)(s,a)=\mathcal{R}(s,a)+
	\gamma\sum_{s'\in \mathcal{S}}
	\mathcal{P}(s,a,s')\sum_{a'\in \mathcal{A}}
	\pi(a';s')Q(s',a').
\]

### Example

Recall Puterman's favorite 2-state Markov chain on Page 34 of \emph{Markov Decision Processes}. Two states, $s_{1}$ and $s_{2}$, and two actions, $a_{1}$ and $a_{2}$. Then:
\[
	Q^{\pi}=\bra{
		Q^{\pi}(s_{1},a_{1}),\;
		Q^{\pi}(s_{1},a_{2}),\;
		Q^{\pi}(s_{2},a_{1}),\;
		Q^{\pi}(s_{2},a_{2})}^\intercal
\]
\[
	\mathcal{R}=\bra{
		5,\;
		10,\;
		-1,\;
		-\infty}^\intercal,
\]and
\[
	\mathbf{P}=\bordermatrix{
		& s_{1} & s_{2} \cr
		(s_{1},a_{1}) &.5&.5   \cr
		(s_{1},a_{2}) &0&1   \cr
		(s_{2},a_{1}) &0&1   \cr
		(s_{2},a_{2}) &0&1
	}
\]
We construct the following policy:
\[
	\mathbf{\Pi}_{\pi}=\bordermatrix{
	& (s_{1},a_{1}) & (s_{1},a_{2}) & (s_{2},a_{1}) & (s_{2},a_{2}) \cr
	s_{1} &.5&.5&0&0\cr
	s_{2} &0&0&1&0\cr
	}.
\]
This results in
\[
	\mathbf{I}-\gamma \mathbf{P}\Pi_{\pi}=\left(
	\begin{matrix}
	 1-0.25 \gamma  & -0.25 \gamma  & -0.5 \gamma  & 0. \\
	 0. & 1 & -\gamma  & 0. \\
	 0. & 0. & 1- \gamma  & 0. \\
	 0. & 0. & -\gamma  & 1
	\end{matrix}
	\right)
\]
and we can solve $(\mathbf{I}-\gamma \mathbf{P}\Pi_{\pi})Q^{\pi}=\mathcal{R}$  for any value of $\gamma$ to obtain $Q^{\pi}$.

### Linear Architecture
We now consider approximating $Q^{\pi}$ by a $\hat{Q}^{\pi}$, a linear combination of basis functions.
Suppose we have $\phi_{j}:\mathcal{S}\times\mathcal{A}\rightarrow \R$ for $j=1,2,\ldots,k$.
Define $\phi(s,a)$, column vector of size $k$, and
\[
	\phi(s,a)=\left(\begin{smallmatrix}
		\phi_{1}(s,a) \\ \cdots \\ \phi_{1}(s,a) \\ \cdots \\ \phi_{k}(s,a)
	\end{smallmatrix}\right).
\]
Define $\mathbf{\Phi}$ is a ($\abs{\mathcal{S}}\abs{\mathcal{A}}\times k$) matrix of the form
\[
	\mathbf{\Phi}=\begin{pmatrix}
		\phi(s_{1},a_{1})^\intercal\\
		\ldots\\
		\phi(s,a)^\intercal\\
		\ldots\\
		\phi(s_{\abs{\mathcal{S}}},a_{\abs{\mathcal{A}}})^\intercal\\
	\end{pmatrix}.
\]
If $w_{j}^{\pi}$ is the weight for each function, we can write
\[
	\hat{Q}^{\pi}=\mathbf{\Phi}w^{\pi}.
\]

% section linear_architecture (end)

### Least-Squares Fixed-Point Approximation

Recall that the $Q$-values of a policy $\pi$ are a fixed point of the Bellman operator: $T_{\pi}Q^{\pi}=Q^{\pi}$.
We could approximate the value function by finding a fixed point in the space of the linear approximations:
\[
	T_{\pi}\hat{Q}^{\pi}= \hat{Q}^{\pi}.
\]
However, this approximation space is not guaranteed to contain a fixed point.

Recall that if $\mathcal{M}$ is an $r$-dimensional subspace of $\R^{n}$, $\mathbf{M}_{n\times r}$ is a basis for $\mathcal{M}$, and
\[
	\mathbf{P}_{\mathcal{M}}=\mathbf{M}(\mathbf{M}^{\intercal}\mathbf{M})^{-1}\mathbf{M}^{\intercal},
\]
then $\mathbf{P}_{\mathcal{M}}$ is the unique orthogonal projector onto $\mathcal{M}$.
That is, for any $v=m+n\in \R^{n}$, where $m\in \mathcal{M}$ and $n\in \mathcal{M}^{\perp}$, $\mathbf{P}_{\mathcal{M}}v=m$.

Also, for vector $b\in \R^{n}$,
\[
	\min_{m\in \mathcal{M}}\norm{b-m}_{2}=\norm{b-\mathbf{P}_{\mathcal{M}}b}_{2}.
\]
That is, the vector in $\mathcal{M}$ closest to $b$ is the projection of $b$ onto $\mathcal{M}$, $\mathbf{P}_{\mathcal{M}}b$.

We might hope to find a pseudo-fixed point of the Bellman operator on an approximation of the value function.
Find the weights for a value function approximation $\hat{Q}^{\pi}$ so that if we apply the Bellman operator (which may be outside the approximation space), then \emph{project} this into the approximation space, we get the original approximation function.
That is, we want weights $w^{\pi}$ so that
\begin{align}\nonumber
	\hat{Q}^{\pi}&=\mathbf{\Phi}(\mathbf{\Phi}^\intercal\mathbf{\Phi})^{-1}\mathbf{\Phi}^\intercal(T_{\pi}\hat{Q}^{\pi})\\
	&= \mathbf{\Phi}(\mathbf{\Phi}^\intercal\mathbf{\Phi})^{-1}\mathbf{\Phi}^\intercal
		(\mathcal{R}+\gamma \mathbf{P}\mathbf{\Pi}_{\pi}\hat{Q}^{\pi}).\label{eq:fixedpoint}
\end{align}
In effect, the weights make the Bellman operator perpendicular to the approximation space.


We can manipulate \eqref{eq:fixedpoint} into solving a linear system for the weights:
\begin{align*}
	\mathbf{\Phi}(\mathbf{\Phi}^\intercal\mathbf{\Phi})^{-1}\mathbf{\Phi}^\intercal
		(\mathcal{R}+\gamma \mathbf{P}\mathbf{\Pi}_{\pi}\hat{Q}^{\pi})&=\hat{Q}^{\pi}\\	\mathbf{\Phi}(\mathbf{\Phi}^\intercal\mathbf{\Phi})^{-1}\mathbf{\Phi}^\intercal
				(\mathcal{R}+\gamma \mathbf{P}\mathbf{\Pi}_{\pi}\mathbf{\Phi}w^{\pi})&=\mathbf{\Phi}w^{\pi}\\
		\mathbf{\Phi}(\mathbf{\Phi}^\intercal\mathbf{\Phi})^{-1}\mathbf{\Phi}^\intercal
				(\mathcal{R}+\gamma \mathbf{P}\mathbf{\Pi}_{\pi}\mathbf{\Phi}w^{\pi})-\mathbf{\Phi}w^{\pi}&=0\\
		\mathbf{\Phi}\parens{(\mathbf{\Phi}^\intercal\mathbf{\Phi})^{-1}\mathbf{\Phi}^\intercal
						(\mathcal{R}+\gamma \mathbf{P}\mathbf{\Pi}_{\pi}\mathbf{\Phi}w^{\pi})-w^{\pi}}&=0\\
		\shortintertext{Because $\mathbf{\Phi}$ has linearly independent columns:}
		(\mathbf{\Phi}^\intercal\mathbf{\Phi})^{-1}\mathbf{\Phi}^\intercal
						(\mathcal{R}+\gamma \mathbf{P}\mathbf{\Pi}_{\pi}\mathbf{\Phi}w^{\pi})-w^{\pi}&=0\\
		(\mathbf{\Phi}^\intercal\mathbf{\Phi})^{-1}\mathbf{\Phi}^\intercal
						(\mathcal{R}+\gamma \mathbf{P}\mathbf{\Pi}_{\pi}\mathbf{\Phi}w^{\pi})&=w^{\pi}\\
		\mathbf{\Phi}^\intercal(\mathcal{R}+\gamma \mathbf{P}\mathbf{\Pi}_{\pi}\mathbf{\Phi}w^{\pi})&=(\mathbf{\Phi}^\intercal\mathbf{\Phi})w^{\pi}\\
		\mathbf{\Phi}^\intercal\mathcal{R}+\mathbf{\Phi}^\intercal(\gamma \mathbf{P}\mathbf{\Pi}_{\pi}\mathbf{\Phi}w^{\pi})-(\mathbf{\Phi}^\intercal\mathbf{\Phi})w^{\pi}&=0\\
		\mathbf{\Phi}^\intercal(\gamma \mathbf{P}\mathbf{\Pi}_{\pi}\mathbf{\Phi}w^{\pi}-\mathbf{\Phi})w^{\pi}&=
			-\mathbf{\Phi}^\intercal\mathcal{R}\\
		\underbrace{\mathbf{\Phi}^\intercal\parens{\mathbf{\Phi}-\gamma \mathbf{P}\mathbf{\Pi}_{\pi}\mathbf{\Phi}}
		}_{(k\times k)}
		w^{\pi}&=
		\underbrace{\mathbf{\Phi}^\intercal\mathcal{R}}_{(k\times 1)}\\
		\end{align*}

Thus for a policy matrix $\mathbf{\Pi}_{\pi}$, we can find the least-squares weights minimizing the $L_{2}$ distance between $\hat{Q}$ and the projection of  $T_{\pi}\hat{Q}$ onto the $\mathbf{\Phi}$ plane:
\[
	w^{\pi}=\parens{\mathbf{\Phi}^\intercal\parens{\mathbf{\Phi}-\gamma \mathbf{P}\mathbf{\Pi}_{\pi}\mathbf{\Phi}}}^{-1}\mathbf{\Phi}^\intercal\mathcal{R},
\]
assuming the inverse exists.
Koller and Parr (2000) showed this inverse exists for all but finitely many values of $\gamma$.
The proof follows from the determinant of $	\mathbf{\Phi}^\intercal\parens{\mathbf{\Phi}-\gamma \mathbf{P}\mathbf{\Pi}_{\pi}\mathbf{\Phi}}$ being a polynomial of $\gamma$, and the polynomial only having a finite number of roots.

We can also use the $\abs{\mathcal{S}}\abs{\mathcal{A}}\times \abs{\mathcal{S}}\abs{\mathcal{A}}$ diagonal matrix $\Delta_{\mu}$ weight the projection matrix according to  $\mu(s,a)$:
\[
	w^{\pi}=\parens{\mathbf{\Phi}^\intercal\Delta_{\mu}\parens{\mathbf{\Phi}-\gamma \mathbf{P}\mathbf{\Pi}_{\pi}\mathbf{\Phi}}}^{-1}\mathbf{\Phi}^\intercal\Delta_{\mu}\mathcal{R}.
\]
This is analogous to weighted regressions.
Letting $\mathbf{A}=\mathbf{\Phi}^\intercal\Delta_{\mu}\parens{\mathbf{\Phi}-\gamma \mathbf{P}\mathbf{\Pi}_{\pi}\mathbf{\Phi}}$ and $b=\mathbf{\Phi}^\intercal\Delta_{\mu}\mathcal{R}$, we can solve $w^\intercal$ by solving $k\times k$ linear system:
\[
	\mathbf{A}w^{\pi}=b.
\]
If $A$ and $b$ were known, this linear system would be tractable for a reasonable number of features; because, however, $\mathbf{P}$ and $\mathcal{R}$ are likely either unknown or too large, $A$ and $b$ cannot be directly computed.

### STD$Q$

We can leave the matrix notation to get
\begin{align*}
	\mathbf{A}&=\mathbf{\Phi}^\intercal\Delta_{\mu}\parens{\mathbf{\Phi}-\gamma \mathbf{P}\mathbf{\Pi}_{\pi}\mathbf{\Phi}}\\
	&=\sum_{s\in\mathcal{S}}\sum_{a\in\mathcal{A}}\phi(s,a)\mu(s,a)
		\parens{\phi(s,a)-\gamma\sum_{s'\in \mathcal{S}}\mathcal{P}(s,a,s')\phi(s',\pi(s'))}^\intercal\\
		&=\sum_{s\in\mathcal{S}}\sum_{a\in\mathcal{A}}\mu(s,a)
		\sum_{s'\in\mathcal{S}}\mathcal{P}(s,a,s')\Biggl[
		\phi(s,a)\Bigl(\phi(s,a)-\gamma\phi\bigl(s',\pi\left(s'\right)\bigr)\Bigr)^{\intercal}
		\Biggr]
\end{align*}
and
\begin{align*}
	b&=\mathbf{\Phi}^{\intercal}\Delta_{\mu}\mathcal{R}\\
	&=\sum_{s\in\mathcal{S}}\sum_{a\in\mathcal{A}}\phi(s,a)\mu(s,a)\sum_{s'\in \mathcal{S}}
		\mathcal{P}(s,a,s')R(s,a,s')\\
	&=\sum_{s\in\mathcal{S}}\sum_{a\in\mathcal{A}}\mu(s,a)\sum_{s'\in \mathcal{S}}
		\mathcal{P}(s,a,s')\bra{\phi(s,a)R(s,a,s')}
\end{align*}
The matrix $\mathbf{A}$ is the sum of many rank one (outer product) matrices of the form
\[
	\phi(s,a)\Bigl(\phi(s,a)-\gamma\phi\bigl(s',\pi\left(s'\right)\bigr)\Bigr)^{\intercal}
\]
and $b$ the sum of vectors of the form
\[
	\phi(s,a)R(s,a,s')
\]
where the sum over every $(s,a,s')$ pair and weighted by $\mu(s,a)$  and $\mathcal{P}(s,a,s')$.
We can approximate $\mathbf{A}$ and $b$ by sampling terms from this summation. ``For unbiased sampling, $s$ and $a$ must be drawn jointly from $\mu$, and $s'$ must be drawn from $\mathcal{P}(s,a,s')$.''
If a finite set of samples
\[
	D=\set{(s_{i},a_{i},r_{i},s_{i}')\g i=1,2,\ldots,L}
\]
is sampled according to $\mu_{D}$, $\mathbf{A}$ and $b$ can be approximated according by
\begin{align*}
	\tilde{\mathbf{A}}&=\frac{1}{L}\sum_{i=1}^{L}\bra{\phi(s_{i},a_{i})\Bigl(\phi(s_{i},a_{i})-\gamma\phi\bigl(s_{i}',\pi\left(s_{i}'\right)\bigr)\Bigr)^{\intercal}}\\
	\tilde{b}&=\frac{1}{L}\sum_{i=1}^{L}\bra{\phi(s_{i},a_{i})r_{i}}.
\end{align*}

This method for approximating $\tilde{w}^{\pi}$ is what Lagoudakis and Parr called LSTD$Q$. They also use the Sherman-Morrison formula to provide an algorithm that maintains the inverse of $A$ at each step which would be useful for policy improvement.

### LSPI

Given some policy and basis functions, we compute the approximate policy
\[
	\hat{Q}(s,a;\,w)=\sum_{i=1}^{k}\phi_{i}(s,a)w_{i}=\phi(s,a)^{\intercal}w
\]
by computing the weights according to LSTD$Q$ from a set of samples $D$.
We can then construct a greedy policy $\pi$ from this by:
\[
	\pi(s)=\argmax_{a\in\mathcal{A}}\hat{Q}(s,a).
\]
From policy $\pi$, we can repeat the same process \emph{reusing the same samples to compute $w$ each time}.
We repeat this process until the policy (approximately) stops changing.
This is least squares policy iteration.
