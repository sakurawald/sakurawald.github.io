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

## 5.3

1. 操作数在指令中：立即数寻址
2. 操作数地址在指令中为：直接寻址
3. 操作数在寄存器中为：寄存器寻址
4. 操作数地址在寄存器中为：寄存器间接寻址



## 5.4

#### 5.4.1

16种 `通用寄存器`，需要 $log_{16} = 4$ 位表示

8种 `寻址方式`，需要 $log_8 = 3$ 位表示

由于计算机 `字长` 为 $16$ 位，则设计 `单条指令的操作码` 的位数为 $16- (3+4) = 9$ 位

则 `不同指令的类型` 最多为 $2^9 = 512$ 条

#### 5.4.2

方式同上，设计 `单条指令的操作码` 的位数为 $16 - 2 * (3+4)$ 位

#### 5.4.3

寄存器为16位，故寻址范围为 $2^{16} = 2^{6} * 2^{10} = 64K$



## 5.5

### 5.1

`单条指令的长度` 为 $16$ 位，每个 `操作数地址` 使用 $6$ 位表示

可以通过将 `操作码字段` 向 `地址码字段` 拓展的方式来增加 `操作数较少的指令的类型数`

由于 `操作数` 最多为 $2$ 个，则在 `不考虑拓展` 的情况下， `双操作数的指令` 最多有 $2^4 = 16$ 种。

如果 `双操作数的指令` 已经使用了 $m$ 种，则还剩下 $16-m$ 种 `双操作数的指令` 。

但这些 `双操作数的指令` 不能全部使用，某些 `指令的位模式` 需要用于表示 `操作码拓展`。

`单操作数的指令` 通过 `操作码拓展` 后可以得到 `无操作数的指令`，设拓展的过程中用到了 $y$ 个 `拓展标记`，则 $n = y \times 2^6$

则 `单操作数指令` 的条数为 $y = n / 2^6$ 

### 5.2

如果只有 `双操作数指令`，则最多为  $2^{4} = 16$ 种，但这其中有 $1$ 种 `双操作数指令的位模式` 要被用于表示 `操作码拓展`

故 `双操作数指令` 的种数 $2^4 - 1 = 15$

同理，`单操作数指令` 的种数 $\b1 \times (2^6 - 1) = 63$

同理，`无操作数指令` 的种数 $\b1 \times (2^6) = 64$

## 5.7

(1) $EA = 001AH + 23A0H = 23BAH$

(2) $EA = [001AH] = 23A0H$

则取出的 `内容` 为 $2600H$

`间接寻址` 相当于使用PL中的 `指针`，而 `中括号` 表示 `解除引用运算符`。

换句话说，`地址码` 里存放的是 `指针的地址`。而 `指针的内容` 本身也是一个 `另一个地址`，

则我们所要取的 `数` 就是 `指针的内容所指向的地址 所存放的内容`

(3)  $PC = PC + 2 = 1F05H + 2 = 1F07H$

$EA = 1F07H + 001AH = 1F21H$ 访问了 `无效地址`。

由于是 `单字长指令`，而从 `地址` 为 $16$ 位可以得出，`字长` 为 $16$ 位。

`PC相对寻址` 是相对于 `当前PC` 再加上 `当前指令的长度` 来计算得到 `下一个PC值` 。

## 5.8

`指令格式` 中 `操作码字段` 6位，`寻址方式字段` 2位， `地址字段` 8位

(1)  4420H
$$
\a{
4420H = [\r{0100\ 01}\g{00}\ \b{0010\ 0000}] \\
EA = 00100000

}
$$
(2) 2244H
$$
\a{
2244H = [\r{0010\ 00}\g{10}\ \b{0100\ 0100}] \\
EA = 01000100 + (X2) = 44H + 1122H = 1166H
}
$$
(3) 1322H
$$
\a{
1322H = [\r{0001\ 00}\g{11}\ \b{0010\ 0010}] \\
PC = PC + 2 = 1234H + 2 = 1236H \\
EA = PC + D = 1236H + 22H = 1258H
}
$$
$PC$ 在 `取完当前指令` 后，立即增加 `当前指令的长度` $2$ 字节

然后 `有效地址` $EA$ 再根据 $PC$ 进行 `相对偏移` （偏移增量 $D$）

(4) 3521H
$$
\a{
3521H = [\r{0011\ 01}\g{01}\ \b{0010\ 0001}] \\
EA = (X1) + D = (0037H) + 21H = 58H
}
$$
`PC相对寻址` 可以认为是 `变址寻址` 的一种，只不过 `PC` 属于 `特殊用途寄存器`。