---
title: "solve back-tracking & IDDFS"
date: 2022-04-12 21:15:00
tags:
  - algorithm
---

{% raw %}

<h1>Backtracking</h1>
<h2>Integer Transformation Problem</h2>
<h3>Description</h3>
<p>整數變換問題。關於整數 i 的變換 f 和 g 定義如下：f(i)=3i；g(i)=i/2 (向下取整)。
試設計一個算法，對於給定的 2 個整數 n 和 m，用最少的 f 和 g 變換次數將 n 變換為 m。
例如，可以將整數 15 用 4 次變換將它變換為整數 4：4=gfgg(15)。當整數 n 不可能變換
為整數 m 時，算法應如何處理?</p>
<h3>Input</h3>
<p>由文件 input.txt 給出輸入數據。第一行有 2 個正整數 n 和 m。</p>
<h3>Output</h3>
<p>將計算出的最少變換次數以及相應的變換序列輸出到文件 output.txt。文件的第一行是
最少變換次數。文件的第 2 行是相應的變換序列。</p>
<h3>Sample</h3>
<p><strong>輸入文件示例</strong></p>
<p>input.txt</p>
<p>15 4</p>
<p><strong>輸出文件示例</strong></p>
<p>output.txt
4
gfgg</p>
<h3>Analysis</h3>
<h4>DFS</h4>
<p>定義 <code>轉變函數 (Transformation Function)</code> <mjx-container class="MathJax" jax="SVG" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="4.299ex" height="2.262ex" role="img" focusable="false" viewBox="0 -750 1900 1000" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -0.566ex;"><defs><path id="MJX-19-TEX-I-1D453" d="M118 -162Q120 -162 124 -164T135 -167T147 -168Q160 -168 171 -155T187 -126Q197 -99 221 27T267 267T289 382V385H242Q195 385 192 387Q188 390 188 397L195 425Q197 430 203 430T250 431Q298 431 298 432Q298 434 307 482T319 540Q356 705 465 705Q502 703 526 683T550 630Q550 594 529 578T487 561Q443 561 443 603Q443 622 454 636T478 657L487 662Q471 668 457 668Q445 668 434 658T419 630Q412 601 403 552T387 469T380 433Q380 431 435 431Q480 431 487 430T498 424Q499 420 496 407T491 391Q489 386 482 386T428 385H372L349 263Q301 15 282 -47Q255 -132 212 -173Q175 -205 139 -205Q107 -205 81 -186T55 -132Q55 -95 76 -78T118 -61Q162 -61 162 -103Q162 -122 151 -136T127 -157L118 -162Z"></path><path id="MJX-19-TEX-N-28" d="M94 250Q94 319 104 381T127 488T164 576T202 643T244 695T277 729T302 750H315H319Q333 750 333 741Q333 738 316 720T275 667T226 581T184 443T167 250T184 58T225 -81T274 -167T316 -220T333 -241Q333 -250 318 -250H315H302L274 -226Q180 -141 137 -14T94 250Z"></path><path id="MJX-19-TEX-I-1D465" d="M52 289Q59 331 106 386T222 442Q257 442 286 424T329 379Q371 442 430 442Q467 442 494 420T522 361Q522 332 508 314T481 292T458 288Q439 288 427 299T415 328Q415 374 465 391Q454 404 425 404Q412 404 406 402Q368 386 350 336Q290 115 290 78Q290 50 306 38T341 26Q378 26 414 59T463 140Q466 150 469 151T485 153H489Q504 153 504 145Q504 144 502 134Q486 77 440 33T333 -11Q263 -11 227 52Q186 -10 133 -10H127Q78 -10 57 16T35 71Q35 103 54 123T99 143Q142 143 142 101Q142 81 130 66T107 46T94 41L91 40Q91 39 97 36T113 29T132 26Q168 26 194 71Q203 87 217 139T245 247T261 313Q266 340 266 352Q266 380 251 392T217 404Q177 404 142 372T93 290Q91 281 88 280T72 278H58Q52 284 52 289Z"></path><path id="MJX-19-TEX-N-29" d="M60 749L64 750Q69 750 74 750H86L114 726Q208 641 251 514T294 250Q294 182 284 119T261 12T224 -76T186 -143T145 -194T113 -227T90 -246Q87 -249 86 -250H74Q66 -250 63 -250T58 -247T55 -238Q56 -237 66 -225Q221 -64 221 250T66 725Q56 737 55 738Q55 746 60 749Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mi"><use data-c="1D453" xlink:href="#MJX-19-TEX-I-1D453"></use></g><g data-mml-node="mo" transform="translate(550,0)"><use data-c="28" xlink:href="#MJX-19-TEX-N-28"></use></g><g data-mml-node="mi" transform="translate(939,0)"><use data-c="1D465" xlink:href="#MJX-19-TEX-I-1D465"></use></g><g data-mml-node="mo" transform="translate(1511,0)"><use data-c="29" xlink:href="#MJX-19-TEX-N-29"></use></g></g></g></svg></mjx-container><script type="math/tex">f(x)</script> 和 <mjx-container class="MathJax" jax="SVG" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="4.133ex" height="2.262ex" role="img" focusable="false" viewBox="0 -750 1827 1000" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -0.566ex;"><defs><path id="MJX-20-TEX-I-1D454" d="M311 43Q296 30 267 15T206 0Q143 0 105 45T66 160Q66 265 143 353T314 442Q361 442 401 394L404 398Q406 401 409 404T418 412T431 419T447 422Q461 422 470 413T480 394Q480 379 423 152T363 -80Q345 -134 286 -169T151 -205Q10 -205 10 -137Q10 -111 28 -91T74 -71Q89 -71 102 -80T116 -111Q116 -121 114 -130T107 -144T99 -154T92 -162L90 -164H91Q101 -167 151 -167Q189 -167 211 -155Q234 -144 254 -122T282 -75Q288 -56 298 -13Q311 35 311 43ZM384 328L380 339Q377 350 375 354T369 368T359 382T346 393T328 402T306 405Q262 405 221 352Q191 313 171 233T151 117Q151 38 213 38Q269 38 323 108L331 118L384 328Z"></path><path id="MJX-20-TEX-N-28" d="M94 250Q94 319 104 381T127 488T164 576T202 643T244 695T277 729T302 750H315H319Q333 750 333 741Q333 738 316 720T275 667T226 581T184 443T167 250T184 58T225 -81T274 -167T316 -220T333 -241Q333 -250 318 -250H315H302L274 -226Q180 -141 137 -14T94 250Z"></path><path id="MJX-20-TEX-I-1D465" d="M52 289Q59 331 106 386T222 442Q257 442 286 424T329 379Q371 442 430 442Q467 442 494 420T522 361Q522 332 508 314T481 292T458 288Q439 288 427 299T415 328Q415 374 465 391Q454 404 425 404Q412 404 406 402Q368 386 350 336Q290 115 290 78Q290 50 306 38T341 26Q378 26 414 59T463 140Q466 150 469 151T485 153H489Q504 153 504 145Q504 144 502 134Q486 77 440 33T333 -11Q263 -11 227 52Q186 -10 133 -10H127Q78 -10 57 16T35 71Q35 103 54 123T99 143Q142 143 142 101Q142 81 130 66T107 46T94 41L91 40Q91 39 97 36T113 29T132 26Q168 26 194 71Q203 87 217 139T245 247T261 313Q266 340 266 352Q266 380 251 392T217 404Q177 404 142 372T93 290Q91 281 88 280T72 278H58Q52 284 52 289Z"></path><path id="MJX-20-TEX-N-29" d="M60 749L64 750Q69 750 74 750H86L114 726Q208 641 251 514T294 250Q294 182 284 119T261 12T224 -76T186 -143T145 -194T113 -227T90 -246Q87 -249 86 -250H74Q66 -250 63 -250T58 -247T55 -238Q56 -237 66 -225Q221 -64 221 250T66 725Q56 737 55 738Q55 746 60 749Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mi"><use data-c="1D454" xlink:href="#MJX-20-TEX-I-1D454"></use></g><g data-mml-node="mo" transform="translate(477,0)"><use data-c="28" xlink:href="#MJX-20-TEX-N-28"></use></g><g data-mml-node="mi" transform="translate(866,0)"><use data-c="1D465" xlink:href="#MJX-20-TEX-I-1D465"></use></g><g data-mml-node="mo" transform="translate(1438,0)"><use data-c="29" xlink:href="#MJX-20-TEX-N-29"></use></g></g></g></svg></mjx-container><script type="math/tex">g(x)</script></p>
<p>由於需要求出，對於給定輸入<code>整數n</code>，是否可以 <code>某種轉變函數序列</code>來 <code>轉變</code>到 <code>整數m</code></p>
<p>我們不妨首先考慮使用 <code>Brute-Force Method</code>來處理該問題。</p>
<p>因為存在2種轉變方式，所以我們定義的遞歸是 <code>2路遞歸</code>。</p>
<blockquote><p>換句話說，這個 <code>遞歸方法</code>產生的 <code>解空間樹</code>是一顆 <code>二叉樹</code></p>
</blockquote>
<p>同時，我們通過題意可知，<code>遞歸次數的下界</code>為 <code>0</code>，但 <code>遞歸次數的上界</code>未知。</p>
<p>我們做一個 <code>猜測</code>：如果 <code>遞歸次數</code>超過 <code>整數n</code>，則 <code>不太可能</code> 存在解。</p>
<p>於是，對於該方法，我們會按照 <code>深度優先搜索</code>的順序來訪問 <code>解空間樹</code></p>
<blockquote><p>假設我們已知擁有了 <code>整顆解空間樹 (二叉樹)</code>。則實際上，我們會直觀地發現，</p>
<p>我們會從 <code>樹根</code>節點開始，沿著一條  <code>路徑</code>做 <code>深度搜索</code>，直到抵達 <code>我們設定的最大層次 （也就是我們預測的遞歸次數的上界）</code>，再進行 <code>回溯</code>。（這個過程產生的方案是：<mjx-container class="MathJax" jax="SVG" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="39.035ex" height="5.585ex" role="img" focusable="false" viewBox="0 -705 17253.5 2468.8" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -3.99ex;"><defs><path id="MJX-15-TEX-I-1D453" d="M118 -162Q120 -162 124 -164T135 -167T147 -168Q160 -168 171 -155T187 -126Q197 -99 221 27T267 267T289 382V385H242Q195 385 192 387Q188 390 188 397L195 425Q197 430 203 430T250 431Q298 431 298 432Q298 434 307 482T319 540Q356 705 465 705Q502 703 526 683T550 630Q550 594 529 578T487 561Q443 561 443 603Q443 622 454 636T478 657L487 662Q471 668 457 668Q445 668 434 658T419 630Q412 601 403 552T387 469T380 433Q380 431 435 431Q480 431 487 430T498 424Q499 420 496 407T491 391Q489 386 482 386T428 385H372L349 263Q301 15 282 -47Q255 -132 212 -173Q175 -205 139 -205Q107 -205 81 -186T55 -132Q55 -95 76 -78T118 -61Q162 -61 162 -103Q162 -122 151 -136T127 -157L118 -162Z"></path><path id="MJX-15-TEX-N-2192" d="M56 237T56 250T70 270H835Q719 357 692 493Q692 494 692 496T691 499Q691 511 708 511H711Q720 511 723 510T729 506T732 497T735 481T743 456Q765 389 816 336T935 261Q944 258 944 250Q944 244 939 241T915 231T877 212Q836 186 806 152T761 85T740 35T732 4Q730 -6 727 -8T711 -11Q691 -11 691 0Q691 7 696 25Q728 151 835 230H70Q56 237 56 250Z"></path><path id="MJX-15-TEX-N-22EF" d="M78 250Q78 274 95 292T138 310Q162 310 180 294T199 251Q199 226 182 208T139 190T96 207T78 250ZM525 250Q525 274 542 292T585 310Q609 310 627 294T646 251Q646 226 629 208T586 190T543 207T525 250ZM972 250Q972 274 989 292T1032 310Q1056 310 1074 294T1093 251Q1093 226 1076 208T1033 190T990 207T972 250Z"></path><path id="MJX-15-TEX-S4-E152" d="M-24 327L-18 333H-1Q11 333 15 333T22 329T27 322T35 308T54 284Q115 203 225 162T441 120Q454 120 457 117T460 95V60V28Q460 8 457 4T442 0Q355 0 260 36Q75 118 -16 278L-24 292V327Z"></path><path id="MJX-15-TEX-S4-E153" d="M-10 60V95Q-10 113 -7 116T9 120Q151 120 250 171T396 284Q404 293 412 305T424 324T431 331Q433 333 451 333H468L474 327V292L466 278Q375 118 190 36Q95 0 8 0Q-5 0 -7 3T-10 24V60Z"></path><path id="MJX-15-TEX-S4-E151" d="M-10 60Q-10 104 -10 111T-5 118Q-1 120 10 120Q96 120 190 84Q375 2 466 -158L474 -172V-207L468 -213H451H447Q437 -213 434 -213T428 -209T423 -202T414 -187T396 -163Q331 -82 224 -41T9 0Q-4 0 -7 3T-10 25V60Z"></path><path id="MJX-15-TEX-S4-E150" d="M-18 -213L-24 -207V-172L-16 -158Q75 2 260 84Q334 113 415 119Q418 119 427 119T440 120Q454 120 457 117T460 98V60V25Q460 7 457 4T441 0Q308 0 193 -55T25 -205Q21 -211 18 -212T-1 -213H-18Z"></path><path id="MJX-15-TEX-S4-E154" d="M-10 0V120H410V0H-10Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mi"><use data-c="1D453" xlink:href="#MJX-15-TEX-I-1D453"></use></g><g data-mml-node="mo" transform="translate(827.8,0)"><use data-c="2192" xlink:href="#MJX-15-TEX-N-2192"></use></g><g data-mml-node="mi" transform="translate(2105.6,0)"><use data-c="1D453" xlink:href="#MJX-15-TEX-I-1D453"></use></g><g data-mml-node="mi" transform="translate(2655.6,0)"><use data-c="1D453" xlink:href="#MJX-15-TEX-I-1D453"></use></g><g data-mml-node="mo" transform="translate(3483.3,0)"><use data-c="2192" xlink:href="#MJX-15-TEX-N-2192"></use></g><g data-mml-node="mi" transform="translate(4761.1,0)"><use data-c="1D453" xlink:href="#MJX-15-TEX-I-1D453"></use></g><g data-mml-node="mi" transform="translate(5311.1,0)"><use data-c="1D453" xlink:href="#MJX-15-TEX-I-1D453"></use></g><g data-mml-node="mi" transform="translate(5861.1,0)"><use data-c="1D453" xlink:href="#MJX-15-TEX-I-1D453"></use></g><g data-mml-node="mo" transform="translate(6577.8,0)"><use data-c="22EF" xlink:href="#MJX-15-TEX-N-22EF"></use></g><g data-mml-node="mo" transform="translate(8027.6,0)"><use data-c="2192" xlink:href="#MJX-15-TEX-N-2192"></use></g><g data-mml-node="munder" transform="translate(9305.3,0)"><g data-mml-node="TeXAtom" data-mjx-texclass="OP" transform="translate(2671.4,0)"><g data-mml-node="munder"><g data-mml-node="mrow"><g data-mml-node="mi"><use data-c="1D453" xlink:href="#MJX-15-TEX-I-1D453"></use></g><g data-mml-node="mo" transform="translate(716.7,0)"><use data-c="22EF" xlink:href="#MJX-15-TEX-N-22EF"></use></g><g data-mml-node="mi" transform="translate(2055.3,0)"><use data-c="1D453" xlink:href="#MJX-15-TEX-I-1D453"></use></g></g><g data-mml-node="mo" transform="translate(0,-630)"><use data-c="E152" xlink:href="#MJX-15-TEX-S4-E152"></use><use data-c="E153" xlink:href="#MJX-15-TEX-S4-E153" transform="translate(2155.3,0)"></use><g data-c="E156" transform="translate(852.7,0)"><use data-c="E151" xlink:href="#MJX-15-TEX-S4-E151"></use><use data-c="E150" xlink:href="#MJX-15-TEX-S4-E150" transform="translate(450,0)"></use></g><svg width="602.7" height="720" x="350" y="-300" viewBox="150.7 -300 602.7 720"><use data-c="E154" xlink:href="#MJX-15-TEX-S4-E154" transform="scale(2.26,1)"></use></svg><svg width="602.7" height="720" x="1652.7" y="-300" viewBox="150.7 -300 602.7 720"><use data-c="E154" xlink:href="#MJX-15-TEX-S4-E154" transform="scale(2.26,1)"></use></svg></g></g></g><g data-mml-node="TeXAtom" transform="translate(0,-1522.3) scale(0.707)" data-mjx-texclass="ORD"><g data-mml-node="mtext"><text data-variant="normal" transform="scale(1,-1)" font-size="884px" font-family="serif">我</text></g><g data-mml-node="mtext" transform="translate(980.8,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="884px" font-family="serif">們</text></g><g data-mml-node="mtext" transform="translate(1916.4,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="884px" font-family="serif">設</text></g><g data-mml-node="mtext" transform="translate(2845.6,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="884px" font-family="serif">定</text></g><g data-mml-node="mtext" transform="translate(3781.2,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="884px" font-family="serif">的</text></g><g data-mml-node="mtext" transform="translate(4665.2,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="884px" font-family="serif">遞</text></g><g data-mml-node="mtext" transform="translate(5646,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="884px" font-family="serif">歸</text></g><g data-mml-node="mtext" transform="translate(6530,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="884px" font-family="serif">的</text></g><g data-mml-node="mtext" transform="translate(7414,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="884px" font-family="serif">最</text></g><g data-mml-node="mtext" transform="translate(8394.8,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="884px" font-family="serif">大</text></g><g data-mml-node="mtext" transform="translate(9375.6,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="884px" font-family="serif">深</text></g><g data-mml-node="mtext" transform="translate(10304.7,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="884px" font-family="serif">度</text></g></g></g></g></g></svg></mjx-container><script type="math/tex">f \rightarrow ff \rightarrow fff \cdots \rightarrow \underbrace{f\cdots f}_{我們設定的遞歸的最大深度}</script></p>
<pre><code class="language-mermaid" lang="mermaid">graph TD;
root((root)) --&gt; f((f));
style f fill:pink,stroke:#333,stroke-width:4px
root((root)) --&gt; g((g));
f --&gt; ff((f));
style ff fill:pink,stroke:#333,stroke-width:4px
f --&gt; fg((g));
g --&gt; gf((f));
g --&gt; gg((g));
ff --&gt; fff((f));
style fff fill:pink,stroke:#333,stroke-width:4px
ff --&gt; ffg((g));
fg --&gt; fgf((f));
fg --&gt; fgg((g));
gf --&gt; gff((f));
gf --&gt; gfg((g));
gg --&gt; ggf((f));
gg --&gt; ggg((g));
fff --&gt; ffff((f));
style ffff fill:pink,stroke:#333,stroke-width:4px
fff --&gt; fffg((g));
ffg --&gt; ffgf((f));
ffg --&gt; ffgg((g));
fgf --&gt; fgff((f));
fgf --&gt; fgfg((g));
fgg --&gt; fggf((f));
fgg --&gt; fggg((g));
gff --&gt; gfff((f));
gff --&gt; gffg((g));
gfg --&gt; gfgf((f));
gfg --&gt; gfgg((g));
ggf --&gt; ggff((f));
ggf --&gt; ggfg((g));
ggg --&gt; gggf((f));
ggg --&gt; gggg((g));

