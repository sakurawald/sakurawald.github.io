# Directed Graph and Network

$$
\boxed{@}
% Color %
\newcommand\c[2]{\textcolor{#1}{#2}}
\newcommand\r[1]{\textcolor{red}{#1}}
\newcommand\g[1]{\textcolor{green}{#1}}
\newcommand\b[1]{\textcolor{blue}{#1}}
\newcommand\red[1]{\textcolor{red}{#1}}
\newcommand\blue[1]{\textcolor{blue}{#1}}
\newcommand\green[1]{\textcolor{green}{#1}}
\newcommand\black[1]{\textcolor{black}{#1}}
\newcommand\white[1]{\textcolor{white}{#1}}
\newcommand\cyan[1]{\textcolor{cyan}{#1}}
\newcommand\magenta[1]{\textcolor{magenta}{#1}}
\newcommand\yellow[1]{\textcolor{yellow}{#1}}
\newcommand\orange[1]{\textcolor{orange}{#1}}
\newcommand\lime[1]{\textcolor{lime}{#1}}
\newcommand\pink[1]{\textcolor{pink}{#1}}
\newcommand\darkgray[1]{\textcolor{darkgray}{#1}}
\newcommand\gray[1]{\textcolor{gray}{#1}}
\newcommand\lightgray[1]{\textcolor{lightgray}{#1}}
\newcommand\brown[1]{\textcolor{brown}{#1}}
\newcommand\olive[1]{\textcolor{olive}{#1}}
\newcommand\purple[1]{\textcolor{purple}{#1}}
\newcommand\teal[1]{\textcolor{teal}{#1}}
\newcommand\violet[1]{\textcolor{violet}{#1}}
\newcommand\hotpink[1]{\textcolor{hotpink}{#1}}
\newcommand\blueviolet[1]{\textcolor{blueviolet}{#1}}
\newcommand\navyblue[1]{\textcolor{navyblue}{#1}}
\newcommand\peach[1]{\textcolor{Peach}{#1}}
\newcommand\orangeRed[1]{\textcolor{OrangeRed}{#1}}
\newcommand\salmon[1]{\textcolor{Salmon}{#1}}
\newcommand\skyblue[1]{\textcolor{SkyBlue}{#1}}
\newcommand\springreen[1]{\textcolor{SpringGreen}{#1}}
\newcommand\aqua[1]{\textcolor{aqua}{#1}}
\newcommand\navy[1]{\textcolor{navy}{#1}}
\newcommand\silver[1]{\textcolor{silver}{#1}}
\newcommand\fuchsia[1]{\textcolor{fuchsia}{#1}}
\newcommand\maroon[1]{\textcolor{maroon}{#1}}
\definecolor{luo}{RGB}{102,204,255}
\definecolor{miku}{RGB}{57,197,187} 
\newcommand\luo[1]{\textcolor{luo}{#1}}
\newcommand\miku[1]{\textcolor{miku}{#1}}

% Typography %
\newcommand\a[1]{\begin{aligned}#1\end{aligned}}
\newcommand\t[1]{\text{#1}}
\newcommand\tb[1]{\text{\textcolor{blue}{#1}}}
\newcommand\lb[1]{\left\{\begin{aligned} #1 \end{aligned}\right.}
\newcommand\lrb[1]{\lb{\rb{#1}}}
\newcommand\rb[1]{\left.\begin{aligned} #1 \end{aligned}\right\}}
\newcommand\env[2]{\begin{#1}#2\end{#1}}
\newcommand\step[1]{\textbf{ (#1) }}

% Misc %
\newcommand\s[1]{\{#1\}}
\newcommand\qed{\quad\square}
\newcommand\define{\dot{=}}
\newcommand\then{\implies}
\newcommand\rounddown[1]{\lfloor{#1}\rfloor}
\newcommand\roundup[1]{\lceil{#1}\rceil}
\newcommand\graph[4]{#1 = (#2, #3) \quad |#2| = #4}
\newcommand\G{G = (V, E) \quad |V| = n}
\newcommand\so{\therefore}
\newcommand\comment[1]{\quad\text{(#1)}}
\newcommand\note[1]{\quad\text{(#1)}}
\newcommand\bt[1]{\boxed{\text{#1}}}
\newcommand\max[1]{\textbf{ max } \{#1\} }
\newcommand\min[1]{\textbf{ min } \{#1\} }
\newcommand\IF{\textbf{ IF }}
\newcommand\if{\textbf{ if }}
\newcommand\IS{\textbf{ IS }}
\newcommand\is{\textbf{ is }}
\newcommand\do{\textbf{ do }}
\newcommand\dowhile{\textbf{ do while }}
\newcommand\dountil{\textbf{ do until }}
\newcommand\find{\textbf{ find }}
\newcommand\until{\textbf{ until }}
\newcommand\thereisa{\textbf{ There is a }}
\newcommand\thereisan{\textbf{ There is an }}
\newcommand\hasno{\textbf{ has no }}
\newcommand\has{\textbf{ has }}
\newcommand\but{\textbf{ but }}
\newcommand\however{\textbf{ however }}
\newcommand\AND{\textbf{ AND }}
\newcommand\OR{\textbf{ OR }}
\newcommand\NOT{\textbf{ NOT }}
\newcommand\THEN{\textbf{ THEN }}
\newcommand\IN{\textbf{ in }}
\newcommand\NOTIN{\textbf{ NOT-IN }}
\newcommand\assume{\textbf{ Assuming that: }}
\newcommand\contradictory{\textbf{ Thus lead to contradiction }}
\newcommand\proof{\textbf{Proof: }}
\newcommand\st{\textbf{ such that }}
\newcommand\hold{\text{ holds }}
\newcommand\lhs{\text{ LHS }}
\newcommand\rhs{\text{ RHS }}
\newcommand\wlg{\text{ Without loss of generality }}
\newcommand\nb{\text{ nota bene }}
\newcommand\analogously{\text{ analogously }}
\newcommand\viceversa{\textbf{ viceversa }}
\newcommand\let{\textbf{ let }}
\newcommand\as{\textbf{ as }}
\newcommand\for{\textbf{ As for }}
\newcommand\select{\textbf{ SELECT }}
\newcommand\m[1]{\mathit{#1}}
\newcommand\+[1]{\mathcal{#1}}
\newcommand\warnning[1]{\colorbox{Blue}{\textcolor{Yellow}{#1}}}
\newcommand\error[1]{\colorbox{Black}{\textcolor{White}{#1}}}
$$

## Directed Graph

### Definition

- $directed\ graph$

$$
\lb{
& V \is \t{the \b{vertex-set}} \\
& A \is \t{the \b{arc-set}} 
} \implies D = (V,A) \is \t{a \b{directed graph}}
$$

- $arc$

$$
\let \alpha = (a,b) \as \t{\b{a arc}} \implies 
\lb{
& \iota(\alpha) = a \is \t{the \b{initial vertex}}  \\
& \tau(\alpha) = b \is \t{the \b{terminal vertex}}
}
$$

- $indegree \AND outdegree$

$$
outdegree(x) = |\s{\alpha | \iota(\alpha) = x}|
$$

$$
indegree(x) = |\s{\alpha | \tau(\alpha) = x}|
$$

### Theory

#### Theory 1

$$
D = (V, A) \implies \iota(V) = \tau(V) = |A|
$$

#### Theory 2

$$
\lb {
& D = (V, A) \is \tb{directed graph} \\
& D \is \tb{connected} \\
& \forall x \in V, \st deg^+(x) = deg^-(x)
} \iff \t{There is a } \tb{directed euler's closed trail} \IN D
$$

#### Theory 3

$$
\lb{
& D \is \tb{directed graph} \\
& D \is \tb{connected} \\
& \forall x,y (x \ne y) \in V \st \lb {
& deg^+(x) = deg^-(x) + 1 \\
& deg^-(y) = deg^+(y) + 1 \\
& \forall z \ne x,y, \st deg^+(z) = deg^-(z)
}
} \iff \t{There is a } \tb{directed euler tail} \IN D
$$

#### Theory 4

$$
\bt{Ghouila Houri's Theorem} \\
\lb{
& D \is \tb{directed graph} \\
& D \is \tb{strongly connected} \\
& D \hasno \tb{cycles} \\
& \forall x \in V, \st deg^+(x) + deg^-(x) \ge n
} \implies \thereisa \tb{hamilton circuit } \IN D
$$

#### Theory 5

$$
D = (E, A) \is \tb{tournament graph} \implies \thereisa \tb{hamilton path} \IN D
$$

#### Theory 6

$$
\lb{
& G = (V, E) \is \tb{connected} \\
& G \hasno \tb{bridge}
} \iff G \has \tb{a orientation which is strongly connected}
$$

---

$$
\bt{An approach to find \b{a strongly connected orientation } of \b{a graph wihout bridge}} \\
\a{
& \let G = (V,E) \as \tb{connected graph without bridges} \\
& \step{1} U \define \varnothing \\
& \step{2} \find \tb{a cycle } \gamma \IN G \\
& \qquad\step{i} \textbf{orient} \t{ all the edges } \IN G \\
& \qquad\step{ii} \forall x \in \gamma \do x \cup U \\
& \step{3} \dowhile U \ne V \\
& \qquad\step{i} \find \alpha = (x,y) \st x \in U, y \notin U \\
& \qquad\step{ii} \find \tb{a cycle} \t{ that contains } \alpha \\
& \qquad\step{iii} \lb{
& \textbf{origin} \ \alpha \t{ from x to y} \\
& \textbf{origin} \t{ all the edges} \in \gamma \until \t{reach \b{a vertex} in } U
} \\
& \qquad\step{iv} \forall x \in \gamma \do x \cup U \\
& \step{4} \forall \tb{ non-oriented edges} \do \textbf{origin } \t{any direction for it}
}
$$

---





### Concept

#### The orientation of basic general graph

$$
\lb{
& G = (V, E) \\
& \forall \alpha=\s{a,b} \in E, \b{\t{orient the direction for }} \alpha \to (a,b)
} \implies D = (V, A)
$$

the inverse-process
$$
\lb{
& D = (V, A) \\
& \forall \alpha = (a, b) \in A, \st \alpha \to \s{a,b}
} \implies G = (V, E)
$$

##### Tournament Graph

###### Definition

$$
\t{\b{the orientation of} the \b{complete graph }} K_n \implies \t{\b{tournament graph}}
$$

###### Specialization

- `Transitive Tournament Graph`
  $$
  \lb{
  & D = (V, A) \is \t{\b{tournament graph}} \\
  & \textbf{Regard} \t{ all the players: } p_1, \cdots p_n \\
  & \exists \t{\b{the following order: }} p_1, p_2,\cdots,p_n \st \s{(p_1,p_2),(p_2,p_3),\cdots, (p_{n-1}, p_n))} \subseteq A
  } \implies D \is \t{\b{transitive tournament graph}}
  $$

### Connectivity

$$
\bt{The connectivity of directed graph} \\
D = (V, A) \is \lb{
& \t{\b{connected}} \implies \t{\b{the basic general graph} of } D \is \tb{connected} \\
& \tb{strongly connected} \implies \forall x,y \in V, \exists \tb{a path from x to y}
}
$$









