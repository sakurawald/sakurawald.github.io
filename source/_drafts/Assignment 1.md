$$
\boxed{Macro}
% Color %
\newcommand\c[2]{\textcolor{#1}{#2}}
\newcommand\r[1]{\textcolor{red}{#1}}
\newcommand\g[1]{\textcolor{green}{#1}}
\newcommand\b[1]{\textcolor{blue}{#1}}

% Typography %
\newcommand\a[1]{\begin{aligned}#1\end{aligned}}
\newcommand\t[1]{\text{#1}}
\newcommand\lb[1]{\left\{\begin{aligned} #1 \end{aligned}\right.}
\newcommand\rb[1]{\left.\begin{aligned} #1 \end{aligned}\right\}}
\newcommand\env[2]{\begin{#1}#2\end{#1}}

% Misc %
\newcommand\s[1]{\{#1\}}
\newcommand\qed{\square}
\newcommand\define{\dot{=}}
\newcommand\if{\text{ if }}
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
\newcommand\AND{\textbf{ AND }}
\newcommand\OR{\textbf{ OR }}
\newcommand\NOT{\textbf{ NOT }}
\newcommand\THEN{\textbf{ THEN }}
\newcommand\assume{\text{ Assuming that: }}
\newcommand\contradictory{\text{ Thus lead to contradiction }}
\newcommand\proof{\text{Proof: }}
\newcommand\st{\text{ such that }}
\newcommand\hold{\text{ holds }}
\newcommand\lhs{\text{ LHS }}
\newcommand\rhs{\text{ RHS }}
\newcommand\wlg{\text{ Without loss of generality }}
\newcommand\nb{\text{ nota bene }}
\newcommand\analogously{\text{ analogously }}
\newcommand\viceversa{\text{viceversa}}
$$

- 2.3

| $(number)_2$   | $\c{hotpink}{Sign-Magnitude}$     | Ones' Complement                | Two's Complement              |
| :------------- | --------------------------------- | ------------------------------- | ----------------------------- |
| $\g{0}$        | $\g{\vec{x} = [0.0\cdots0]}$      | $\g{\vec{x} = [0.0\cdots0]}$    | $\g{\vec{x} = [0.0\cdots0]}$  |
| $\r{-}0$       | $\vec{x} = [\r{1}.\b{0\cdots0}]$  | $\vec{x} = [1.\b{1\cdots 1}]$   | $\vec{x} = [0.0\cdots0]$      |
| $\g{0.10101}$  | $\g{\a{&\vec{x}= [0.10101]}}$     | $\g{\a{&\vec{x}= [0.10101]}}$   | $\g{\a{&\vec{x}= [0.10101]}}$ |
| $\r{-}0.10101$ | $\a{&\vec{x}=[\r{1}.\b{10101}] }$ | $\a{&\vec{x}=[1.\b{01010}] }$   | $\a{&\vec{x}=[1.01011] }$     |
| $\r-0.11111$   | $\a{&\vec{x}=[\r1.\b{11111]} }$   | $\a{&\vec{x}=[0.\b{00000}] }$   | $\a{&\vec{x}=[0.00001] }$     |
| $\r{-}0.11111$ | $\a{&\vec{x}=[\r{1}.\b{11111}] }$ | $\a{&\vec{x}=[1.\b{00000}] }$   | $\a{&\vec{x}=[1.00001] }$     |
| $\r{-}0.10000$ | $\a{&\vec{x}=[\r{1}.\b{10000}] }$ | $\a{&\vec{x}=[1.\b{01111}] }$   | $\a{&\vec{x}=[1.10000] }$     |
| $\g{0.10000}$  | $\g{\a{&\vec{x}=[0.10000] }}$     | $$\g{\a{&\vec{x}=[0.10000] }}$$ | $\g{\a{&\vec{x}=[0.10000] }}$ |

$$
\boxed{\text{The Conversion of } (number)_2} \\
\a{
(Number)_2\lb{
& \t{ is \g{positive}} \implies \g{\t{Sign-Magnitude}} = \g{\t{Ones'Complement}} = \g{\t{Two's Complement}} \\
& \t{ is \r{non-positive}} \xrightarrow{\t{set } \r{x_0}} \t{Sign-Magnitude} \xrightarrow{\t{flip } \b{frac}} \t{Ones'Complement} \xrightarrow{\t{add } \c{hotpink}{1}} \t{Two's Complement}
}

}
$$



- 2.4

| Two's Complement        | Truth Value      |
| ----------------------- | ---------------- |
| $\g{[x]_T = [0.10010]}$ | $\g{x=0.10010}$  |
| $[x]_T = [\r1.10010]$   | $x = \r-0.01101$ |
| $[x]_T = [\r1.11111]$   | $x=\r-0$         |
| $[x]_T = [\r1.00000]$   | $x=\r-0.11111$   |
| $\g{[x]_T = [0.10001]}$ | $\g{x= 0.10001}$ |
| $[x]_T = [\r1.00001]$   | $x=\r-0.11110$   |



- 2.5

$$
\a{
x &= 0.10110 \\
y &= -0.01010 \\
}
$$

|       | Sign-Magnitude | Ones' Complement | Two's Complement |
| ----- | -------------- | ---------------- | ---------------- |
| [x]   | $0.10110$      | $0.\b{10110}$    | $0.10110$        |
| [x/2] |                | $0.0\b{10110}$   |                  |
| [x/4] |                | $0.00\b{10110}$  |                  |
| [y]   | $1.\g{01010}$  | $1.\g{10101}$    | $1.\r{10110}$    |
| [y/2] |                |                  | $1.1\r{10110}$   |
| [2y]  |                |                  | $1.\r{0110}$     |



- 2.7

| Case                                      | Range                         |
| ----------------------------------------- | ----------------------------- |
| 16-Bit Unsigned Number                    | $[0, 2^{16} - 1]$             |
| 16-Bit Sign-Magnitude Fixed-Point Decimal | $[-(1-2^{-15}), 1-2^{-{15}}]$ |
| 16-Bit Two's Complement Fix-Point Decimal | $[-1, 1-2^{-15}]$             |
| 16-Bit Ones' Complement Fix-Point Decimal | $[-2^{15}, 2^{15}-1]$         |



- 2.9

| Decimal Number  | IEEE 754 Bit-Pattern |
| --------------- | -------------------- |
| $-6\frac{5}{8}$ | As follows           |
| $3.1415927$     | As follows           |
| $64000$         | As follows           |

$$
\a {
&\a{
(\r{-}6\frac{5}{8})_{10} &= (-6.625)_{10} \\
&= -[110.101]\\
&= -[\g{1.10101}] \times \b{2^{2}}
} \\
&\implies \r{S = s = [1]} \\
&\implies \b{exp = E + bias = 2 + 127 = [10000001]} \\
& \implies \g{M = [10101]} \\
& \implies [\r{1}\b{10000001}\g{10101000000000000000000}]
}
$$

$$
\a{

\a{
& \a{(\r{+}3.1415927)_{10} &= [11.00100100001111110110101] \\
&= [\g{1.10010010000111111011010}1]_2 \times \b{2^{1}}
} \\

& \implies \r{S = s = [0]} \\
& \implies \b{exp = E + bias = 1 + 127 = [10000000]} \\
& \implies \g{M = 1 + frac = [10010010000111111011010]} \\
& \implies [\r{0}\b{10000000}\g{10010010000111111011010}]
}
}
$$

$$
\a{
& \a{
(\r{+}64000)_{10} &= [1111101000000000.0] \\
&= [\g{1.1111010000000000}] \times \b{2^{15}} \\
} \\
& \implies \r{S = s = [0]} \\
& \implies \b{exp = E + bias = 15 + 127 = [10001011]} \\
& \implies \g{M = 1 + frac = [11110100000000000000000]} \\
& \implies [\r{0}\b{10001011}\g{11110100000000000000000}]
}
$$

- 2.10

$$
\a{
(\r{+}43940000)_{16} &= [\r{0}\b{1000011}\underbrace{\b{1}\g{00101}}_{\g{M}}\g{000000000000000000}] \\
&\implies \r{S = s = 0} \\
& \because \lb {
& [10000111]_U \ne 0 \\
& [10000111]_U \ne 255
} \implies Normalized \\
& \therefore \b{E = exp - bias = 135 - (2^{7} - 1) = 8 = [00001000]} \\
& \therefore \g{M = 1 + frac = 1 + (2^{-3} + 2^{-5}) = [1.00101]} \\
& \a{\implies V &= (-1)^S \times 2^E \times M\\
&=(-1)^0\times 2^8 \times [1.00101] \\
&= [100101000] = (296)_{10}
}
}
$$