</code></pre>
<blockquote><p>當然，如果說，在 <code>沿著當前路徑</code>   <code>抵達人為設定的遞歸的最大深度</code>之前，我們 <code>幸運地</code>發現，已經找到了 <code>解</code>。</p>
<blockquote><p>但是請註意：這個 <code>解</code>並不一定是 <code>最優解</code>，因為我們實際上進行的是 <code>深度優先搜索</code>。</p>
<p><code>這個解</code>只不過是 <code>當前搜索路徑</code>上的 <code>最優解</code>：因為在 <code>當前搜索路徑</code>上，<code>該解</code>是 <code>第一個被發現的解</code>。</p>
<p>根據題目的性質，我們可以知道，<code>在該條路徑上的後續發現的解</code> 並不會 <code>優於</code> <code>在該條路徑上被發現的第一個解</code>。</p>
</blockquote>
</blockquote>
<p>如果，我們 <code>十分不幸運</code>，在 <code>沿著該條深度優先搜索路徑</code> <code>抵達我們人為設定的最大遞歸深度</code>時，仍然 <code>未發現解</code>，</p>
<p>則此時我們方法會見 <code>回溯1步</code>：<mjx-container class="MathJax" jax="SVG" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="20.12ex" height="2.059ex" role="img" focusable="false" viewBox="0 -705 8893.2 910" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -0.464ex;"><defs><path id="MJX-16-TEX-I-1D453" d="M118 -162Q120 -162 124 -164T135 -167T147 -168Q160 -168 171 -155T187 -126Q197 -99 221 27T267 267T289 382V385H242Q195 385 192 387Q188 390 188 397L195 425Q197 430 203 430T250 431Q298 431 298 432Q298 434 307 482T319 540Q356 705 465 705Q502 703 526 683T550 630Q550 594 529 578T487 561Q443 561 443 603Q443 622 454 636T478 657L487 662Q471 668 457 668Q445 668 434 658T419 630Q412 601 403 552T387 469T380 433Q380 431 435 431Q480 431 487 430T498 424Q499 420 496 407T491 391Q489 386 482 386T428 385H372L349 263Q301 15 282 -47Q255 -132 212 -173Q175 -205 139 -205Q107 -205 81 -186T55 -132Q55 -95 76 -78T118 -61Q162 -61 162 -103Q162 -122 151 -136T127 -157L118 -162Z"></path><path id="MJX-16-TEX-N-22EF" d="M78 250Q78 274 95 292T138 310Q162 310 180 294T199 251Q199 226 182 208T139 190T96 207T78 250ZM525 250Q525 274 542 292T585 310Q609 310 627 294T646 251Q646 226 629 208T586 190T543 207T525 250ZM972 250Q972 274 989 292T1032 310Q1056 310 1074 294T1093 251Q1093 226 1076 208T1033 190T990 207T972 250Z"></path><path id="MJX-16-TEX-N-2192" d="M56 237T56 250T70 270H835Q719 357 692 493Q692 494 692 496T691 499Q691 511 708 511H711Q720 511 723 510T729 506T732 497T735 481T743 456Q765 389 816 336T935 261Q944 258 944 250Q944 244 939 241T915 231T877 212Q836 186 806 152T761 85T740 35T732 4Q730 -6 727 -8T711 -11Q691 -11 691 0Q691 7 696 25Q728 151 835 230H70Q56 237 56 250Z"></path><path id="MJX-16-TEX-I-1D454" d="M311 43Q296 30 267 15T206 0Q143 0 105 45T66 160Q66 265 143 353T314 442Q361 442 401 394L404 398Q406 401 409 404T418 412T431 419T447 422Q461 422 470 413T480 394Q480 379 423 152T363 -80Q345 -134 286 -169T151 -205Q10 -205 10 -137Q10 -111 28 -91T74 -71Q89 -71 102 -80T116 -111Q116 -121 114 -130T107 -144T99 -154T92 -162L90 -164H91Q101 -167 151 -167Q189 -167 211 -155Q234 -144 254 -122T282 -75Q288 -56 298 -13Q311 35 311 43ZM384 328L380 339Q377 350 375 354T369 368T359 382T346 393T328 402T306 405Q262 405 221 352Q191 313 171 233T151 117Q151 38 213 38Q269 38 323 108L331 118L384 328Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mi"><use data-c="1D453" xlink:href="#MJX-16-TEX-I-1D453"></use></g><g data-mml-node="mo" transform="translate(716.7,0)"><use data-c="22EF" xlink:href="#MJX-16-TEX-N-22EF"></use></g><g data-mml-node="mi" transform="translate(2055.3,0)"><use data-c="1D453" xlink:href="#MJX-16-TEX-I-1D453"></use></g><g data-mml-node="mi" transform="translate(2605.3,0)"><use data-c="1D453" xlink:href="#MJX-16-TEX-I-1D453"></use></g><g data-mml-node="mi" transform="translate(3155.3,0)"><use data-c="1D453" xlink:href="#MJX-16-TEX-I-1D453"></use></g><g data-mml-node="mo" transform="translate(3983.1,0)"><use data-c="2192" xlink:href="#MJX-16-TEX-N-2192"></use></g><g data-mml-node="mi" transform="translate(5260.9,0)"><use data-c="1D453" xlink:href="#MJX-16-TEX-I-1D453"></use></g><g data-mml-node="mo" transform="translate(5977.6,0)"><use data-c="22EF" xlink:href="#MJX-16-TEX-N-22EF"></use></g><g data-mml-node="mi" transform="translate(7316.2,0)"><use data-c="1D453" xlink:href="#MJX-16-TEX-I-1D453"></use></g><g data-mml-node="mi" transform="translate(7866.2,0)"><use data-c="1D453" xlink:href="#MJX-16-TEX-I-1D453"></use></g><g data-mml-node="mi" transform="translate(8416.2,0)"><use data-c="1D454" xlink:href="#MJX-16-TEX-I-1D454"></use></g></g></g></svg></mjx-container><script type="math/tex">f\cdots fff \rightarrow f \cdots ffg</script></p>
<pre><code class="language-mermaid" lang="mermaid">graph TD;
root((root)) --&gt; f((f));
style f fill:pink,stroke:#333,stroke-width:4px
root((root)) --&gt; g((g));
f --&gt; ff((f));
style ff fill:pink,stroke:#333,stroke-width:4px
f --&gt; fg((g));
g --&gt; gf((f));
g --&gt; gg((g));
ff --&gt; fff((f));
style fff fill:pink,stroke:#333,stroke-width:4px
ff --&gt; ffg((g));
fg --&gt; fgf((f));
fg --&gt; fgg((g));
gf --&gt; gff((f));
gf --&gt; gfg((g));
gg --&gt; ggf((f));
gg --&gt; ggg((g));
fff --&gt; ffff((f));
fff --&gt; fffg((g));
style fffg fill:pink,stroke:#333,stroke-width:4px
ffg --&gt; ffgf((f));
ffg --&gt; ffgg((g));
fgf --&gt; fgff((f));
fgf --&gt; fgfg((g));
fgg --&gt; fggf((f));
fgg --&gt; fggg((g));
gff --&gt; gfff((f));
gff --&gt; gffg((g));
gfg --&gt; gfgf((f));
gfg --&gt; gfgg((g));
ggf --&gt; ggff((f));
ggf --&gt; ggfg((g));
ggg --&gt; gggf((f));
ggg --&gt; gggg((g));


