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
\newcommand\lb[1]{\left\{\begin{aligned} #1 \end{aligned}\right.}
\newcommand\rb[1]{\left.\begin{aligned} #1 \end{aligned}\right\}}
\newcommand\env[2]{\begin{#1}#2\end{#1}}

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
\newcommand\but{\textbf{ but }}
\newcommand\however{\textbf{ however }}
\newcommand\AND{\textbf{ AND }}
\newcommand\OR{\textbf{ OR }}
\newcommand\NOT{\textbf{ NOT }}
\newcommand\THEN{\textbf{ THEN }}
\newcommand\IN{\textbf{ IN }}
\newcommand\NOTIN{\textbf{ NOT-IN }}
\newcommand\assume{\textbf{ Assuming that: }}
\newcommand\contradictory{\textbf{ Thus lead to contradiction }}
\newcommand\proof{\textbf{Proof: }}
\newcommand\st{\text{ such that }}
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



- 3.3

已知 $x$ 和 $y$，用 `变形补码` 计算 $x+y$，并判断结果是否有 `溢出`
$$
\bt{\c{orange}{Modified Complement}} \\
\a{
\t{\c{hotpink}{Sign Bits}} = \lb{
&00 \implies \g{postive} \\
&01 \implies \r{overflow} \\
&11 \implies \g{negative} \\
&10 \implies \r{underflow} 
}
}
$$

$$
\a{
x = 0.11010 \implies [x]_T &= [0.11010] \\
y = 0.101110 \implies [y]_T &= [0.101110] \\
\therefore x +^t y &= [\r{01}.100010] \\ 
\implies \r{overflow}
}
$$

$$
\a{
x = +0.11101 \implies [x]_T &= [0.11101] \\
y = -0.10100 \implies [y]_T &= [1.01100] \\
\therefore x +^t y &= [\r{00}.01001] \quad\text{(\r{Sign-bit carry is discarded by modular operation})}\\
\implies \g{positive}
}
$$

$$
\a{
x = -0.10111 \implies [x]_T &= [1.01001] \\ 
y = -0.11000 \implies [y]_T &= [1.01000] \\
\therefore x +^t y &=[\r{10}.10001] \\
\implies \r{underflow}
}
$$

- 3.4

已知 $x$ 和 $y$，用 `变形补码` 计算 $x-y$，并判断结果是否有 `溢出`
$$
\a{
x = 0.11011 \implies [x]_T &= [0.11011] \\
y = 0.11101 \implies [y]_T &= [0.11101] \\
\therefore x -^t y &= [\g{11}.11110] \\
\implies \g{negative}
}
$$

$$
\a{
x = 0.10111 \implies [x]_T &= [0.10111] \\
y = 0.11110 \implies [y]_T &= [0.11110] \\
\therefore x -^t y &= [\g{11}.11001] \\
\implies \g{negative}
}
$$

$$
\a{
x = -0.11111 \implies [x]_T &= [1.00001] \\
y = -0.11001 \implies [y]_T &= [1.00111] \\
\hotpink{-y} = 0.11001 \implies [-y]_T &= [0.11001] \\
\therefore x -^t y = x +^t (-y) &= [1.11010] \\
\implies \r{overflow}
}
$$

- 3.5

  若 `移码`用 `6位`表示（含 `2位`的 `符号位`），求 $[x\pm y]_移$

$$
\bt{\b{Frame-Shift}} \\
x = \lb{
& positive \rightarrow [\hotpink{1}x_{w-2}\cdots x_0] \\
& negative \xrightarrow{+bias} [\hotpink{0}x_{w-2}\cdots x_0]
}
$$

$$
\a{
&\lb{
&x = -6 \xrightarrow[\teal{+bias}]{negative} [x]_F = [\c{hotpink}{00}1010] \\
&y = -3 \xrightarrow[\teal{+bias}]{negative} [y]_F = [ \c{hotpink}{00}1101] \\
&-y = 3 \xrightarrow{positive} [-y]_F = [\c{hotpink}{11}0011]  \\
} \\
&\implies \lb{
&[y]_T = [\r{1}11101] \\
&[-y]_T = [\r{0}00011]
} \\
&\implies \lb{
& [x+y]_F = [x]_F + [y]_T \xrightarrow{\t{\orange{reset the highest sign-bit of FS}}}         [\orange001010] + [111101] = [\c{hotpink}{00}0111] \implies \g{negative}\\
& [x-y]_F = [x]_F + [-y]_T \xrightarrow{\t{\orange{reset the highest sign-bit of FS}}} = [\orange001010] + [000011] = [\c{hotpink}{00}1101] \implies \g{negative}
}}
$$

$$
\a{
&\lb{
& x = 7 \xrightarrow{positive} [x]_F = [\hotpink{11}0111] \\
& y = 11 \xrightarrow{positive} [y]_F = [\hotpink{11}1011] \\
& -y = -11 \xrightarrow[\teal{+bias}]{negative} [-y]_F = [\hotpink{00}0101]
} \\
& \implies \lb{
& [y]_T = [\r{0}01011] \\
& [-y]_T = [\r{1}10101]
} \\
& \implies \lb{
& [x+y]_F = [x]_F + [y]_T \xrightarrow{\t{\orange{reset the highest sign-bit of FS}}}  [\orange010111] + [001011] = [\hotpink{10}0010] \implies \r{overflow}\\
& [x-y]_F = [x]_F + [-y]_T \xrightarrow{\t{\orange{reset the highest sign-bit of FS}}} = [\orange010111] + [110101] = [\hotpink{00}1100] \implies \g{negative}
}

}
$$

$$
\a{
& \lb{
& x = -3 \xrightarrow[\teal{+bias}]{negative} [x]_F = [\hotpink{00}1101] \\
& y = -12 \xrightarrow[\teal{+bias}]{negative} [y]_F = [\hotpink{00}0100] \\
& -y = 12 \xrightarrow{positive} [-y]_F = [\hotpink{11}1100] 
} \\
& \implies \lb{
& [y]_T = [\r110100] \\
& [-y]_T = [\r001100]
} \\
& \implies \lb{
&[x+y]_F = [x]_F + [y]_T \xrightarrow{\t{\orange{reset the highest sign-bit of FS}}} [\orange001101] + [110100] = [\hotpink{00}0001] \implies \g{negative}\\
&[x-y]_F = [x]_F + [-y]_T \xrightarrow{\t{\orange{reset the highest sign-bit of FS}}} [\orange001101] + [001101] = [\hotpink{01}1010] \implies \r{underflow} \\
}
}
$$



- 3.9

设 `数`的 `阶码`为3位， `尾数`为6位（不包括 `符号位`)。按 `补码浮点运算`完成 $[x+y]_T$
$$
\bt{Match Exponents and Calc Mantissa} \lb{
&\a{
& \because\lb{
&x = 2^{011} \times (+0.100100) \\
&y = 2^{010} \times (-0.011010) \\
} \\
&\implies \lb{
&[x]_T = [\b{00011}\g{00100100}] \\
&[y]_T = [\b{00010}\g{11100110}] \\
} \\
& \implies \Delta exp = exp_x - exp_y = [\b{00011}] - [\b{00010}] = [00001] \\
&[y]_T \xrightarrow{\t{signed-right-shift 1-bit}} = [\b{00011}\g{11110011}]
}} \\

\a{
& \implies [x]_T + [y]_T = [\b{00011}\g{00010111}] \lb{
& \xrightarrow[\t{left normalization}]{\t{sign-bit} = MSB} [\b{00010}\g{00101110}] \\
& \xrightarrow{round} [\b{00010}\g{00101110}] \\
}}
$$

$$
\bt{Match Exponents and Calc Mantissa}\lb{
&\because \lb{
& x = 2^{-101} \times (-0.100010) \\
& y = 2^{-100} \times (-0.010110) 
} \\
&\implies \lb{
& [x]_T = [\b{11011}\g{11011101}] \\
& [y]_T = [\b{11100}\g{11101010}]
} \\
& \implies \Delta exp = exp_y - exp_x = [\b{11100}] - [\b{11011}] = [00001] \\
& [x]_T \xrightarrow{\t{signed-right-shift 1-bit}} [\b{11100}\g{11101111}]
} \\

\a{
\implies [x]_T + [y]_T = [\b{11100}\g{11011001}] \lb{
& \xrightarrow[]{\t{sign-bit}\ne\t{MSB}} [\b{11100}\g{11011001}] \\
& \xrightarrow[]{round} [\b{11100}\g{11011001}]
}}
$$


- 3.10

采用 `IEEE754 单精度浮点数格式`计算下列表达式
$$
0.625 + (-12.25)  \\
\lb{
&\a {
& (0.625)_{10} = (0.101)_{2} &= [\r{0}\b{01111110}\g{01000000000000000000000}] \\
& (-12.25)_{10} = (10100.01)_{2} &= [\r{1}\b{10000010}\g{10001000000000000000000}] \\
} \\
&\therefore \Delta exp = exp_y - exp_x = [\b{01111110}] - [\b{10000010}] = -[00000100] = -4
} \\ 
\implies \lb{
&M = [1.01] \xrightarrow{\t{RS 4-bit}} = [0.000101] \\
&\therefore [0.000101] + (-[1.100010]) = -[1.\g{011101}] \\
} \\
\implies 0.625 + (-12.25) = [\r{1}\b{10000010}\g{01110100000000000000000}]
$$

$$
0.625-(-12.25) \\
\lb{
&\a {
& (0.625)_{10} = (0.101)_{2} &= [\r{0}\b{01111110}\g{01000000000000000000000}] \\
& (-12.25)_{10} = (10100.01)_{2} &= [\r{1}\b{10000010}\g{10001000000000000000000}] \\
} \\
& \therefore \Delta exp = [\b{01111110}] - [\b{10000010}] = -[00000100] = -4 
}\\
\implies \lb{
&M = [1.01] \xrightarrow{\t{RS 4-bit}} = [0.000101] \\
&\therefore [0.000101] - (-[1.100010]) = [1.\g{100111}] 
}\\
\implies 0.625-(-12.25) = [\r{0}\b{10000010}\g{10011100000000000000000}]
$$

