---
title: "tweak KDE preferences"
date: 2023-04-26 22:04:00
tags: 
 - kde
 - os
---

# KDE使用偏好

## 保持桌面的整潔

>  比起 `模糊搜索` 而言, 在 `雜亂的桌面` 上尋找 `某個圖標`, 是 `低效` 且 `不優雅` 的

良好的 `桌面` 應當保持 `0 圖標` , 在桌面上放置一個或多個常用的圖標並不能提高工作效率, 相反地還會影響桌面的美觀. 一個 `app launcher` 即可取代 `所有被放置在桌面上的圖標`


## 將k-runner作爲調色板

### 作爲 "搜索引擎"

> 如果任何 `文件` 都可以通過 `模糊搜索` 在瞬間取得, 那麼花費時間來精心整理文件, 則是徒勞的.

> 請注意, 該圖中的 `左上角` 並沒有 `app launcher`. 這是因爲 `k-runner` 可以完全替代它, 並且做得更好.
>
> `app launcher` 至少有以下幾個缺點:
>
> 1. 喚起的速度過慢
> 2. 索引的速度過慢
> 3. 容易因按到 "meta鍵" 而誤觸
>
> 而通過 `alt + space` 觸發的 `k-runner` 則沒有這些缺陷.
>
> > 其實對於 `window switcher`, 也可以使用 `meta + 1/2/../9`

相比於 `windows` 上的 `everything` 和 `listray` 來說, 在 `linux` 上則可以選擇 `k-runner` 作爲一種替代.

這個東西本質上是一個 `search engine`, 你可以通過配置各種 `plugin` 來添加一種新的 `search source` ,

以便: `搜索某個文件`, `搜索某個當前正運行的window`, `搜索某個已安裝的application`, `搜索某個virtual-desktop`

> 啓用 `fs index` 即可讓 `k-runner` 擁有在 `瞬間` 完成 `搜索某個文件` 的能力.
>
### 作爲"解釋器"

也可以使用k-runner來執行一些 `簡單的命令`.

## 讓 `tray icons` 保持簡潔

默認的 `tray icons` 包含非常多 `不常用的tray icon`, 所以我們需要根據 `自己的使用偏好`. 

只將 `常用的tray icons` 顯示出來.

對於某些 `重要但不常用的tray icon`, 可以設置顯示策略爲 `當相關時顯示`

## 善用 `Do not disturb` 模式

設置 `快捷鍵` 以便通過 `meta + n` 來切換 `do not disturb mode` .

當需要免打擾環境時, 可以快速切入.

## 選擇使用 `multi-activity` 和 `multi-vitrual-desktop` 來區分 `角色`

> 在某些 `工作場景` 下, 我們往往需要扮演 `多角色`.
>
> 比如, 我們可能需要: 同時扮演 `前端工程師` 和 `後端工程師`, 同時扮演 `軟件開發工程師` 和 `軟件測試員`
>
> 此時需要運行 `一組不同的application`, 如果將 `所有的application` 都放在 `同一個virtual-desktop` 或者 `同一個activity`, 然後通過 `alt+tab` 來切換的話, 則有以下這些缺點:
>
> 1. 繁瑣, 你無法精準切換你想要的application (如果通過 `k-runner` 來切斷可能會好些)
> 2. 你會因爲切換application而 `打亂` 窗口之間的 `layout`. (這可能會迫使你使用鼠標來重新對此進行調整)
>
> 此時, 通過切換 `virtual-desktop` 或 `activity` , 就如同 `你使用2塊不同的顯示屏` 一樣.

使用 `meta+tab` 即可 `切換到下一個activity`, 這裏建議只設置 `2個activity`, 避免切換時的繁瑣. 

`virtual-desktop` 和 `activity` 是兩種不同 `粒度` 的用於解決 `多角色問題` 的解決方案, 可以根據自己的需求選擇.

## 設置更動聽的 `窗口移動特效`

通過啓用 `translucency` 和 `wobbly windows`, 使得: 

1. `window` 在 `移動時` 自動 `透明化` , 以便觀察 `底部的windows`
2. 讓 `window` 在移動時像 `果凍` 一樣

## 設置更方便的 `window actions`

將 `meta + 鼠標輸入` 設置爲一系列的 `window指令`, 如:

1. `meta` + `mouse scroll` = 窗口最大化/最小化
2. `meta` + `mouse left click` = 移動窗口 (這樣就可以在 `window的內部` 直接 `發送移動指令` , 而不必拖着狹小的 `title bar`  來`發送移動指令`)
3. `meta` + `mouse right click` = 調整窗口大小 (如果通過 `窗口邊緣`來調整大小的話, 則對 `鼠標的精準操作` 有很高要求. )x
4. ...



理論上講, 任何需要 `高精準度的鼠標操作` 都應該有 `替代方案`. 

點擊一個 `面積更大的區域` 總是比 `更小的區域` 更方便.

## 使用 `window rule` 進行 `自動化佈局`

在某些 `工作場景` 下, 可能需要進行 `長時間保持某個窗口佈局方式`, 比如: 一邊開啓 `IDE`, 一邊開啓 `browser` 查閱文檔. 此時可以通過設置 `window rule` 來自動完成這種 `窗口佈局`.

## 對 `input method` 進行微調至合適

此處建議使用 `開源的input method` , 如果你還有點關注 `你的privacy` 的話.

> 開源方案建議: `rime` , `fcitx-chinese-addons`

配置 `im group` 和 `im layout` , 以及 `切換快捷鍵` , 使得 `切換im` 不會與 `某些全屏應用` 發生衝突.

## 取消 `不可信證書`

爲了避免 `MITM attack`, 並不是所有的 `CA證書` 都值得你信任.

## 電源管理

設置 `閒置時`  自動熄屏

## 流量控制

啓用 `firewall` 對 `traffic` 進行控制.

## 在設備開機後自動部署工作環境

如果你經常 `關機` 的話...