</code></pre>
<p>&nbsp;</p>
<p>如果此時還 <code>未發現解</code>，則 <code>再回溯1步</code>：<mjx-container class="MathJax" jax="SVG" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="19.955ex" height="2.059ex" role="img" focusable="false" viewBox="0 -705 8820.2 910" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -0.464ex;"><defs><path id="MJX-17-TEX-I-1D453" d="M118 -162Q120 -162 124 -164T135 -167T147 -168Q160 -168 171 -155T187 -126Q197 -99 221 27T267 267T289 382V385H242Q195 385 192 387Q188 390 188 397L195 425Q197 430 203 430T250 431Q298 431 298 432Q298 434 307 482T319 540Q356 705 465 705Q502 703 526 683T550 630Q550 594 529 578T487 561Q443 561 443 603Q443 622 454 636T478 657L487 662Q471 668 457 668Q445 668 434 658T419 630Q412 601 403 552T387 469T380 433Q380 431 435 431Q480 431 487 430T498 424Q499 420 496 407T491 391Q489 386 482 386T428 385H372L349 263Q301 15 282 -47Q255 -132 212 -173Q175 -205 139 -205Q107 -205 81 -186T55 -132Q55 -95 76 -78T118 -61Q162 -61 162 -103Q162 -122 151 -136T127 -157L118 -162Z"></path><path id="MJX-17-TEX-N-22EF" d="M78 250Q78 274 95 292T138 310Q162 310 180 294T199 251Q199 226 182 208T139 190T96 207T78 250ZM525 250Q525 274 542 292T585 310Q609 310 627 294T646 251Q646 226 629 208T586 190T543 207T525 250ZM972 250Q972 274 989 292T1032 310Q1056 310 1074 294T1093 251Q1093 226 1076 208T1033 190T990 207T972 250Z"></path><path id="MJX-17-TEX-I-1D454" d="M311 43Q296 30 267 15T206 0Q143 0 105 45T66 160Q66 265 143 353T314 442Q361 442 401 394L404 398Q406 401 409 404T418 412T431 419T447 422Q461 422 470 413T480 394Q480 379 423 152T363 -80Q345 -134 286 -169T151 -205Q10 -205 10 -137Q10 -111 28 -91T74 -71Q89 -71 102 -80T116 -111Q116 -121 114 -130T107 -144T99 -154T92 -162L90 -164H91Q101 -167 151 -167Q189 -167 211 -155Q234 -144 254 -122T282 -75Q288 -56 298 -13Q311 35 311 43ZM384 328L380 339Q377 350 375 354T369 368T359 382T346 393T328 402T306 405Q262 405 221 352Q191 313 171 233T151 117Q151 38 213 38Q269 38 323 108L331 118L384 328Z"></path><path id="MJX-17-TEX-N-2192" d="M56 237T56 250T70 270H835Q719 357 692 493Q692 494 692 496T691 499Q691 511 708 511H711Q720 511 723 510T729 506T732 497T735 481T743 456Q765 389 816 336T935 261Q944 258 944 250Q944 244 939 241T915 231T877 212Q836 186 806 152T761 85T740 35T732 4Q730 -6 727 -8T711 -11Q691 -11 691 0Q691 7 696 25Q728 151 835 230H70Q56 237 56 250Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mi"><use data-c="1D453" xlink:href="#MJX-17-TEX-I-1D453"></use></g><g data-mml-node="mo" transform="translate(716.7,0)"><use data-c="22EF" xlink:href="#MJX-17-TEX-N-22EF"></use></g><g data-mml-node="mi" transform="translate(2055.3,0)"><use data-c="1D453" xlink:href="#MJX-17-TEX-I-1D453"></use></g><g data-mml-node="mi" transform="translate(2605.3,0)"><use data-c="1D453" xlink:href="#MJX-17-TEX-I-1D453"></use></g><g data-mml-node="mi" transform="translate(3155.3,0)"><use data-c="1D454" xlink:href="#MJX-17-TEX-I-1D454"></use></g><g data-mml-node="mo" transform="translate(3910.1,0)"><use data-c="2192" xlink:href="#MJX-17-TEX-N-2192"></use></g><g data-mml-node="mi" transform="translate(5187.9,0)"><use data-c="1D453" xlink:href="#MJX-17-TEX-I-1D453"></use></g><g data-mml-node="mo" transform="translate(5904.6,0)"><use data-c="22EF" xlink:href="#MJX-17-TEX-N-22EF"></use></g><g data-mml-node="mi" transform="translate(7243.2,0)"><use data-c="1D453" xlink:href="#MJX-17-TEX-I-1D453"></use></g><g data-mml-node="mi" transform="translate(7793.2,0)"><use data-c="1D454" xlink:href="#MJX-17-TEX-I-1D454"></use></g><g data-mml-node="mi" transform="translate(8270.2,0)"><use data-c="1D453" xlink:href="#MJX-17-TEX-I-1D453"></use></g></g></g></svg></mjx-container><script type="math/tex">f\cdots ffg \rightarrow f\cdots fgf</script></p>
<pre><code class="language-mermaid" lang="mermaid">graph TD;
root((root)) --&gt; f((f));
style f fill:pink,stroke:#333,stroke-width:4px
root((root)) --&gt; g((g));
f --&gt; ff((f));
style ff fill:pink,stroke:#333,stroke-width:4px
f --&gt; fg((g));
g --&gt; gf((f));
g --&gt; gg((g));
ff --&gt; fff((f));
ff --&gt; ffg((g));
style ffg fill:pink,stroke:#333,stroke-width:4px
fg --&gt; fgf((f));
fg --&gt; fgg((g));
gf --&gt; gff((f));
gf --&gt; gfg((g));
gg --&gt; ggf((f));
gg --&gt; ggg((g));
fff --&gt; ffff((f));
fff --&gt; fffg((g));
ffg --&gt; ffgf((f));
style ffgf fill:pink,stroke:#333,stroke-width:4px
ffg --&gt; ffgg((g));
fgf --&gt; fgff((f));
fgf --&gt; fgfg((g));
fgg --&gt; fggf((f));
fgg --&gt; fggg((g));
gff --&gt; gfff((f));
gff --&gt; gffg((g));
gfg --&gt; gfgf((f));
gfg --&gt; gfgg((g));
ggf --&gt; ggff((f));
ggf --&gt; ggfg((g));
ggg --&gt; gggf((f));
ggg --&gt; gggg((g));
</code></pre>
<p>如果仍然 <code>未發現解</code>，則 <code>再回溯一步</code>： <mjx-container class="MathJax" jax="SVG" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="19.79ex" height="2.059ex" role="img" focusable="false" viewBox="0 -705 8747.2 910" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -0.464ex;"><defs><path id="MJX-18-TEX-I-1D453" d="M118 -162Q120 -162 124 -164T135 -167T147 -168Q160 -168 171 -155T187 -126Q197 -99 221 27T267 267T289 382V385H242Q195 385 192 387Q188 390 188 397L195 425Q197 430 203 430T250 431Q298 431 298 432Q298 434 307 482T319 540Q356 705 465 705Q502 703 526 683T550 630Q550 594 529 578T487 561Q443 561 443 603Q443 622 454 636T478 657L487 662Q471 668 457 668Q445 668 434 658T419 630Q412 601 403 552T387 469T380 433Q380 431 435 431Q480 431 487 430T498 424Q499 420 496 407T491 391Q489 386 482 386T428 385H372L349 263Q301 15 282 -47Q255 -132 212 -173Q175 -205 139 -205Q107 -205 81 -186T55 -132Q55 -95 76 -78T118 -61Q162 -61 162 -103Q162 -122 151 -136T127 -157L118 -162Z"></path><path id="MJX-18-TEX-N-22EF" d="M78 250Q78 274 95 292T138 310Q162 310 180 294T199 251Q199 226 182 208T139 190T96 207T78 250ZM525 250Q525 274 542 292T585 310Q609 310 627 294T646 251Q646 226 629 208T586 190T543 207T525 250ZM972 250Q972 274 989 292T1032 310Q1056 310 1074 294T1093 251Q1093 226 1076 208T1033 190T990 207T972 250Z"></path><path id="MJX-18-TEX-I-1D454" d="M311 43Q296 30 267 15T206 0Q143 0 105 45T66 160Q66 265 143 353T314 442Q361 442 401 394L404 398Q406 401 409 404T418 412T431 419T447 422Q461 422 470 413T480 394Q480 379 423 152T363 -80Q345 -134 286 -169T151 -205Q10 -205 10 -137Q10 -111 28 -91T74 -71Q89 -71 102 -80T116 -111Q116 -121 114 -130T107 -144T99 -154T92 -162L90 -164H91Q101 -167 151 -167Q189 -167 211 -155Q234 -144 254 -122T282 -75Q288 -56 298 -13Q311 35 311 43ZM384 328L380 339Q377 350 375 354T369 368T359 382T346 393T328 402T306 405Q262 405 221 352Q191 313 171 233T151 117Q151 38 213 38Q269 38 323 108L331 118L384 328Z"></path><path id="MJX-18-TEX-N-2192" d="M56 237T56 250T70 270H835Q719 357 692 493Q692 494 692 496T691 499Q691 511 708 511H711Q720 511 723 510T729 506T732 497T735 481T743 456Q765 389 816 336T935 261Q944 258 944 250Q944 244 939 241T915 231T877 212Q836 186 806 152T761 85T740 35T732 4Q730 -6 727 -8T711 -11Q691 -11 691 0Q691 7 696 25Q728 151 835 230H70Q56 237 56 250Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mi"><use data-c="1D453" xlink:href="#MJX-18-TEX-I-1D453"></use></g><g data-mml-node="mo" transform="translate(716.7,0)"><use data-c="22EF" xlink:href="#MJX-18-TEX-N-22EF"></use></g><g data-mml-node="mi" transform="translate(2055.3,0)"><use data-c="1D453" xlink:href="#MJX-18-TEX-I-1D453"></use></g><g data-mml-node="mi" transform="translate(2605.3,0)"><use data-c="1D454" xlink:href="#MJX-18-TEX-I-1D454"></use></g><g data-mml-node="mi" transform="translate(3082.3,0)"><use data-c="1D453" xlink:href="#MJX-18-TEX-I-1D453"></use></g><g data-mml-node="mo" transform="translate(3910.1,0)"><use data-c="2192" xlink:href="#MJX-18-TEX-N-2192"></use></g><g data-mml-node="mi" transform="translate(5187.9,0)"><use data-c="1D453" xlink:href="#MJX-18-TEX-I-1D453"></use></g><g data-mml-node="mo" transform="translate(5904.6,0)"><use data-c="22EF" xlink:href="#MJX-18-TEX-N-22EF"></use></g><g data-mml-node="mi" transform="translate(7243.2,0)"><use data-c="1D453" xlink:href="#MJX-18-TEX-I-1D453"></use></g><g data-mml-node="mi" transform="translate(7793.2,0)"><use data-c="1D454" xlink:href="#MJX-18-TEX-I-1D454"></use></g><g data-mml-node="mi" transform="translate(8270.2,0)"><use data-c="1D454" xlink:href="#MJX-18-TEX-I-1D454"></use></g></g></g></svg></mjx-container><script type="math/tex">f\cdots fgf \rightarrow f\cdots fgg</script></p>
<pre><code class="language-mermaid" lang="mermaid">graph TD;
root((root)) --&gt; f((f));
style f fill:pink,stroke:#333,stroke-width:4px
root((root)) --&gt; g((g));
f --&gt; ff((f));
style ff fill:pink,stroke:#333,stroke-width:4px
f --&gt; fg((g));
g --&gt; gf((f));
g --&gt; gg((g));
ff --&gt; fff((f));
ff --&gt; ffg((g));
style ffg fill:pink,stroke:#333,stroke-width:4px
fg --&gt; fgf((f));
fg --&gt; fgg((g));
gf --&gt; gff((f));
gf --&gt; gfg((g));
gg --&gt; ggf((f));
gg --&gt; ggg((g));
fff --&gt; ffff((f));
fff --&gt; fffg((g));
ffg --&gt; ffgf((f));
ffg --&gt; ffgg((g));
style ffgg fill:pink,stroke:#333,stroke-width:4px
fgf --&gt; fgff((f));
fgf --&gt; fgfg((g));
fgg --&gt; fggf((f));
fgg --&gt; fggg((g));
gff --&gt; gfff((f));
gff --&gt; gffg((g));
gfg --&gt; gfgf((f));
gfg --&gt; gfgg((g));
ggf --&gt; ggff((f));
ggf --&gt; ggfg((g));
ggg --&gt; gggf((f));
ggg --&gt; gggg((g));
</code></pre>
</blockquote>
<p>對此，我們發現一個 <code>比較嚴重的問題</code>。</p>
<p>我們觀察到，該 <code>深度優先搜索</code>方法在 <code>每一個遞歸層次</code>都會 <code>按順序執行</code><mjx-container class="MathJax" jax="SVG" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="4.299ex" height="2.262ex" role="img" focusable="false" viewBox="0 -750 1900 1000" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -0.566ex;"><defs><path id="MJX-19-TEX-I-1D453" d="M118 -162Q120 -162 124 -164T135 -167T147 -168Q160 -168 171 -155T187 -126Q197 -99 221 27T267 267T289 382V385H242Q195 385 192 387Q188 390 188 397L195 425Q197 430 203 430T250 431Q298 431 298 432Q298 434 307 482T319 540Q356 705 465 705Q502 703 526 683T550 630Q550 594 529 578T487 561Q443 561 443 603Q443 622 454 636T478 657L487 662Q471 668 457 668Q445 668 434 658T419 630Q412 601 403 552T387 469T380 433Q380 431 435 431Q480 431 487 430T498 424Q499 420 496 407T491 391Q489 386 482 386T428 385H372L349 263Q301 15 282 -47Q255 -132 212 -173Q175 -205 139 -205Q107 -205 81 -186T55 -132Q55 -95 76 -78T118 -61Q162 -61 162 -103Q162 -122 151 -136T127 -157L118 -162Z"></path><path id="MJX-19-TEX-N-28" d="M94 250Q94 319 104 381T127 488T164 576T202 643T244 695T277 729T302 750H315H319Q333 750 333 741Q333 738 316 720T275 667T226 581T184 443T167 250T184 58T225 -81T274 -167T316 -220T333 -241Q333 -250 318 -250H315H302L274 -226Q180 -141 137 -14T94 250Z"></path><path id="MJX-19-TEX-I-1D465" d="M52 289Q59 331 106 386T222 442Q257 442 286 424T329 379Q371 442 430 442Q467 442 494 420T522 361Q522 332 508 314T481 292T458 288Q439 288 427 299T415 328Q415 374 465 391Q454 404 425 404Q412 404 406 402Q368 386 350 336Q290 115 290 78Q290 50 306 38T341 26Q378 26 414 59T463 140Q466 150 469 151T485 153H489Q504 153 504 145Q504 144 502 134Q486 77 440 33T333 -11Q263 -11 227 52Q186 -10 133 -10H127Q78 -10 57 16T35 71Q35 103 54 123T99 143Q142 143 142 101Q142 81 130 66T107 46T94 41L91 40Q91 39 97 36T113 29T132 26Q168 26 194 71Q203 87 217 139T245 247T261 313Q266 340 266 352Q266 380 251 392T217 404Q177 404 142 372T93 290Q91 281 88 280T72 278H58Q52 284 52 289Z"></path><path id="MJX-19-TEX-N-29" d="M60 749L64 750Q69 750 74 750H86L114 726Q208 641 251 514T294 250Q294 182 284 119T261 12T224 -76T186 -143T145 -194T113 -227T90 -246Q87 -249 86 -250H74Q66 -250 63 -250T58 -247T55 -238Q56 -237 66 -225Q221 -64 221 250T66 725Q56 737 55 738Q55 746 60 749Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mi"><use data-c="1D453" xlink:href="#MJX-19-TEX-I-1D453"></use></g><g data-mml-node="mo" transform="translate(550,0)"><use data-c="28" xlink:href="#MJX-19-TEX-N-28"></use></g><g data-mml-node="mi" transform="translate(939,0)"><use data-c="1D465" xlink:href="#MJX-19-TEX-I-1D465"></use></g><g data-mml-node="mo" transform="translate(1511,0)"><use data-c="29" xlink:href="#MJX-19-TEX-N-29"></use></g></g></g></svg></mjx-container><script type="math/tex">f(x)</script>和<mjx-container class="MathJax" jax="SVG" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="4.133ex" height="2.262ex" role="img" focusable="false" viewBox="0 -750 1827 1000" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -0.566ex;"><defs><path id="MJX-20-TEX-I-1D454" d="M311 43Q296 30 267 15T206 0Q143 0 105 45T66 160Q66 265 143 353T314 442Q361 442 401 394L404 398Q406 401 409 404T418 412T431 419T447 422Q461 422 470 413T480 394Q480 379 423 152T363 -80Q345 -134 286 -169T151 -205Q10 -205 10 -137Q10 -111 28 -91T74 -71Q89 -71 102 -80T116 -111Q116 -121 114 -130T107 -144T99 -154T92 -162L90 -164H91Q101 -167 151 -167Q189 -167 211 -155Q234 -144 254 -122T282 -75Q288 -56 298 -13Q311 35 311 43ZM384 328L380 339Q377 350 375 354T369 368T359 382T346 393T328 402T306 405Q262 405 221 352Q191 313 171 233T151 117Q151 38 213 38Q269 38 323 108L331 118L384 328Z"></path><path id="MJX-20-TEX-N-28" d="M94 250Q94 319 104 381T127 488T164 576T202 643T244 695T277 729T302 750H315H319Q333 750 333 741Q333 738 316 720T275 667T226 581T184 443T167 250T184 58T225 -81T274 -167T316 -220T333 -241Q333 -250 318 -250H315H302L274 -226Q180 -141 137 -14T94 250Z"></path><path id="MJX-20-TEX-I-1D465" d="M52 289Q59 331 106 386T222 442Q257 442 286 424T329 379Q371 442 430 442Q467 442 494 420T522 361Q522 332 508 314T481 292T458 288Q439 288 427 299T415 328Q415 374 465 391Q454 404 425 404Q412 404 406 402Q368 386 350 336Q290 115 290 78Q290 50 306 38T341 26Q378 26 414 59T463 140Q466 150 469 151T485 153H489Q504 153 504 145Q504 144 502 134Q486 77 440 33T333 -11Q263 -11 227 52Q186 -10 133 -10H127Q78 -10 57 16T35 71Q35 103 54 123T99 143Q142 143 142 101Q142 81 130 66T107 46T94 41L91 40Q91 39 97 36T113 29T132 26Q168 26 194 71Q203 87 217 139T245 247T261 313Q266 340 266 352Q266 380 251 392T217 404Q177 404 142 372T93 290Q91 281 88 280T72 278H58Q52 284 52 289Z"></path><path id="MJX-20-TEX-N-29" d="M60 749L64 750Q69 750 74 750H86L114 726Q208 641 251 514T294 250Q294 182 284 119T261 12T224 -76T186 -143T145 -194T113 -227T90 -246Q87 -249 86 -250H74Q66 -250 63 -250T58 -247T55 -238Q56 -237 66 -225Q221 -64 221 250T66 725Q56 737 55 738Q55 746 60 749Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mi"><use data-c="1D454" xlink:href="#MJX-20-TEX-I-1D454"></use></g><g data-mml-node="mo" transform="translate(477,0)"><use data-c="28" xlink:href="#MJX-20-TEX-N-28"></use></g><g data-mml-node="mi" transform="translate(866,0)"><use data-c="1D465" xlink:href="#MJX-20-TEX-I-1D465"></use></g><g data-mml-node="mo" transform="translate(1438,0)"><use data-c="29" xlink:href="#MJX-20-TEX-N-29"></use></g></g></g></svg></mjx-container><script type="math/tex">g(x)</script>，</p>
<p>所以，它會先 <code>沿著一條路徑不斷下降到</code> <mjx-container class="MathJax" jax="SVG" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="8.383ex" height="2.059ex" role="img" focusable="false" viewBox="0 -705 3705.3 910" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -0.464ex;"><defs><path id="MJX-21-TEX-I-1D453" d="M118 -162Q120 -162 124 -164T135 -167T147 -168Q160 -168 171 -155T187 -126Q197 -99 221 27T267 267T289 382V385H242Q195 385 192 387Q188 390 188 397L195 425Q197 430 203 430T250 431Q298 431 298 432Q298 434 307 482T319 540Q356 705 465 705Q502 703 526 683T550 630Q550 594 529 578T487 561Q443 561 443 603Q443 622 454 636T478 657L487 662Q471 668 457 668Q445 668 434 658T419 630Q412 601 403 552T387 469T380 433Q380 431 435 431Q480 431 487 430T498 424Q499 420 496 407T491 391Q489 386 482 386T428 385H372L349 263Q301 15 282 -47Q255 -132 212 -173Q175 -205 139 -205Q107 -205 81 -186T55 -132Q55 -95 76 -78T118 -61Q162 -61 162 -103Q162 -122 151 -136T127 -157L118 -162Z"></path><path id="MJX-21-TEX-N-22EF" d="M78 250Q78 274 95 292T138 310Q162 310 180 294T199 251Q199 226 182 208T139 190T96 207T78 250ZM525 250Q525 274 542 292T585 310Q609 310 627 294T646 251Q646 226 629 208T586 190T543 207T525 250ZM972 250Q972 274 989 292T1032 310Q1056 310 1074 294T1093 251Q1093 226 1076 208T1033 190T990 207T972 250Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mi"><use data-c="1D453" xlink:href="#MJX-21-TEX-I-1D453"></use></g><g data-mml-node="mo" transform="translate(716.7,0)"><use data-c="22EF" xlink:href="#MJX-21-TEX-N-22EF"></use></g><g data-mml-node="mi" transform="translate(2055.3,0)"><use data-c="1D453" xlink:href="#MJX-21-TEX-I-1D453"></use></g><g data-mml-node="mi" transform="translate(2605.3,0)"><use data-c="1D453" xlink:href="#MJX-21-TEX-I-1D453"></use></g><g data-mml-node="mi" transform="translate(3155.3,0)"><use data-c="1D453" xlink:href="#MJX-21-TEX-I-1D453"></use></g></g></g></svg></mjx-container><script type="math/tex">f \cdots fff</script></p>
<pre><code class="language-mermaid" lang="mermaid">graph TD;
root((root)) --&gt; f((f));
style f fill:pink,stroke:#333,stroke-width:4px
root((root)) --&gt; g((g));
f --&gt; ff((f));
style ff fill:pink,stroke:#333,stroke-width:4px
f --&gt; fg((g));
g --&gt; gf((f));
g --&gt; gg((g));
ff --&gt; fff((f));
style fff fill:pink,stroke:#333,stroke-width:4px
ff --&gt; ffg((g));
fg --&gt; fgf((f));
fg --&gt; fgg((g));
gf --&gt; gff((f));
gf --&gt; gfg((g));
gg --&gt; ggf((f));
gg --&gt; ggg((g));
fff --&gt; ffff((f));
style ffff fill:pink,stroke:#333,stroke-width:4px
fff --&gt; fffg((g));
ffg --&gt; ffgf((f));
ffg --&gt; ffgg((g));
fgf --&gt; fgff((f));
fgf --&gt; fgfg((g));
fgg --&gt; fggf((f));
fgg --&gt; fggg((g));
gff --&gt; gfff((f));
gff --&gt; gffg((g));
gfg --&gt; gfgf((f));
gfg --&gt; gfgg((g));
ggf --&gt; ggff((f));
ggf --&gt; ggfg((g));
ggg --&gt; gggf((f));
ggg --&gt; gggg((g));
</code></pre>
<p>如果，我們要尋找的 <code>最優解</code>它不是以<mjx-container class="MathJax" jax="SVG" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="1.244ex" height="2.059ex" role="img" focusable="false" viewBox="0 -705 550 910" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -0.464ex;"><defs><path id="MJX-22-TEX-I-1D453" d="M118 -162Q120 -162 124 -164T135 -167T147 -168Q160 -168 171 -155T187 -126Q197 -99 221 27T267 267T289 382V385H242Q195 385 192 387Q188 390 188 397L195 425Q197 430 203 430T250 431Q298 431 298 432Q298 434 307 482T319 540Q356 705 465 705Q502 703 526 683T550 630Q550 594 529 578T487 561Q443 561 443 603Q443 622 454 636T478 657L487 662Q471 668 457 668Q445 668 434 658T419 630Q412 601 403 552T387 469T380 433Q380 431 435 431Q480 431 487 430T498 424Q499 420 496 407T491 391Q489 386 482 386T428 385H372L349 263Q301 15 282 -47Q255 -132 212 -173Q175 -205 139 -205Q107 -205 81 -186T55 -132Q55 -95 76 -78T118 -61Q162 -61 162 -103Q162 -122 151 -136T127 -157L118 -162Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mi"><use data-c="1D453" xlink:href="#MJX-22-TEX-I-1D453"></use></g></g></g></svg></mjx-container><script type="math/tex">f</script> <code>作為前綴的</code>，</p>
<p>那麽，我們對 <code>這整條深度優先搜索路徑所做的搜索</code>的工作 <code>都是浪費的</code>！</p>
<p>更極端地，如果 <code>最優解</code>是 <mjx-container class="MathJax" jax="SVG" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="7.722ex" height="1.464ex" role="img" focusable="false" viewBox="0 -442 3413.3 647" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -0.464ex;"><defs><path id="MJX-23-TEX-I-1D454" d="M311 43Q296 30 267 15T206 0Q143 0 105 45T66 160Q66 265 143 353T314 442Q361 442 401 394L404 398Q406 401 409 404T418 412T431 419T447 422Q461 422 470 413T480 394Q480 379 423 152T363 -80Q345 -134 286 -169T151 -205Q10 -205 10 -137Q10 -111 28 -91T74 -71Q89 -71 102 -80T116 -111Q116 -121 114 -130T107 -144T99 -154T92 -162L90 -164H91Q101 -167 151 -167Q189 -167 211 -155Q234 -144 254 -122T282 -75Q288 -56 298 -13Q311 35 311 43ZM384 328L380 339Q377 350 375 354T369 368T359 382T346 393T328 402T306 405Q262 405 221 352Q191 313 171 233T151 117Q151 38 213 38Q269 38 323 108L331 118L384 328Z"></path><path id="MJX-23-TEX-N-22EF" d="M78 250Q78 274 95 292T138 310Q162 310 180 294T199 251Q199 226 182 208T139 190T96 207T78 250ZM525 250Q525 274 542 292T585 310Q609 310 627 294T646 251Q646 226 629 208T586 190T543 207T525 250ZM972 250Q972 274 989 292T1032 310Q1056 310 1074 294T1093 251Q1093 226 1076 208T1033 190T990 207T972 250Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mi"><use data-c="1D454" xlink:href="#MJX-23-TEX-I-1D454"></use></g><g data-mml-node="mo" transform="translate(643.7,0)"><use data-c="22EF" xlink:href="#MJX-23-TEX-N-22EF"></use></g><g data-mml-node="mi" transform="translate(1982.3,0)"><use data-c="1D454" xlink:href="#MJX-23-TEX-I-1D454"></use></g><g data-mml-node="mi" transform="translate(2459.3,0)"><use data-c="1D454" xlink:href="#MJX-23-TEX-I-1D454"></use></g><g data-mml-node="mi" transform="translate(2936.3,0)"><use data-c="1D454" xlink:href="#MJX-23-TEX-I-1D454"></use></g></g></g></svg></mjx-container><script type="math/tex">g \cdots ggg</script>，那麽，我們 <code>所做的絕大部分搜索</code>都將是 <code>無用的</code></p>
<pre><code class="language-mermaid" lang="mermaid">graph TD;
root((root)) --&gt; f((f));
root((root)) --&gt; g((g));
style g fill:lightgreen,stroke:#333,stroke-width:4px
f --&gt; ff((f));
f --&gt; fg((g));
g --&gt; gf((f));
g --&gt; gg((g));
style gg fill:lightgreen,stroke:#333,stroke-width:4px
ff --&gt; fff((f));
ff --&gt; ffg((g));
fg --&gt; fgf((f));
fg --&gt; fgg((g));
gf --&gt; gff((f));
gf --&gt; gfg((g));
gg --&gt; ggf((f));
gg --&gt; ggg((g));
style ggg fill:lightgreen,stroke:#333,stroke-width:4px
fff --&gt; ffff((f));
fff --&gt; fffg((g));
ffg --&gt; ffgf((f));
ffg --&gt; ffgg((g));
fgf --&gt; fgff((f));
fgf --&gt; fgfg((g));
fgg --&gt; fggf((f));
fgg --&gt; fggg((g));
gff --&gt; gfff((f));
gff --&gt; gffg((g));
gfg --&gt; gfgf((f));
gfg --&gt; gfgg((g));
ggf --&gt; ggff((f));
ggf --&gt; ggfg((g));
ggg --&gt; gggf((f));
ggg --&gt; gggg((g));
style gggg fill:lightgreen,stroke:#333,stroke-width:4px
</code></pre>
<p>不妨再考慮一個 <code>不幸運的情況</code>：<code>最優解</code> 如果是 <code>以g作為前綴</code>，但 <code>它的長度卻比較小</code>。</p>
<p>那麽我們也會做 <code>大部分沒有意義的搜索</code>，因為該 <code>算法</code>不管 <code>最優解的長度有多麽小</code>，都要按 <code>深度優先搜索</code>的方式，<code>不斷下降（使轉變函數序列的長度增長）</code>，不斷 <code>下降</code>和 <code>回溯</code> 尋求解。(如果在 <code>下降過程</code>沒有發現解，那麽就只能通過 <code>回溯</code>後接著 <code>下降</code>，再繼續尋找解)</p>
<h4>Iterative-Deepening DFS</h4>
<p>首先，我們解決一下 <code>這個不幸運的情況</code>：如果 <code>最優解</code>它足夠短，我們希望 <code>搜索算法</code>不要 <code>下降到我們設定的最大深度</code>，然後通過 <code>逐步回溯</code>來發現這個 <code>長度較短的最優解</code>。而是說，我們希望讓 <code>搜索算法</code>盡量找找看，有沒有 <code>長度較短的解</code>，如果 <code>長度較短的解</code> <code>的確找不到</code>，那麽我們再 <code>尋找長度較長的解</code></p>
<blockquote><p>實際上，根據這道題目的性質。我們也不應該采用 <code>深度優先搜索</code>。</p>
</blockquote>
<p>因此，我們可以使用 <code>叠代加深搜索 (Iterative-Deepening DFS)</code>：</p>
<ul>
<li>在 <code>深度為1的解空間樹</code>中進行 <code>搜索</code>，若找到 <code>解</code>則立即返回。</li>
<li>在 <code>深度為2的解空間樹</code>中進行 <code>搜索</code>，若找到 <code>解</code>則立即返回。</li>
<li><mjx-container class="MathJax" jax="SVG" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="2.652ex" height="0.271ex" role="img" focusable="false" viewBox="0 -310 1172 120" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: 0.43ex;"><defs><path id="MJX-38-TEX-N-22EF" d="M78 250Q78 274 95 292T138 310Q162 310 180 294T199 251Q199 226 182 208T139 190T96 207T78 250ZM525 250Q525 274 542 292T585 310Q609 310 627 294T646 251Q646 226 629 208T586 190T543 207T525 250ZM972 250Q972 274 989 292T1032 310Q1056 310 1074 294T1093 251Q1093 226 1076 208T1033 190T990 207T972 250Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mo"><use data-c="22EF" xlink:href="#MJX-38-TEX-N-22EF"></use></g></g></g></svg></mjx-container><script type="math/tex">\cdots</script></li>
<li>在 <code>深度為k的解空間樹</code> 中進行 <code>搜索</code>，若找到 <code>解</code>則立即返回。</li>
<li>在 <code>深度為k以內的解空間樹</code>中 <code>無解</code>！</li>

</ul>
<pre><code class="language-mermaid" lang="mermaid">graph TD;
root((root)) --&gt; f((f));
style f fill:lightpink,stroke:#333,stroke-width:4px
root((root)) --&gt; g((g));
f --&gt; ff((f));
style ff fill:lightgray,stroke:#333,stroke-width:4px
f --&gt; fg((g));
style fg fill:lightgray,stroke:#333,stroke-width:4px
g --&gt; gf((f));
style gf fill:lightgray,stroke:#333,stroke-width:4px
g --&gt; gg((g));
style gg fill:lightgray,stroke:#333,stroke-width:4px
ff --&gt; fff((f));
style fff fill:lightgray,stroke:#333,stroke-width:4px
ff --&gt; ffg((g));
style ffg fill:lightgray,stroke:#333,stroke-width:4px
fg --&gt; fgf((f));
style fgf fill:lightgray,stroke:#333,stroke-width:4px
fg --&gt; fgg((g));
style fgg fill:lightgray,stroke:#333,stroke-width:4px
gf --&gt; gff((f));
style gff fill:lightgray,stroke:#333,stroke-width:4px
gf --&gt; gfg((g));
style gfg fill:lightgray,stroke:#333,stroke-width:4px
gg --&gt; ggf((f));
style ggf fill:lightgray,stroke:#333,stroke-width:4px
gg --&gt; ggg((g));
style ggg fill:lightgray,stroke:#333,stroke-width:4px
fff --&gt; ffff((f));
style ffff fill:lightgray,stroke:#333,stroke-width:4px
fff --&gt; fffg((g));
style fffg fill:lightgray,stroke:#333,stroke-width:4px
ffg --&gt; ffgf((f));
style ffgf fill:lightgray,stroke:#333,stroke-width:4px
ffg --&gt; ffgg((g));
style ffgg fill:lightgray,stroke:#333,stroke-width:4px
fgf --&gt; fgff((f));
style fgff fill:lightgray,stroke:#333,stroke-width:4px
fgf --&gt; fgfg((g));
style fgfg fill:lightgray,stroke:#333,stroke-width:4px
fgg --&gt; fggf((f));
style fggf fill:lightgray,stroke:#333,stroke-width:4px
fgg --&gt; fggg((g));
style fggg fill:lightgray,stroke:#333,stroke-width:4px
gff --&gt; gfff((f));
style gfff fill:lightgray,stroke:#333,stroke-width:4px
gff --&gt; gffg((g));
style gffg fill:lightgray,stroke:#333,stroke-width:4px
gfg --&gt; gfgf((f));
style gfgf fill:lightgray,stroke:#333,stroke-width:4px
gfg --&gt; gfgg((g));
style gfgg fill:lightgray,stroke:#333,stroke-width:4px
ggf --&gt; ggff((f));
style ggff fill:lightgray,stroke:#333,stroke-width:4px
ggf --&gt; ggfg((g));
style ggfg fill:lightgray,stroke:#333,stroke-width:4px
ggg --&gt; gggf((f));
style gggf fill:lightgray,stroke:#333,stroke-width:4px
ggg --&gt; gggg((g));
style gggg fill:lightgray,stroke:#333,stroke-width:4px

</code></pre>
<pre><code class="language-mermaid" lang="mermaid">graph TD;
root((root)) --&gt; f((f));
root((root)) --&gt; g((g));
style g fill:lightpink,stroke:#333,stroke-width:4px
f --&gt; ff((f));
style ff fill:lightgray,stroke:#333,stroke-width:4px
f --&gt; fg((g));
style fg fill:lightgray,stroke:#333,stroke-width:4px
g --&gt; gf((f));
style gf fill:lightgray,stroke:#333,stroke-width:4px
g --&gt; gg((g));
style gg fill:lightgray,stroke:#333,stroke-width:4px
ff --&gt; fff((f));
style fff fill:lightgray,stroke:#333,stroke-width:4px
ff --&gt; ffg((g));
style ffg fill:lightgray,stroke:#333,stroke-width:4px
fg --&gt; fgf((f));
style fgf fill:lightgray,stroke:#333,stroke-width:4px
fg --&gt; fgg((g));
style fgg fill:lightgray,stroke:#333,stroke-width:4px
gf --&gt; gff((f));
style gff fill:lightgray,stroke:#333,stroke-width:4px
gf --&gt; gfg((g));
style gfg fill:lightgray,stroke:#333,stroke-width:4px
gg --&gt; ggf((f));
style ggf fill:lightgray,stroke:#333,stroke-width:4px
gg --&gt; ggg((g));
style ggg fill:lightgray,stroke:#333,stroke-width:4px
fff --&gt; ffff((f));
style ffff fill:lightgray,stroke:#333,stroke-width:4px
fff --&gt; fffg((g));
style fffg fill:lightgray,stroke:#333,stroke-width:4px
ffg --&gt; ffgf((f));
style ffgf fill:lightgray,stroke:#333,stroke-width:4px
ffg --&gt; ffgg((g));
style ffgg fill:lightgray,stroke:#333,stroke-width:4px
fgf --&gt; fgff((f));
style fgff fill:lightgray,stroke:#333,stroke-width:4px
fgf --&gt; fgfg((g));
style fgfg fill:lightgray,stroke:#333,stroke-width:4px
fgg --&gt; fggf((f));
style fggf fill:lightgray,stroke:#333,stroke-width:4px
fgg --&gt; fggg((g));
style fggg fill:lightgray,stroke:#333,stroke-width:4px
gff --&gt; gfff((f));
style gfff fill:lightgray,stroke:#333,stroke-width:4px
gff --&gt; gffg((g));
style gffg fill:lightgray,stroke:#333,stroke-width:4px
gfg --&gt; gfgf((f));
style gfgf fill:lightgray,stroke:#333,stroke-width:4px
gfg --&gt; gfgg((g));
style gfgg fill:lightgray,stroke:#333,stroke-width:4px
ggf --&gt; ggff((f));
style ggff fill:lightgray,stroke:#333,stroke-width:4px
ggf --&gt; ggfg((g));
style ggfg fill:lightgray,stroke:#333,stroke-width:4px
ggg --&gt; gggf((f));
style gggf fill:lightgray,stroke:#333,stroke-width:4px
ggg --&gt; gggg((g));
style gggg fill:lightgray,stroke:#333,stroke-width:4px

</code></pre>
<pre><code class="language-mermaid" lang="mermaid">graph TD;
root((root)) --&gt; f((f));
style f fill:lightpink,stroke:#333,stroke-width:4px
root((root)) --&gt; g((g));
f --&gt; ff((f));
style ff fill:lightpink,stroke:#333,stroke-width:4px
f --&gt; fg((g));
g --&gt; gf((f));
g --&gt; gg((g));
ff --&gt; fff((f));
style fff fill:lightgray,stroke:#333,stroke-width:4px
ff --&gt; ffg((g));
style ffg fill:lightgray,stroke:#333,stroke-width:4px
fg --&gt; fgf((f));
style fgf fill:lightgray,stroke:#333,stroke-width:4px
fg --&gt; fgg((g));
style fgg fill:lightgray,stroke:#333,stroke-width:4px
gf --&gt; gff((f));
style gff fill:lightgray,stroke:#333,stroke-width:4px
gf --&gt; gfg((g));
style gfg fill:lightgray,stroke:#333,stroke-width:4px
gg --&gt; ggf((f));
style ggf fill:lightgray,stroke:#333,stroke-width:4px
gg --&gt; ggg((g));
style ggg fill:lightgray,stroke:#333,stroke-width:4px
fff --&gt; ffff((f));
style ffff fill:lightgray,stroke:#333,stroke-width:4px
fff --&gt; fffg((g));
style fffg fill:lightgray,stroke:#333,stroke-width:4px
ffg --&gt; ffgf((f));
style ffgf fill:lightgray,stroke:#333,stroke-width:4px
ffg --&gt; ffgg((g));
style ffgg fill:lightgray,stroke:#333,stroke-width:4px
fgf --&gt; fgff((f));
style fgff fill:lightgray,stroke:#333,stroke-width:4px
fgf --&gt; fgfg((g));
style fgfg fill:lightgray,stroke:#333,stroke-width:4px
fgg --&gt; fggf((f));
style fggf fill:lightgray,stroke:#333,stroke-width:4px
fgg --&gt; fggg((g));
style fggg fill:lightgray,stroke:#333,stroke-width:4px
gff --&gt; gfff((f));
style gfff fill:lightgray,stroke:#333,stroke-width:4px
gff --&gt; gffg((g));
style gffg fill:lightgray,stroke:#333,stroke-width:4px
gfg --&gt; gfgf((f));
style gfgf fill:lightgray,stroke:#333,stroke-width:4px
gfg --&gt; gfgg((g));
style gfgg fill:lightgray,stroke:#333,stroke-width:4px
ggf --&gt; ggff((f));
style ggff fill:lightgray,stroke:#333,stroke-width:4px
ggf --&gt; ggfg((g));
style ggfg fill:lightgray,stroke:#333,stroke-width:4px
ggg --&gt; gggf((f));
style gggf fill:lightgray,stroke:#333,stroke-width:4px
ggg --&gt; gggg((g));
style gggg fill:lightgray,stroke:#333,stroke-width:4px

</code></pre>
<pre><code class="language-mermaid" lang="mermaid">graph TD;
root((root)) --&gt; f((f));
style f fill:lightpink,stroke:#333,stroke-width:4px
root((root)) --&gt; g((g));
f --&gt; ff((f));
f --&gt; fg((g));
style fg fill:lightpink,stroke:#333,stroke-width:4px
g --&gt; gf((f));
g --&gt; gg((g));
ff --&gt; fff((f));
style fff fill:lightgray,stroke:#333,stroke-width:4px
ff --&gt; ffg((g));
style ffg fill:lightgray,stroke:#333,stroke-width:4px
fg --&gt; fgf((f));
style fgf fill:lightgray,stroke:#333,stroke-width:4px
fg --&gt; fgg((g));
style fgg fill:lightgray,stroke:#333,stroke-width:4px
gf --&gt; gff((f));
style gff fill:lightgray,stroke:#333,stroke-width:4px
gf --&gt; gfg((g));
style gfg fill:lightgray,stroke:#333,stroke-width:4px
gg --&gt; ggf((f));
style ggf fill:lightgray,stroke:#333,stroke-width:4px
gg --&gt; ggg((g));
style ggg fill:lightgray,stroke:#333,stroke-width:4px
fff --&gt; ffff((f));
style ffff fill:lightgray,stroke:#333,stroke-width:4px
fff --&gt; fffg((g));
style fffg fill:lightgray,stroke:#333,stroke-width:4px
ffg --&gt; ffgf((f));
style ffgf fill:lightgray,stroke:#333,stroke-width:4px
ffg --&gt; ffgg((g));
style ffgg fill:lightgray,stroke:#333,stroke-width:4px
fgf --&gt; fgff((f));
style fgff fill:lightgray,stroke:#333,stroke-width:4px
fgf --&gt; fgfg((g));
style fgfg fill:lightgray,stroke:#333,stroke-width:4px
fgg --&gt; fggf((f));
style fggf fill:lightgray,stroke:#333,stroke-width:4px
fgg --&gt; fggg((g));
style fggg fill:lightgray,stroke:#333,stroke-width:4px
gff --&gt; gfff((f));
style gfff fill:lightgray,stroke:#333,stroke-width:4px
gff --&gt; gffg((g));
style gffg fill:lightgray,stroke:#333,stroke-width:4px
gfg --&gt; gfgf((f));
style gfgf fill:lightgray,stroke:#333,stroke-width:4px
gfg --&gt; gfgg((g));
style gfgg fill:lightgray,stroke:#333,stroke-width:4px
ggf --&gt; ggff((f));
style ggff fill:lightgray,stroke:#333,stroke-width:4px
ggf --&gt; ggfg((g));
style ggfg fill:lightgray,stroke:#333,stroke-width:4px
ggg --&gt; gggf((f));
style gggf fill:lightgray,stroke:#333,stroke-width:4px
ggg --&gt; gggg((g));
style gggg fill:lightgray,stroke:#333,stroke-width:4px

</code></pre>
<p><mjx-container class="MathJax" jax="SVG" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="2.652ex" height="0.271ex" role="img" focusable="false" viewBox="0 -310 1172 120" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: 0.43ex;"><defs><path id="MJX-38-TEX-N-22EF" d="M78 250Q78 274 95 292T138 310Q162 310 180 294T199 251Q199 226 182 208T139 190T96 207T78 250ZM525 250Q525 274 542 292T585 310Q609 310 627 294T646 251Q646 226 629 208T586 190T543 207T525 250ZM972 250Q972 274 989 292T1032 310Q1056 310 1074 294T1093 251Q1093 226 1076 208T1033 190T990 207T972 250Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mo"><use data-c="22EF" xlink:href="#MJX-38-TEX-N-22EF"></use></g></g></g></svg></mjx-container><script type="math/tex">\cdots</script></p>
<blockquote><p>註意兩點：</p>
<ul>
<li><p>我們可以 <code>立即返回</code>是因為：根據 <code>題目性質</code>，要求求解 <code>最短/最小的解</code></p>
</li>
<li><p>算法最終 <code>報告無解</code>並不一定表示 <code>原問題無解</code>：這取決於 <code>我們設定的最大遞歸深度</code><mjx-container class="MathJax" jax="SVG" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="1.179ex" height="1.595ex" role="img" focusable="false" viewBox="0 -694 521 705" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -0.025ex;"><defs><path id="MJX-26-TEX-I-1D458" d="M121 647Q121 657 125 670T137 683Q138 683 209 688T282 694Q294 694 294 686Q294 679 244 477Q194 279 194 272Q213 282 223 291Q247 309 292 354T362 415Q402 442 438 442Q468 442 485 423T503 369Q503 344 496 327T477 302T456 291T438 288Q418 288 406 299T394 328Q394 353 410 369T442 390L458 393Q446 405 434 405H430Q398 402 367 380T294 316T228 255Q230 254 243 252T267 246T293 238T320 224T342 206T359 180T365 147Q365 130 360 106T354 66Q354 26 381 26Q429 26 459 145Q461 153 479 153H483Q499 153 499 144Q499 139 496 130Q455 -11 378 -11Q333 -11 305 15T277 90Q277 108 280 121T283 145Q283 167 269 183T234 206T200 217T182 220H180Q168 178 159 139T145 81T136 44T129 20T122 7T111 -2Q98 -11 83 -11Q66 -11 57 -1T48 16Q48 26 85 176T158 471L195 616Q196 629 188 632T149 637H144Q134 637 131 637T124 640T121 647Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mi"><use data-c="1D458" xlink:href="#MJX-26-TEX-I-1D458"></use></g></g></g></svg></mjx-container><script type="math/tex">k</script> </p>
<blockquote><p>最大深度<mjx-container class="MathJax" jax="SVG" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="1.179ex" height="1.595ex" role="img" focusable="false" viewBox="0 -694 521 705" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -0.025ex;"><defs><path id="MJX-26-TEX-I-1D458" d="M121 647Q121 657 125 670T137 683Q138 683 209 688T282 694Q294 694 294 686Q294 679 244 477Q194 279 194 272Q213 282 223 291Q247 309 292 354T362 415Q402 442 438 442Q468 442 485 423T503 369Q503 344 496 327T477 302T456 291T438 288Q418 288 406 299T394 328Q394 353 410 369T442 390L458 393Q446 405 434 405H430Q398 402 367 380T294 316T228 255Q230 254 243 252T267 246T293 238T320 224T342 206T359 180T365 147Q365 130 360 106T354 66Q354 26 381 26Q429 26 459 145Q461 153 479 153H483Q499 153 499 144Q499 139 496 130Q455 -11 378 -11Q333 -11 305 15T277 90Q277 108 280 121T283 145Q283 167 269 183T234 206T200 217T182 220H180Q168 178 159 139T145 81T136 44T129 20T122 7T111 -2Q98 -11 83 -11Q66 -11 57 -1T48 16Q48 26 85 176T158 471L195 616Q196 629 188 632T149 637H144Q134 637 131 637T124 640T121 647Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mi"><use data-c="1D458" xlink:href="#MJX-26-TEX-I-1D458"></use></g></g></g></svg></mjx-container><script type="math/tex">k</script>的設定需要我們根據題目分析得到，它可以是 <code>靜態的</code>，也可以是 <code>動態的</code>。</p>
<p>它可以是 <code>不確切的上界</code>，但至少我們希望 <code>要保證k足夠大，使得不會遺漏解</code></p>
</blockquote>
</li>

</ul>
</blockquote>
<p>於是，我們需要做下面這些工作：</p>
<ul>
<li><p>定義 <code>遞歸次數的上界估計函數 (價值函數)</code><mjx-container class="MathJax" jax="SVG" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="28.436ex" height="2.262ex" role="img" focusable="false" viewBox="0 -750 12568.8 1000" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -0.566ex;"><defs><path id="MJX-27-TEX-N-27F9" d="M1218 514Q1218 525 1234 525Q1239 525 1242 525T1247 525T1251 524T1253 523T1255 520T1257 517T1260 512Q1297 438 1358 381T1469 300T1565 263Q1582 258 1582 250T1573 239T1536 228T1478 204Q1334 134 1260 -12Q1256 -21 1253 -22T1238 -24Q1218 -24 1218 -17Q1218 -13 1223 0Q1258 69 1309 123L1319 133H70Q56 140 56 153Q56 168 72 173H1363L1373 181Q1412 211 1490 250Q1489 251 1472 259T1427 283T1373 319L1363 327H710L707 328L390 327H72Q56 332 56 347Q56 360 70 367H1319L1309 377Q1276 412 1247 458T1218 514Z"></path><path id="MJX-27-TEX-N-65" d="M28 218Q28 273 48 318T98 391T163 433T229 448Q282 448 320 430T378 380T406 316T415 245Q415 238 408 231H126V216Q126 68 226 36Q246 30 270 30Q312 30 342 62Q359 79 369 104L379 128Q382 131 395 131H398Q415 131 415 121Q415 117 412 108Q393 53 349 21T250 -11Q155 -11 92 58T28 218ZM333 275Q322 403 238 411H236Q228 411 220 410T195 402T166 381T143 340T127 274V267H333V275Z"></path><path id="MJX-27-TEX-N-73" d="M295 316Q295 356 268 385T190 414Q154 414 128 401Q98 382 98 349Q97 344 98 336T114 312T157 287Q175 282 201 278T245 269T277 256Q294 248 310 236T342 195T359 133Q359 71 321 31T198 -10H190Q138 -10 94 26L86 19L77 10Q71 4 65 -1L54 -11H46H42Q39 -11 33 -5V74V132Q33 153 35 157T45 162H54Q66 162 70 158T75 146T82 119T101 77Q136 26 198 26Q295 26 295 104Q295 133 277 151Q257 175 194 187T111 210Q75 227 54 256T33 318Q33 357 50 384T93 424T143 442T187 447H198Q238 447 268 432L283 424L292 431Q302 440 314 448H322H326Q329 448 335 442V310L329 304H301Q295 310 295 316Z"></path><path id="MJX-27-TEX-N-74" d="M27 422Q80 426 109 478T141 600V615H181V431H316V385H181V241Q182 116 182 100T189 68Q203 29 238 29Q282 29 292 100Q293 108 293 146V181H333V146V134Q333 57 291 17Q264 -10 221 -10Q187 -10 162 2T124 33T105 68T98 100Q97 107 97 248V385H18V422H27Z"></path><path id="MJX-27-TEX-N-69" d="M69 609Q69 637 87 653T131 669Q154 667 171 652T188 609Q188 579 171 564T129 549Q104 549 87 564T69 609ZM247 0Q232 3 143 3Q132 3 106 3T56 1L34 0H26V46H42Q70 46 91 49Q100 53 102 60T104 102V205V293Q104 345 102 359T88 378Q74 385 41 385H30V408Q30 431 32 431L42 432Q52 433 70 434T106 436Q123 437 142 438T171 441T182 442H185V62Q190 52 197 50T232 46H255V0H247Z"></path><path id="MJX-27-TEX-N-6D" d="M41 46H55Q94 46 102 60V68Q102 77 102 91T102 122T103 161T103 203Q103 234 103 269T102 328V351Q99 370 88 376T43 385H25V408Q25 431 27 431L37 432Q47 433 65 434T102 436Q119 437 138 438T167 441T178 442H181V402Q181 364 182 364T187 369T199 384T218 402T247 421T285 437Q305 442 336 442Q351 442 364 440T387 434T406 426T421 417T432 406T441 395T448 384T452 374T455 366L457 361L460 365Q463 369 466 373T475 384T488 397T503 410T523 422T546 432T572 439T603 442Q729 442 740 329Q741 322 741 190V104Q741 66 743 59T754 49Q775 46 803 46H819V0H811L788 1Q764 2 737 2T699 3Q596 3 587 0H579V46H595Q656 46 656 62Q657 64 657 200Q656 335 655 343Q649 371 635 385T611 402T585 404Q540 404 506 370Q479 343 472 315T464 232V168V108Q464 78 465 68T468 55T477 49Q498 46 526 46H542V0H534L510 1Q487 2 460 2T422 3Q319 3 310 0H302V46H318Q379 46 379 62Q380 64 380 200Q379 335 378 343Q372 371 358 385T334 402T308 404Q263 404 229 370Q202 343 195 315T187 232V168V108Q187 78 188 68T191 55T200 49Q221 46 249 46H265V0H257L234 1Q210 2 183 2T145 3Q42 3 33 0H25V46H41Z"></path><path id="MJX-27-TEX-N-61" d="M137 305T115 305T78 320T63 359Q63 394 97 421T218 448Q291 448 336 416T396 340Q401 326 401 309T402 194V124Q402 76 407 58T428 40Q443 40 448 56T453 109V145H493V106Q492 66 490 59Q481 29 455 12T400 -6T353 12T329 54V58L327 55Q325 52 322 49T314 40T302 29T287 17T269 6T247 -2T221 -8T190 -11Q130 -11 82 20T34 107Q34 128 41 147T68 188T116 225T194 253T304 268H318V290Q318 324 312 340Q290 411 215 411Q197 411 181 410T156 406T148 403Q170 388 170 359Q170 334 154 320ZM126 106Q126 75 150 51T209 26Q247 26 276 49T315 109Q317 116 318 175Q318 233 317 233Q309 233 296 232T251 223T193 203T147 166T126 106Z"></path><path id="MJX-27-TEX-N-28" d="M94 250Q94 319 104 381T127 488T164 576T202 643T244 695T277 729T302 750H315H319Q333 750 333 741Q333 738 316 720T275 667T226 581T184 443T167 250T184 58T225 -81T274 -167T316 -220T333 -241Q333 -250 318 -250H315H302L274 -226Q180 -141 137 -14T94 250Z"></path><path id="MJX-27-TEX-N-72" d="M36 46H50Q89 46 97 60V68Q97 77 97 91T98 122T98 161T98 203Q98 234 98 269T98 328L97 351Q94 370 83 376T38 385H20V408Q20 431 22 431L32 432Q42 433 60 434T96 436Q112 437 131 438T160 441T171 442H174V373Q213 441 271 441H277Q322 441 343 419T364 373Q364 352 351 337T313 322Q288 322 276 338T263 372Q263 381 265 388T270 400T273 405Q271 407 250 401Q234 393 226 386Q179 341 179 207V154Q179 141 179 127T179 101T180 81T180 66V61Q181 59 183 57T188 54T193 51T200 49T207 48T216 47T225 47T235 46T245 46H276V0H267Q249 3 140 3Q37 3 28 0H20V46H36Z"></path><path id="MJX-27-TEX-N-67" d="M329 409Q373 453 429 453Q459 453 472 434T485 396Q485 382 476 371T449 360Q416 360 412 390Q410 404 415 411Q415 412 416 414V415Q388 412 363 393Q355 388 355 386Q355 385 359 381T368 369T379 351T388 325T392 292Q392 230 343 187T222 143Q172 143 123 171Q112 153 112 133Q112 98 138 81Q147 75 155 75T227 73Q311 72 335 67Q396 58 431 26Q470 -13 470 -72Q470 -139 392 -175Q332 -206 250 -206Q167 -206 107 -175Q29 -140 29 -75Q29 -39 50 -15T92 18L103 24Q67 55 67 108Q67 155 96 193Q52 237 52 292Q52 355 102 398T223 442Q274 442 318 416L329 409ZM299 343Q294 371 273 387T221 404Q192 404 171 388T145 343Q142 326 142 292Q142 248 149 227T179 192Q196 182 222 182Q244 182 260 189T283 207T294 227T299 242Q302 258 302 292T299 343ZM403 -75Q403 -50 389 -34T348 -11T299 -2T245 0H218Q151 0 138 -6Q118 -15 107 -34T95 -74Q95 -84 101 -97T122 -127T170 -155T250 -167Q319 -167 361 -139T403 -75Z"></path><path id="MJX-27-TEX-N-29" d="M60 749L64 750Q69 750 74 750H86L114 726Q208 641 251 514T294 250Q294 182 284 119T261 12T224 -76T186 -143T145 -194T113 -227T90 -246Q87 -249 86 -250H74Q66 -250 63 -250T58 -247T55 -238Q56 -237 66 -225Q221 -64 221 250T66 725Q56 737 55 738Q55 746 60 749Z"></path><path id="MJX-27-TEX-N-20" d=""></path><path id="MJX-27-TEX-N-2D" d="M11 179V252H277V179H11Z"></path><path id="MJX-27-TEX-N-3E" d="M84 520Q84 528 88 533T96 539L99 540Q106 540 253 471T544 334L687 265Q694 260 694 250T687 235Q685 233 395 96L107 -40H101Q83 -38 83 -20Q83 -19 83 -17Q82 -10 98 -1Q117 9 248 71Q326 108 378 132L626 250L378 368Q90 504 86 509Q84 513 84 520Z"></path><path id="MJX-27-TEX-N-6E" d="M41 46H55Q94 46 102 60V68Q102 77 102 91T102 122T103 161T103 203Q103 234 103 269T102 328V351Q99 370 88 376T43 385H25V408Q25 431 27 431L37 432Q47 433 65 434T102 436Q119 437 138 438T167 441T178 442H181V402Q181 364 182 364T187 369T199 384T218 402T247 421T285 437Q305 442 336 442Q450 438 463 329Q464 322 464 190V104Q464 66 466 59T477 49Q498 46 526 46H542V0H534L510 1Q487 2 460 2T422 3Q319 3 310 0H302V46H318Q379 46 379 62Q380 64 380 200Q379 335 378 343Q372 371 358 385T334 402T308 404Q263 404 229 370Q202 343 195 315T187 232V168V108Q187 78 188 68T191 55T200 49Q221 46 249 46H265V0H257L234 1Q210 2 183 2T145 3Q42 3 33 0H25V46H41Z"></path><path id="MJX-27-TEX-N-6B" d="M36 46H50Q89 46 97 60V68Q97 77 97 91T97 124T98 167T98 217T98 272T98 329Q98 366 98 407T98 482T98 542T97 586T97 603Q94 622 83 628T38 637H20V660Q20 683 22 683L32 684Q42 685 61 686T98 688Q115 689 135 690T165 693T176 694H179V463L180 233L240 287Q300 341 304 347Q310 356 310 364Q310 383 289 385H284V431H293Q308 428 412 428Q475 428 484 431H489V385H476Q407 380 360 341Q286 278 286 274Q286 273 349 181T420 79Q434 60 451 53T500 46H511V0H505Q496 3 418 3Q322 3 307 0H299V46H306Q330 48 330 65Q330 72 326 79Q323 84 276 153T228 222L176 176V120V84Q176 65 178 59T189 49Q210 46 238 46H254V0H246Q231 3 137 3T28 0H20V46H36Z"></path><path id="MJX-27-TEX-N-A0" d=""></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mstyle"><g data-mml-node="mspace"></g></g><g data-mml-node="mo" transform="translate(278,0)"><use data-c="27F9" xlink:href="#MJX-27-TEX-N-27F9"></use></g><g data-mml-node="mstyle" transform="translate(1916,0)"><g data-mml-node="mspace"></g></g><g data-mml-node="mtext" transform="translate(2471.8,0)"><use data-c="65" xlink:href="#MJX-27-TEX-N-65"></use><use data-c="73" xlink:href="#MJX-27-TEX-N-73" transform="translate(444,0)"></use><use data-c="74" xlink:href="#MJX-27-TEX-N-74" transform="translate(838,0)"></use><use data-c="69" xlink:href="#MJX-27-TEX-N-69" transform="translate(1227,0)"></use><use data-c="6D" xlink:href="#MJX-27-TEX-N-6D" transform="translate(1505,0)"></use><use data-c="61" xlink:href="#MJX-27-TEX-N-61" transform="translate(2338,0)"></use><use data-c="74" xlink:href="#MJX-27-TEX-N-74" transform="translate(2838,0)"></use><use data-c="65" xlink:href="#MJX-27-TEX-N-65" transform="translate(3227,0)"></use><use data-c="28" xlink:href="#MJX-27-TEX-N-28" transform="translate(3671,0)"></use><use data-c="61" xlink:href="#MJX-27-TEX-N-61" transform="translate(4060,0)"></use><use data-c="72" xlink:href="#MJX-27-TEX-N-72" transform="translate(4560,0)"></use><use data-c="67" xlink:href="#MJX-27-TEX-N-67" transform="translate(4952,0)"></use><use data-c="73" xlink:href="#MJX-27-TEX-N-73" transform="translate(5452,0)"></use><use data-c="29" xlink:href="#MJX-27-TEX-N-29" transform="translate(5846,0)"></use><use data-c="20" xlink:href="#MJX-27-TEX-N-20" transform="translate(6235,0)"></use><use data-c="2D" xlink:href="#MJX-27-TEX-N-2D" transform="translate(6485,0)"></use><use data-c="3E" xlink:href="#MJX-27-TEX-N-3E" transform="translate(6818,0)"></use><use data-c="20" xlink:href="#MJX-27-TEX-N-20" transform="translate(7596,0)"></use><use data-c="69" xlink:href="#MJX-27-TEX-N-69" transform="translate(7846,0)"></use><use data-c="6E" xlink:href="#MJX-27-TEX-N-6E" transform="translate(8124,0)"></use><use data-c="74" xlink:href="#MJX-27-TEX-N-74" transform="translate(8680,0)"></use><use data-c="20" xlink:href="#MJX-27-TEX-N-20" transform="translate(9069,0)"></use><use data-c="6B" xlink:href="#MJX-27-TEX-N-6B" transform="translate(9319,0)"></use><use data-c="A0" xlink:href="#MJX-27-TEX-N-A0" transform="translate(9847,0)"></use></g></g></g></svg></mjx-container><script type="math/tex">\implies \text{estimate(args) -> int k } </script></p>
<blockquote><p>在 <code>DFS Method</code>中，我們並沒有定義這個 <code>上界估計函數</code>，</p>
<p>因為<del>我們偷偷看了輸入數據</del> 如果 <code>k的上界</code>非常大的話，對於 <code>DFS Method</code>方法是 <code>沒有意義的</code>，</p>
<p>因為根據 <code>DFS</code>和 <code>該問題的特性</code>，<code>所產生的DFS樹</code>會 <code>迅速膨脹</code>到 <code>我們無法在規定時間內求得解</code>，而這個 <code>非常大的k值</code>也 <code>根本不會被觸碰到</code></p>
</blockquote>
<blockquote><p>對於 <code>IDDFS</code>，我們可以根據 <code>題目性質</code> 設置 <code>合適的上界估計函數</code>。</p>
<blockquote><p>但要註意，如果 <code>最優解</code>的 <code>深度</code>確實很大，那麽 <code>IDDFS</code>也會面臨 <code>DFS樹</code> <code>迅速膨脹</code> 的 <code>困境</code></p>
<blockquote><p>不過，<code>IDDFS</code>對於 <code>最優解的深度較小的情況</code>是非常適合的。</p>
</blockquote>
</blockquote>
</blockquote>
</li>
<li><p>根據 <code>題目性質</code>為 <code>遞歸方法</code> 定義 <code>所需的全局變量</code></p>
<blockquote><p>我們當然可以使用 <code>遞歸方法所屬的方法棧的局部內存</code>來存儲 <code>所需要的變量</code></p>
<ul>
<li>但是，這往往會導致 <code>重復拷貝和傳遞相同的參數</code>和 <code>產生大量結構高度相似的冗余信息</code></li>

</ul>
<p>這不僅僅是 <code>空間</code>上的問題，還包括做這些工作所用的 <code>時間</code></p>
<blockquote><p>如果你使用的是 <code>C/C++</code>等提供 <code>指針/引用</code>的 <code>編程語言</code>，可能會有些 <code>奇怪的想法</code>。</p>
<p>但請重新考慮一下：<code>一個4字節的指針</code>並不會比 <code>一個4字節的整數</code>更節約空間。</p>
</blockquote>
<blockquote><p>一般來說，<code>每個遞歸方法的一個幀棧</code>如果 <code>只做一個選擇</code>，那麽我們實際上只需要 <code>保存所做的選擇</code>和 <code>當前深度</code>即可。</p>
<blockquote><p>比如說，要求 <code>每一個遞歸方法的函數調用幀棧</code> 進行 <code>選擇一個數字</code>，<code>選擇一個轉變函數</code>等等。</p>
</blockquote>
</blockquote>
<ul>
<li>使用 <code>遞歸函數的函數調用幀棧</code>但 <code>僅保存必要信息</code></li>

</ul>
<p>該方法可行，但 <code>回溯</code>時會稍微麻煩一些，仍然不如直接使用 <code>全局變量</code></p>
</blockquote>
</li>
<li><p>按k遞增方式執行k次 <code>DFS</code> <mjx-container class="MathJax" jax="SVG" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="28.68ex" height="2.262ex" role="img" focusable="false" viewBox="0 -750 12676.8 1000" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -0.566ex;"><defs><path id="MJX-28-TEX-N-27F9" d="M1218 514Q1218 525 1234 525Q1239 525 1242 525T1247 525T1251 524T1253 523T1255 520T1257 517T1260 512Q1297 438 1358 381T1469 300T1565 263Q1582 258 1582 250T1573 239T1536 228T1478 204Q1334 134 1260 -12Q1256 -21 1253 -22T1238 -24Q1218 -24 1218 -17Q1218 -13 1223 0Q1258 69 1309 123L1319 133H70Q56 140 56 153Q56 168 72 173H1363L1373 181Q1412 211 1490 250Q1489 251 1472 259T1427 283T1373 319L1363 327H710L707 328L390 327H72Q56 332 56 347Q56 360 70 367H1319L1309 377Q1276 412 1247 458T1218 514Z"></path><path id="MJX-28-TEX-N-73" d="M295 316Q295 356 268 385T190 414Q154 414 128 401Q98 382 98 349Q97 344 98 336T114 312T157 287Q175 282 201 278T245 269T277 256Q294 248 310 236T342 195T359 133Q359 71 321 31T198 -10H190Q138 -10 94 26L86 19L77 10Q71 4 65 -1L54 -11H46H42Q39 -11 33 -5V74V132Q33 153 35 157T45 162H54Q66 162 70 158T75 146T82 119T101 77Q136 26 198 26Q295 26 295 104Q295 133 277 151Q257 175 194 187T111 210Q75 227 54 256T33 318Q33 357 50 384T93 424T143 442T187 447H198Q238 447 268 432L283 424L292 431Q302 440 314 448H322H326Q329 448 335 442V310L329 304H301Q295 310 295 316Z"></path><path id="MJX-28-TEX-N-65" d="M28 218Q28 273 48 318T98 391T163 433T229 448Q282 448 320 430T378 380T406 316T415 245Q415 238 408 231H126V216Q126 68 226 36Q246 30 270 30Q312 30 342 62Q359 79 369 104L379 128Q382 131 395 131H398Q415 131 415 121Q415 117 412 108Q393 53 349 21T250 -11Q155 -11 92 58T28 218ZM333 275Q322 403 238 411H236Q228 411 220 410T195 402T166 381T143 340T127 274V267H333V275Z"></path><path id="MJX-28-TEX-N-61" d="M137 305T115 305T78 320T63 359Q63 394 97 421T218 448Q291 448 336 416T396 340Q401 326 401 309T402 194V124Q402 76 407 58T428 40Q443 40 448 56T453 109V145H493V106Q492 66 490 59Q481 29 455 12T400 -6T353 12T329 54V58L327 55Q325 52 322 49T314 40T302 29T287 17T269 6T247 -2T221 -8T190 -11Q130 -11 82 20T34 107Q34 128 41 147T68 188T116 225T194 253T304 268H318V290Q318 324 312 340Q290 411 215 411Q197 411 181 410T156 406T148 403Q170 388 170 359Q170 334 154 320ZM126 106Q126 75 150 51T209 26Q247 26 276 49T315 109Q317 116 318 175Q318 233 317 233Q309 233 296 232T251 223T193 203T147 166T126 106Z"></path><path id="MJX-28-TEX-N-72" d="M36 46H50Q89 46 97 60V68Q97 77 97 91T98 122T98 161T98 203Q98 234 98 269T98 328L97 351Q94 370 83 376T38 385H20V408Q20 431 22 431L32 432Q42 433 60 434T96 436Q112 437 131 438T160 441T171 442H174V373Q213 441 271 441H277Q322 441 343 419T364 373Q364 352 351 337T313 322Q288 322 276 338T263 372Q263 381 265 388T270 400T273 405Q271 407 250 401Q234 393 226 386Q179 341 179 207V154Q179 141 179 127T179 101T180 81T180 66V61Q181 59 183 57T188 54T193 51T200 49T207 48T216 47T225 47T235 46T245 46H276V0H267Q249 3 140 3Q37 3 28 0H20V46H36Z"></path><path id="MJX-28-TEX-N-63" d="M370 305T349 305T313 320T297 358Q297 381 312 396Q317 401 317 402T307 404Q281 408 258 408Q209 408 178 376Q131 329 131 219Q131 137 162 90Q203 29 272 29Q313 29 338 55T374 117Q376 125 379 127T395 129H409Q415 123 415 120Q415 116 411 104T395 71T366 33T318 2T249 -11Q163 -11 99 53T34 214Q34 318 99 383T250 448T370 421T404 357Q404 334 387 320Z"></path><path id="MJX-28-TEX-N-68" d="M41 46H55Q94 46 102 60V68Q102 77 102 91T102 124T102 167T103 217T103 272T103 329Q103 366 103 407T103 482T102 542T102 586T102 603Q99 622 88 628T43 637H25V660Q25 683 27 683L37 684Q47 685 66 686T103 688Q120 689 140 690T170 693T181 694H184V367Q244 442 328 442Q451 442 463 329Q464 322 464 190V104Q464 66 466 59T477 49Q498 46 526 46H542V0H534L510 1Q487 2 460 2T422 3Q319 3 310 0H302V46H318Q379 46 379 62Q380 64 380 200Q379 335 378 343Q372 371 358 385T334 402T308 404Q263 404 229 370Q202 343 195 315T187 232V168V108Q187 78 188 68T191 55T200 49Q221 46 249 46H265V0H257L234 1Q210 2 183 2T145 3Q42 3 33 0H25V46H41Z"></path><path id="MJX-28-TEX-N-28" d="M94 250Q94 319 104 381T127 488T164 576T202 643T244 695T277 729T302 750H315H319Q333 750 333 741Q333 738 316 720T275 667T226 581T184 443T167 250T184 58T225 -81T274 -167T316 -220T333 -241Q333 -250 318 -250H315H302L274 -226Q180 -141 137 -14T94 250Z"></path><path id="MJX-28-TEX-N-6B" d="M36 46H50Q89 46 97 60V68Q97 77 97 91T97 124T98 167T98 217T98 272T98 329Q98 366 98 407T98 482T98 542T97 586T97 603Q94 622 83 628T38 637H20V660Q20 683 22 683L32 684Q42 685 61 686T98 688Q115 689 135 690T165 693T176 694H179V463L180 233L240 287Q300 341 304 347Q310 356 310 364Q310 383 289 385H284V431H293Q308 428 412 428Q475 428 484 431H489V385H476Q407 380 360 341Q286 278 286 274Q286 273 349 181T420 79Q434 60 451 53T500 46H511V0H505Q496 3 418 3Q322 3 307 0H299V46H306Q330 48 330 65Q330 72 326 79Q323 84 276 153T228 222L176 176V120V84Q176 65 178 59T189 49Q210 46 238 46H254V0H246Q231 3 137 3T28 0H20V46H36Z"></path><path id="MJX-28-TEX-N-29" d="M60 749L64 750Q69 750 74 750H86L114 726Q208 641 251 514T294 250Q294 182 284 119T261 12T224 -76T186 -143T145 -194T113 -227T90 -246Q87 -249 86 -250H74Q66 -250 63 -250T58 -247T55 -238Q56 -237 66 -225Q221 -64 221 250T66 725Q56 737 55 738Q55 746 60 749Z"></path><path id="MJX-28-TEX-N-20" d=""></path><path id="MJX-28-TEX-N-2D" d="M11 179V252H277V179H11Z"></path><path id="MJX-28-TEX-N-3E" d="M84 520Q84 528 88 533T96 539L99 540Q106 540 253 471T544 334L687 265Q694 260 694 250T687 235Q685 233 395 96L107 -40H101Q83 -38 83 -20Q83 -19 83 -17Q82 -10 98 -1Q117 9 248 71Q326 108 378 132L626 250L378 368Q90 504 86 509Q84 513 84 520Z"></path><path id="MJX-28-TEX-N-62" d="M307 -11Q234 -11 168 55L158 37Q156 34 153 28T147 17T143 10L138 1L118 0H98V298Q98 599 97 603Q94 622 83 628T38 637H20V660Q20 683 22 683L32 684Q42 685 61 686T98 688Q115 689 135 690T165 693T176 694H179V543Q179 391 180 391L183 394Q186 397 192 401T207 411T228 421T254 431T286 439T323 442Q401 442 461 379T522 216Q522 115 458 52T307 -11ZM182 98Q182 97 187 90T196 79T206 67T218 55T233 44T250 35T271 29T295 26Q330 26 363 46T412 113Q424 148 424 212Q424 287 412 323Q385 405 300 405Q270 405 239 390T188 347L182 339V98Z"></path><path id="MJX-28-TEX-N-6F" d="M28 214Q28 309 93 378T250 448Q340 448 405 380T471 215Q471 120 407 55T250 -10Q153 -10 91 57T28 214ZM250 30Q372 30 372 193V225V250Q372 272 371 288T364 326T348 362T317 390T268 410Q263 411 252 411Q222 411 195 399Q152 377 139 338T126 246V226Q126 130 145 91Q177 30 250 30Z"></path><path id="MJX-28-TEX-N-6C" d="M42 46H56Q95 46 103 60V68Q103 77 103 91T103 124T104 167T104 217T104 272T104 329Q104 366 104 407T104 482T104 542T103 586T103 603Q100 622 89 628T44 637H26V660Q26 683 28 683L38 684Q48 685 67 686T104 688Q121 689 141 690T171 693T182 694H185V379Q185 62 186 60Q190 52 198 49Q219 46 247 46H263V0H255L232 1Q209 2 183 2T145 3T107 3T57 1L34 0H26V46H42Z"></path><path id="MJX-28-TEX-N-66" d="M273 0Q255 3 146 3Q43 3 34 0H26V46H42Q70 46 91 49Q99 52 103 60Q104 62 104 224V385H33V431H104V497L105 564L107 574Q126 639 171 668T266 704Q267 704 275 704T289 705Q330 702 351 679T372 627Q372 604 358 590T321 576T284 590T270 627Q270 647 288 667H284Q280 668 273 668Q245 668 223 647T189 592Q183 572 182 497V431H293V385H185V225Q185 63 186 61T189 57T194 54T199 51T206 49T213 48T222 47T231 47T241 46T251 46H282V0H273Z"></path><path id="MJX-28-TEX-N-75" d="M383 58Q327 -10 256 -10H249Q124 -10 105 89Q104 96 103 226Q102 335 102 348T96 369Q86 385 36 385H25V408Q25 431 27 431L38 432Q48 433 67 434T105 436Q122 437 142 438T172 441T184 442H187V261Q188 77 190 64Q193 49 204 40Q224 26 264 26Q290 26 311 35T343 58T363 90T375 120T379 144Q379 145 379 161T380 201T380 248V315Q380 361 370 372T320 385H302V431Q304 431 378 436T457 442H464V264Q464 84 465 81Q468 61 479 55T524 46H542V0Q540 0 467 -5T390 -11H383V58Z"></path><path id="MJX-28-TEX-N-6E" d="M41 46H55Q94 46 102 60V68Q102 77 102 91T102 122T103 161T103 203Q103 234 103 269T102 328V351Q99 370 88 376T43 385H25V408Q25 431 27 431L37 432Q47 433 65 434T102 436Q119 437 138 438T167 441T178 442H181V402Q181 364 182 364T187 369T199 384T218 402T247 421T285 437Q305 442 336 442Q450 438 463 329Q464 322 464 190V104Q464 66 466 59T477 49Q498 46 526 46H542V0H534L510 1Q487 2 460 2T422 3Q319 3 310 0H302V46H318Q379 46 379 62Q380 64 380 200Q379 335 378 343Q372 371 358 385T334 402T308 404Q263 404 229 370Q202 343 195 315T187 232V168V108Q187 78 188 68T191 55T200 49Q221 46 249 46H265V0H257L234 1Q210 2 183 2T145 3Q42 3 33 0H25V46H41Z"></path><path id="MJX-28-TEX-N-64" d="M376 495Q376 511 376 535T377 568Q377 613 367 624T316 637H298V660Q298 683 300 683L310 684Q320 685 339 686T376 688Q393 689 413 690T443 693T454 694H457V390Q457 84 458 81Q461 61 472 55T517 46H535V0Q533 0 459 -5T380 -11H373V44L365 37Q307 -11 235 -11Q158 -11 96 50T34 215Q34 315 97 378T244 442Q319 442 376 393V495ZM373 342Q328 405 260 405Q211 405 173 369Q146 341 139 305T131 211Q131 155 138 120T173 59Q203 26 251 26Q322 26 373 103V342Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mstyle"><g data-mml-node="mspace"></g></g><g data-mml-node="mo" transform="translate(278,0)"><use data-c="27F9" xlink:href="#MJX-28-TEX-N-27F9"></use></g><g data-mml-node="mstyle" transform="translate(1916,0)"><g data-mml-node="mspace"></g></g><g data-mml-node="mtext" transform="translate(2471.8,0)"><use data-c="73" xlink:href="#MJX-28-TEX-N-73"></use><use data-c="65" xlink:href="#MJX-28-TEX-N-65" transform="translate(394,0)"></use><use data-c="61" xlink:href="#MJX-28-TEX-N-61" transform="translate(838,0)"></use><use data-c="72" xlink:href="#MJX-28-TEX-N-72" transform="translate(1338,0)"></use><use data-c="63" xlink:href="#MJX-28-TEX-N-63" transform="translate(1730,0)"></use><use data-c="68" xlink:href="#MJX-28-TEX-N-68" transform="translate(2174,0)"></use><use data-c="28" xlink:href="#MJX-28-TEX-N-28" transform="translate(2730,0)"></use><use data-c="6B" xlink:href="#MJX-28-TEX-N-6B" transform="translate(3119,0)"></use><use data-c="29" xlink:href="#MJX-28-TEX-N-29" transform="translate(3647,0)"></use><use data-c="20" xlink:href="#MJX-28-TEX-N-20" transform="translate(4036,0)"></use><use data-c="2D" xlink:href="#MJX-28-TEX-N-2D" transform="translate(4286,0)"></use><use data-c="3E" xlink:href="#MJX-28-TEX-N-3E" transform="translate(4619,0)"></use><use data-c="20" xlink:href="#MJX-28-TEX-N-20" transform="translate(5397,0)"></use><use data-c="62" xlink:href="#MJX-28-TEX-N-62" transform="translate(5647,0)"></use><use data-c="6F" xlink:href="#MJX-28-TEX-N-6F" transform="translate(6203,0)"></use><use data-c="6F" xlink:href="#MJX-28-TEX-N-6F" transform="translate(6703,0)"></use><use data-c="6C" xlink:href="#MJX-28-TEX-N-6C" transform="translate(7203,0)"></use><use data-c="20" xlink:href="#MJX-28-TEX-N-20" transform="translate(7481,0)"></use><use data-c="66" xlink:href="#MJX-28-TEX-N-66" transform="translate(7731,0)"></use><use data-c="6F" xlink:href="#MJX-28-TEX-N-6F" transform="translate(8037,0)"></use><use data-c="75" xlink:href="#MJX-28-TEX-N-75" transform="translate(8537,0)"></use><use data-c="6E" xlink:href="#MJX-28-TEX-N-6E" transform="translate(9093,0)"></use><use data-c="64" xlink:href="#MJX-28-TEX-N-64" transform="translate(9649,0)"></use></g></g></g></svg></mjx-container><script type="math/tex">\implies \text{search(k) -> bool found}</script></p>
<blockquote><p>之所以能夠在 <code>第一次發現解</code>後 <code>判定該解就是最優解</code>並 <code>終止算法</code>是取決於 <code>題目性質</code></p>
<p>如果 <code>題目所求的最優解</code> 與 <code>遞歸的深度</code>（也就是<code>最優解和長度無關</code>）無關，那麽 <code>IDDFS</code>可能並不會更有效。</p>
</blockquote>
</li>
<li><p>若<code>第一次發現任何解</code>則 <code>立即終止搜索</code>並 <code>返回該解</code> ， 否則報告 <code>無解</code></p>
</li>

</ul>
<p>&nbsp;</p>
<h3>Solution</h3>
<h4>DFS</h4>
<h5>Source</h5>
<pre><code class="language-java" lang="java">    public static int f(int i) {
        return 3 * i;
    }

    public static int g(int i) {
        return i / 2;
    }
    
    public static String ans_string;
    
    public static void solve(int n, int m, int limit, String ops) {
    
        // Base Case
        if ((n == m) || (n == 0) || (m == 0) || (ops.length() &gt; ans_string.length()) || limit &gt;= 30) {
            if (n == m) {
                if (ops.length() &lt; ans_string.length()) {
                    ans_string = ops;
                }
            }
            return;
        }
    
        // Recursion Case
        solve(f(n), m, limit + 1, "f" + ops);
        solve(g(n), m, limit + 1, "g" + ops);
    }
</code></pre>
<h5>Benchmark</h5>
<pre><code class="language-yaml" lang="yaml">-----------------------------------------------------
Current Case: FUNC0.in &amp; FUNC0.out
Expected  Input: [15 4]
Expected Output: [4, gfgg]
Your     Output: [4, gfgg]
Time Cost: 157.343000 ms (157343000 ns)
Accepted.
-----------------------------------------------------
Current Case: FUNC1.in &amp; FUNC1.out
Expected  Input: [115 8]
Expected Output: [9, gggggggff]
Your     Output: [9, gggggggff]
Time Cost: 3852.005300 ms (3852005300 ns)
Accepted.
-----------------------------------------------------
Current Case: FUNC10.in &amp; FUNC10.out
Expected  Input: [11838 127878]
Expected Output: [25, ggffffggggfgggfffffgggggf]
Your     Output: [25, ggffffggggfgggfffffgggggf]
Time Cost: 15302.874100 ms (15302874100 ns)
Accepted.
-----------------------------------------------------
Current Case: FUNC2.in &amp; FUNC2.out
Expected  Input: [82 54]
Expected Output: [8, fffggggg]
Your     Output: [8, fffggggg]
Time Cost: 295.231800 ms (295231800 ns)
Accepted.
-----------------------------------------------------
Current Case: FUNC3.in &amp; FUNC3.out
Expected  Input: [56 125]
Expected Output: [22, ggggggffffffgggggggfff]
Your     Output: [22, ggggggffffffgggggggfff]
Time Cost: 3743.782100 ms (3743782100 ns)
Accepted.
-----------------------------------------------------
Current Case: FUNC4.in &amp; FUNC4.out
Expected  Input: [115 111]
Expected Output: [18, fgfgfgggggfffggggf]
Your     Output: [18, fgfgfgggggfffggggf]
Time Cost: 13528.005700 ms (13528005700 ns)
Accepted.
-----------------------------------------------------
Current Case: FUNC5.in &amp; FUNC5.out
Expected  Input: [210 24907]
Expected Output: [24, gffgggggfffffffffggggggf]
Your     Output: [24, gffgggggfffffffffggggggf]
Time Cost: 14796.151600 ms (14796151600 ns)
Accepted.
-----------------------------------------------------
Current Case: FUNC6.in &amp; FUNC6.out
Expected  Input: [50961 91791]
Expected Output: [25, fggffffgggggggggggggfffff]
Your     Output: [25, fggffffgggggggggggggfffff]
Time Cost: 2660.372100 ms (2660372100 ns)
Accepted.
-----------------------------------------------------
Current Case: FUNC7.in &amp; FUNC7.out
Expected  Input: [59338 486]
Expected Output: [22, fffffggggggggggggggggf]
Your     Output: [22, fffffggggggggggggggggf]
Time Cost: 2700.998700 ms (2700998700 ns)
Accepted.
-----------------------------------------------------
Current Case: FUNC8.in &amp; FUNC8.out
Expected  Input: [53530 750062539]
Expected Output: [25, gfgfgfffffffffggfgggggfff]
Your     Output: [25, gfgfgfffffffffggfgggggfff]
Time Cost: 5185.903400 ms (5185903400 ns)
Accepted.
-----------------------------------------------------
Current Case: FUNC9.in &amp; FUNC9.out
Expected  Input: [96418 37529284]
Expected Output: [25, gffffffgggggggggggfffffff]
Your     Output: [25, gffffffgggggggggggfffffff]
Time Cost: 2065.022700 ms (2065022700 ns)
Accepted.
-----------------------------------------------------
Result Statistics: √ √ √ √ √ √ √ √ √ √ √ 
</code></pre>
<h4>Iterative Deepening  DFS</h4>
<h5>Source</h5>
<pre><code class="language-java" lang="java">    public static int f(int i) {
        return 3 * i;
    }

    public static int g(int i) {
        return i / 2;
    }
    
    /* Global Variable */
    private static int n;
    private static int m;
    private static int k;
    private static boolean[] performF;
    
    public static int estimate(int n, int m) {
        return n;
    }
    
    public static boolean found() {
        int value = n;
        for (int i = 0; i &lt; k; i++) {
            if (performF[i]) {
                value = f(value);
            } else value = g(value);
        }
        return value == m;
    }
    
    public static void printCurrentPlan() {
        for (int i = k - 1; i &gt;= 0; i--) {
            System.out.print(performF[i] ? "f" : "g");
        }
    
    }
    
    public static boolean search(int depth) {
    
        /* Base Case */
        if (depth &gt;= k) {
            return found();
        }
    
        /* Recursion Case */
        // At any depth, we can have 2 choices:
    
        /* Perform f */
        performF[depth] = true;
        if (search(depth + 1)) {
            return true;
        }
    
        /* Perform g */
        performF[depth] = false;
        if (search(depth + 1)) {
            return true;
        }
    
        // If we can't perform either f or g, we backtrack
        return false;
    }
    
    public static void solve(Scanner scanner) {
        n = scanner.nextInt();
        m = scanner.nextInt();
        int estimate = estimate(n, m);
        performF = new boolean[estimate + 1];
    
        /* K-Search */
        // k means perform tiems
        for (k = 0; k &lt;= estimate; k++) {
            if (search(0)) {
                System.out.println(k);
                printCurrentPlan();
                break;
            }
        }
    }
</code></pre>
<h5>Benchmark</h5>
<pre><code class="language-yaml" lang="yaml">-----------------------------------------------------
Current Case: FUNC0.in &amp; FUNC0.out
Expected  Input: [15 4]
Expected Output: [4, gfgg]
Your     Output: [4, gfgg]
Time Cost: 3.844700 ms (3844700 ns)
Accepted.
-----------------------------------------------------
Current Case: FUNC1.in &amp; FUNC1.out
Expected  Input: [115 8]
Expected Output: [9, gggggggff]
Your     Output: [9, gggggggff]
Time Cost: 1.549000 ms (1549000 ns)
Accepted.
-----------------------------------------------------
Current Case: FUNC10.in &amp; FUNC10.out
Expected  Input: [11838 127878]
Expected Output: [25, ggffffggggfgggfffffgggggf]
Your     Output: [25, ggffffggggfgggfffffgggggf]
Time Cost: 2137.224700 ms (2137224700 ns)
Accepted.
-----------------------------------------------------
Current Case: FUNC2.in &amp; FUNC2.out
Expected  Input: [82 54]
Expected Output: [8, fffggggg]
Your     Output: [8, fffggggg]
Time Cost: 0.945200 ms (945200 ns)
Accepted.
-----------------------------------------------------
Current Case: FUNC3.in &amp; FUNC3.out
Expected  Input: [56 125]
Expected Output: [22, ggggggffffffgggggggfff]
Your     Output: [22, ggggggffffffgggggggfff]
Time Cost: 193.517300 ms (193517300 ns)
Accepted.
-----------------------------------------------------
Current Case: FUNC4.in &amp; FUNC4.out
Expected  Input: [115 111]
Expected Output: [18, fgfgfgggggfffggggf]
Your     Output: [18, fgfgfgggggfffggggf]
Time Cost: 16.105000 ms (16105000 ns)
Accepted.
-----------------------------------------------------
Current Case: FUNC5.in &amp; FUNC5.out
Expected  Input: [210 24907]
Expected Output: [24, gffgggggfffffffffggggggf]
Your     Output: [24, gffgggggfffffffffggggggf]
Time Cost: 1017.764000 ms (1017764000 ns)
Accepted.
-----------------------------------------------------
Current Case: FUNC6.in &amp; FUNC6.out
Expected  Input: [50961 91791]
Expected Output: [25, fggffffgggggggggggggfffff]
Your     Output: [25, fggffffgggggggggggggfffff]
Time Cost: 1749.323400 ms (1749323400 ns)
Accepted.
-----------------------------------------------------
Current Case: FUNC7.in &amp; FUNC7.out
Expected  Input: [59338 486]
Expected Output: [22, fffffggggggggggggggggf]
Your     Output: [22, fffffggggggggggggggggf]
Time Cost: 256.666400 ms (256666400 ns)
Accepted.
-----------------------------------------------------
Current Case: FUNC8.in &amp; FUNC8.out
Expected  Input: [53530 750062539]
Expected Output: [25, gfgfgfffffffffggfgggggfff]
Your     Output: [25, gfgfgfffffffffggfgggggfff]
Time Cost: 1587.514600 ms (1587514600 ns)
Accepted.
-----------------------------------------------------
Current Case: FUNC9.in &amp; FUNC9.out
Expected  Input: [96418 37529284]
Expected Output: [25, gffffffgggggggggggfffffff]
Your     Output: [25, gffffffgggggggggggfffffff]
Time Cost: 1395.128700 ms (1395128700 ns)
Accepted.
-----------------------------------------------------
Result Statistics: √ √ √ √ √ √ √ √ √ √ √ 
</code></pre>
<h2>Computation without Priority Problem</h2>
<h3>Description</h3>
<p>給定 n 個正整數和 4 個運算符＋、－、∗、/，且運算符無優先級，如 2+3∗5=25。對於
任意給定的整數 m，試設計一個算法，用以上給出的 n 個數和 4 個運算符，產生整數 m，
且用的運算次數最少。給出的 n 個數中每個數最多只能用 1 次，但每種運算符可以任意使用。</p>
<h3>Input</h3>
<p>對於給定的 n 個正整數，設計一個算法，用最少的無優先級運算次數產生整數 m。</p>
<h3>Output</h3>
<p>由文件 input.txt 給出輸入數據。第一行有 2 個正整數 n 和 m。第 2 行是給定的用於運算
的 n 個正整數。</p>
<h3>Sample</h3>
<p><strong>輸入文件示例</strong></p>
<p>input.txt</p>
<p>5 25
5 2 3 6 7</p>
<p><strong>輸出文件示例</strong></p>
<p>output.txt</p>
<p>2
2+3*5</p>
<h3>Analysis</h3>
<h4>DFS</h4>
<p>我們給出該問題的 <code>BFS Method</code>，該解法使用 <code>Token</code>存儲 <code>已使用的數字</code>和 <code>參與運算的運算符</code>信息。</p>
<p><code>遞歸過程</code>維護 <code>Token的鏈表</code>，通過 <code>遍歷Token鏈表</code>來獲得一個 <code>運算方案</code>。</p>
<h4>IDDFS</h4>
<p>不同於 <code>Integer Transformation Problem</code>的 <code>遞歸過程</code>：在 <code>DFS樹</code>的 <code>每一層</code>只需要選擇 <code>轉變方法</code></p>
<p><code>Computation without Priority Problem</code>的 <code>遞歸過程</code>：在 <code>DFS樹</code>的 <code>每一層</code> 不但要選擇 <code>使用的數字</code>，還要選擇 <code>使用的運算符</code></p>
<blockquote><p>不過，這並沒有什麽不同。因為，我們使用的是 <code>回溯法</code>。</p>
<p>我們只管 <code>嘗試所有可能的選法</code>，如果最終 <code>發現</code>確實 <code>DFS樹的某層的選擇</code>確實是錯的，</p>
<p>那麽我們進行 <code>回溯</code>即可！然後繼續尋找 <code>問題的解</code></p>
</blockquote>
<blockquote><p>另外，這裏我們不討論 <code>剪枝</code>的問題，盡管使用 <code>剪枝</code>可以再進一步優化該方法。</p>
</blockquote>
<h3>Solution</h3>
<h4>BFS</h4>
<h5>Source</h5>
<pre><code class="language-java" lang="java">    enum Operators {
        ADDICTION("+"), SUBTRACTION("-"), MULTIPLICATION("*"), DIVISION("/"), NONE("");

        private final String operatorString;
    
        Operators(String operatorString) {
            this.operatorString = operatorString;
        }
    
        public String toString() {
            return this.operatorString;
        }
    }
    
    static class Token {
        public Token parent;
        public int value;
        public int operand;
        public String operator;
        public int length;
    
        public Token(Token parent, int value, int operand, String operator) {
            this.parent = parent;
            this.value = value;
            this.operand = operand;
            this.operator = operator;
            this.length = parent != null ? parent.length + 1 : 1;
        }
    
        public ArrayList&lt;Integer&gt; listUsedOperands() {
            ArrayList&lt;Integer&gt; operands = new ArrayList&lt;&gt;();
            Token current = this;
            while (current != null) {
                operands.add(current.operand);
                current = current.parent;
            }
            return operands;
        }
    
        public String getPath() {
            StringBuilder sb = new StringBuilder();
            getPath(sb, this);
            return sb.toString();
        }
    
        private void getPath(StringBuilder sb, Token currentToken) {
            if (currentToken != null) {
                getPath(sb, currentToken.parent);
                sb.append(currentToken.operator).append(currentToken.operand);
            }
        }
    
        @Override
        public String toString() {
            return this.getPath();
        }
    }


    /*
    Current Case: ARIT0.in &amp; ARIT0.out
    Expected  Input: [5 25, 5 2 3 6 7]
    Expected Output: [2, 2+3*5]
    
    5 2 3 6 7
    0 0 0 0 0
    */
    public static Token solve(ArrayList&lt;Integer&gt; nums, int m) {
    
        /* Initialize the tokens */
        LinkedList&lt;Token&gt; tokens = new LinkedList&lt;&gt;();
        for (int num : nums) {
            // If we are lucky enough...
            if (num == m) return new Token(null, m, m, Operators.NONE.toString());
            tokens.add(new Token(null, num, num, Operators.NONE.toString()));
        }
    
        /* Brute-Force-Search */
        for (int level = 0; level &lt; nums.size(); level++) {
    
            int SIZE = tokens.size();
            for (int amount = 0; amount &lt; SIZE; amount++) {
    
                /* Get the first token */
                Token currentToken = tokens.poll();
    
                /* Generate tokens */
                // Get unused nums
                ArrayList&lt;Integer&gt; unusedNums = new ArrayList&lt;&gt;(nums);
                currentToken.listUsedOperands().forEach(unusedNums::remove);
    
                // Try all operators
                for (int num : unusedNums) {
    
                    for (Operators operator : Operators.values()) {
                        if (operator == Operators.NONE) continue;
    
                        int newValue;
                        switch (operator) {
                            case ADDICTION:
                                newValue = currentToken.value + num;
                                break;
                            case SUBTRACTION:
                                newValue = currentToken.value - num;
                                break;
                            case MULTIPLICATION:
                                newValue = currentToken.value * num;
                                break;
                            case DIVISION:
                                newValue = currentToken.value / num;
                                break;
                            default:
                                newValue = 0xdead;
                        }
    
                        /* Push */
                        Token newToken = new Token(currentToken, newValue, num, operator.toString());
    
                        /* Found ? */
                        if (newToken.value == m) {
                            return newToken;
                        } else tokens.add(newToken);
                    }
                }
            }
        }
        return null;
    }
</code></pre>
<h5>Benchmark</h5>
<pre><code class="language-yaml" lang="yaml">-----------------------------------------------------
Current Case: ARIT0.in &amp; ARIT0.out
Expected  Input: [5 25, 5 2 3 6 7]
Expected Output: [2, 2+3*5]
Your     Output: [2, 2+3*5]
Time Cost: 7.099500 ms (7099500 ns)
Accepted.
-----------------------------------------------------
Current Case: ARIT1.in &amp; ARIT1.out
Expected  Input: [30 2894, 2 40 2 50 48 23 39 26 23 42 36 29 35 17 39 16 48 12 45 20 35 19 20 3 15 42 1 49 45 10 ]
Expected Output: [3, 40+39*36+50]
Your     Output: [3, 40+39*36+50]
Time Cost: 477.980500 ms (477980500 ns)
Accepted.
-----------------------------------------------------
Current Case: ARIT10.in &amp; ARIT10.out
Expected  Input: [6 721, 1 2 3 4 5 6]
Expected Output: [5, 2*3*4*5*6+1]
Your     Output: [5, 2*3*4*5*6+1]
Time Cost: 38.360500 ms (38360500 ns)
Accepted.
-----------------------------------------------------
Current Case: ARIT2.in &amp; ARIT2.out
Expected  Input: [21 11573, 16 17 3 12 24 49 25 18 28 5 38 8 22 3 11 11 16 21 4 11 32 ]
Expected Output: [4, 16+3*38*16+21]
Your     Output: [4, 16*17+32*38+21]
Time Cost: 7109.397600 ms (7109397600 ns)
Wrong Answer.
-----------------------------------------------------
Current Case: ARIT3.in &amp; ARIT3.out
Expected  Input: [8 1554, 32 23 1 1 26 33 28 5 ]
Expected Output: [3, 33+28*26-32]
Your     Output: [3, 33+28*26-32]
Time Cost: 3.193600 ms (3193600 ns)
Accepted.
-----------------------------------------------------
Current Case: ARIT4.in &amp; ARIT4.out
Expected  Input: [41 48, 34 44 38 38 28 38 39 45 34 19 13 4 36 41 32 30 8 31 10 15 32 27 34 38 4 42 35 49 23 27 18 30 9 6 2 47 47 16 48 9 17 ]
Expected Output: [0, 48]
Your     Output: [0, 48]
Time Cost: 1.859300 ms (1859300 ns)
Accepted.
-----------------------------------------------------
Current Case: ARIT5.in &amp; ARIT5.out
Expected  Input: [17 11787, 3 9 37 7 7 11 32 48 34 3 31 20 27 38 19 27 17 ]
Expected Output: [3, 31*20*19+7]
Your     Output: [3, 31*20*19+7]
Time Cost: 47.619500 ms (47619500 ns)
Accepted.
-----------------------------------------------------
Current Case: ARIT6.in &amp; ARIT6.out
Expected  Input: [4 24, 1 1 10 7]
Expected Output: [3, 1+1*7+10]
Your     Output: [3, 1+1*7+10]
Time Cost: 1.087000 ms (1087000 ns)
Accepted.
-----------------------------------------------------
Current Case: ARIT7.in &amp; ARIT7.out
Expected  Input: [18 2553, 32 48 3 42 7 34 12 29 3 50 30 35 22 13 35 9 11 20 ]
Expected Output: [3, 32+29*42-9]
Your     Output: [3, 32+29*42-9]
Time Cost: 3.876700 ms (3876700 ns)
Accepted.
-----------------------------------------------------
Current Case: ARIT8.in &amp; ARIT8.out
Expected  Input: [6 1234, 1 2 3 4 5 6]
Expected Output: [No Solution!]
Your     Output: [No Solution!]
Time Cost: 1250.530200 ms (1250530200 ns)
Accepted.
-----------------------------------------------------
Current Case: ARIT9.in &amp; ARIT9.out
Expected  Input: [27 9546, 10 5 30 1 14 49 8 19 44 21 23 35 26 7 35 3 27 18 5 15 49 23 8 44 48 49 47 ]
Expected Output: [4, 10+14*19*21-30]
Your     Output: [4, 10*30-26*35-44]
Time Cost: 33963.559100 ms (33963559100 ns)
Wrong Answer.
-----------------------------------------------------
Result Statistics: √ √ √ × √ √ √ √ √ √ × 
</code></pre>
<h4>Iterative-Deeping DFS</h4>
<h5>Source</h5>
<pre><code class="language-java" lang="java">    /* Global Variables */
    private enum Operators {
        ADDICTION("+"), SUBTRACTION("-"), MULTIPLICATION("*"), DIVISION("/");

        private final String operatorString;
    
        Operators(String operatorString) {
            this.operatorString = operatorString;
        }
    
        @Override
        public String toString() {
            return this.operatorString;
        }
    }
    
    private static int k;
    private static int n;
    private static int m;
    private static int[] nums;
    private static boolean[] used;
    private static int[] operands;
    private static int[] operators;
    
    public static void printCurrentPlan() {
        // for n numbers, we can use k \in {0, 1, 2, ..., n-1} operators
        // k = 0 means that we don't need to use any operators
        for (int i = 0; i &lt;= k; i++) {
            if (i &gt; 0) System.out.print(Operators.values()[operators[i - 1]]);
            System.out.print(operands[i]);
        }
    }
    
    public static boolean found() {
    
        int sum = 0xdead;
        // k means the number of operands
        for (int i = 0; i &lt;= k; i++) {
            // Push the first operand
            if (i == 0) {
                sum = operands[0];
                continue;
            }
    
            // Actually, we won't use the last index of operator
            // And if we only have one operand, we won't need to calc any operators. (just ignore the only operator at index 0)
            int operator = operators[i - 1];
            int operand = operands[i];
    
            // Calculate
            switch (Operators.values()[operator]) {
                case ADDICTION:
                    sum += operand;
                    break;
                case SUBTRACTION:
                    sum -= operand;
                    break;
                case MULTIPLICATION:
                    sum *= operand;
                    break;
                case DIVISION:
                    sum /= operand;
                    break;
            }
    
        }
    
        return sum == m;
    }
    
    public static boolean search(int depth) {
    
        /* Base Case */
        if (depth &gt; k) {
            return found();
        }
    
        /* Recursive Case */
    
        // We can choose any of the unused numbers !
        for (int i = 0; i &lt; nums.length; i++) {
            // Skip the number if we have used it.
            if (used[i]) continue;
            else used[i] = true;
    
            // Use the number
            operands[depth] = nums[i];
    
            // Also, we can use any of the operators !
            for (int j = 0; j &lt; Operators.values().length; j++) {
                // Use the operator
                operators[depth] = Operators.values()[j].ordinal();
    
                // Go !
                if (search(depth + 1)) {
                    // if not found, the recursion should go ahead
                    return true;
                }
            }
    
            // Free it !
            used[i] = false;
        }
    
        return false;
    }
    
    public static void solve(Scanner scanner) {
    
        /* Initialize */
        n = scanner.nextInt();
        nums = new int[n];
        used = new boolean[n];
        operands = new int[n];
        operators = new int[n];
    
        m = scanner.nextInt();
        for (int i = 0; i &lt; n; i++) {
            nums[i] = scanner.nextInt();
        }
    
        /* k-search */
        // k is the number of operands
        // for n, k = 0, 1, 2, ..., n-1
        for (k = 0; k &lt; nums.length; k++) {
            if (search(0)) {
                System.out.println(k);
                printCurrentPlan();
                return;
            }
        }
        System.out.println("No Solution!");
    }
</code></pre>
<h5>Benchmark</h5>
<pre><code class="language-yaml" lang="yaml">-----------------------------------------------------
Current Case: ARIT0.in &amp; ARIT0.out
Expected  Input: [5 25, 5 2 3 6 7]
Expected Output: [2, 2+3*5]
Your     Output: [2, 2+3*5]
Time Cost: 6.820100 ms (6820100 ns)
Accepted.
-----------------------------------------------------
Current Case: ARIT1.in &amp; ARIT1.out
Expected  Input: [30 2894, 2 40 2 50 48 23 39 26 23 42 36 29 35 17 39 16 48 12 45 20 35 19 20 3 15 42 1 49 45 10 ]
Expected Output: [3, 40+39*36+50]
Your     Output: [3, 40+39*36+50]
Time Cost: 473.039600 ms (473039600 ns)
Accepted.
-----------------------------------------------------
Current Case: ARIT10.in &amp; ARIT10.out
Expected  Input: [6 721, 1 2 3 4 5 6]
Expected Output: [5, 2*3*4*5*6+1]
Your     Output: [5, 2*3*4*5*6+1]
Time Cost: 266.458500 ms (266458500 ns)
Accepted.
-----------------------------------------------------
Current Case: ARIT2.in &amp; ARIT2.out
Expected  Input: [21 11573, 16 17 3 12 24 49 25 18 28 5 38 8 22 3 11 11 16 21 4 11 32 ]
Expected Output: [4, 16+3*38*16+21]
Your     Output: [4, 16+3*38*16+21]
Time Cost: 2210.722500 ms (2210722500 ns)
Accepted.
-----------------------------------------------------
Current Case: ARIT3.in &amp; ARIT3.out
Expected  Input: [8 1554, 32 23 1 1 26 33 28 5 ]
Expected Output: [3, 33+28*26-32]
Your     Output: [3, 33+28*26-32]
Time Cost: 17.388700 ms (17388700 ns)
Accepted.
-----------------------------------------------------
Current Case: ARIT4.in &amp; ARIT4.out
Expected  Input: [41 48, 34 44 38 38 28 38 39 45 34 19 13 4 36 41 32 30 8 31 10 15 32 27 34 38 4 42 35 49 23 27 18 30 9 6 2 47 47 16 48 9 17 ]
Expected Output: [0, 48]
Your     Output: [0, 48]
Time Cost: 1.912900 ms (1912900 ns)
Accepted.
-----------------------------------------------------
Current Case: ARIT5.in &amp; ARIT5.out
Expected  Input: [17 11787, 3 9 37 7 7 11 32 48 34 3 31 20 27 38 19 27 17 ]
Expected Output: [3, 31*20*19+7]
Your     Output: [3, 31*20*19+7]
Time Cost: 510.196400 ms (510196400 ns)
Accepted.
-----------------------------------------------------
Current Case: ARIT6.in &amp; ARIT6.out
Expected  Input: [4 24, 1 1 10 7]
Expected Output: [3, 1+1*7+10]
Your     Output: [3, 1+1*7+10]
Time Cost: 1.734900 ms (1734900 ns)
Accepted.
-----------------------------------------------------
Current Case: ARIT7.in &amp; ARIT7.out
Expected  Input: [18 2553, 32 48 3 42 7 34 12 29 3 50 30 35 22 13 35 9 11 20 ]
Expected Output: [3, 32+29*42-9]
Your     Output: [3, 32+29*42-9]
Time Cost: 17.189900 ms (17189900 ns)
Accepted.
-----------------------------------------------------
Current Case: ARIT8.in &amp; ARIT8.out
Expected  Input: [6 1234, 1 2 3 4 5 6]
Expected Output: [No Solution!]
Your     Output: [No Solution!]
Time Cost: 293.963800 ms (293963800 ns)
Accepted.
-----------------------------------------------------
Current Case: ARIT9.in &amp; ARIT9.out
Expected  Input: [27 9546, 10 5 30 1 14 49 8 19 44 21 23 35 26 7 35 3 27 18 5 15 49 23 8 44 48 49 47 ]
Expected Output: [4, 10+14*19*21-30]
Your     Output: [4, 10+14*19*21-30]
Time Cost: 5940.226300 ms (5940226300 ns)
Accepted.
-----------------------------------------------------
Result Statistics: √ √ √ √ √ √ √ √ √ √ √ 
</code></pre>
<p>&nbsp;</p>

{% endraw %}
