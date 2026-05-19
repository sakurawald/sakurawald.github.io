---
title: "optimize minecraft server configuration"
date: 2023-05-01 05:04:00
tags: 
 - minecraft
---

# A Discussion About Minecraft Server Configurations

## Abstract

這篇文章將討論如何對一個 `Minecraft服務端` 進行 `基本配置`，`優化配置` 以及一些進階的內容。

我們將討論如何在 `減少對VANILLA做出改變` 的情況下，對 `服務端核心` 進行性能優化。

這篇文章會從最基本的配置開始，並且逐漸介紹一些比較重要的 `配置項`。

當然，我們可能會略過一些無關影響的項目。

## How to choose the best server-core ?

如何選擇 `服務端核心` 取決於你的需求。

由於這篇文章主要側重於針對 `插件服` 的優化討論，所以我們不會過多地討論 `模組服` 的優化問題。

> 對於 `模組服` 而言，更應當考慮的是 `兼容性問題` 和 `安全性問題`。
>
> 對於安裝有多個 `模組` 的 `模組服` 而言，首要的任務是解決上述兩個問題，然後再考慮解決 `影響較大的性能問題`。
>
> > 目前來說，模組服可以選擇兩種主流的核心：
> >
> > - 基於Forge + Bukkit 的核心：這類核心將同時支持 `Bukkit` 和 `Forge` 的 `API`，但或多或少存在不同的兼容問題，
> >
> >   本質上來說，由於兩套事件系統是相對獨立的，如何較好地來處理EventBus一直是比較頭疼的問題。
> >
> >   > 如果你希望有較好的兼容性，可以嘗試 `CatServer`
> >   >
> >   > 如果你希望保持最新版本的更近，可以嘗試 `Mohist`
> >   >
> >   > > 盡管 `Mohist` 的開發團隊盡力地保持版本跟進，並且他們宣稱擁有 `99%的Bukkit插件兼容性`，但事實並不是這樣的。
> >   > >
> >   > > Mohist經常會出現莫名其妙的 `NPE異常`，並且對於部分 `流行插件` 仍具有兼容問題。
> >   >
> >   > > 一些已經停止維護的核心，如MCPC，KCauldron等，以及他們的接力者將不被提及。
> >
> > - 基於 Forge/Fabric 的核心：如果你選擇了這類核心，那麽將免去了 `插件` 的那些麻煩事情。
> >
> >   你可能將無法安裝插件，但你或許根本不需要他們。
> >
> >   > 使用 `Mixin技術` 的  `Sponge` 比較激進，但是如果它符合你的需求，可以做一個嘗試。
> >   >
> >   > 此外， `Fabric` 搭配 `優化類模組` 也是不錯的選擇。

對於 `插件服` 而言，我們將首先排除掉 `Vanilla` ，這是 `Mojang` 所提供的默認服務端 ，盡管它可以保證原汁原味的特性，但由於極其糟糕的性能表現，以及不支持 `Bukkit API`，將不符合大部分的需求。

其次考慮 `CraftBukkit`，最大的特色是加入了 `Bukkit API` 的支持，這構成了 `插件服` 的基礎。

但如果你打算使用 `CraftBukkit`，請不妨考慮下 `Spigot`，後者擁有 `更好的性能`，並且對 `特性的改變` 與前者相差甚微。

接下來，我們會講本篇文章的主角：`Paper` 是一個註重於 `性能` 與 `安全` 的 `下一代服務端`，在保持 `較多特性` 不被改變的情況下，提供了 `極大的性能優化`。

並且，你根本不需要擔心 `Bukkit API` 的兼容性問題，甚至相反地，`主流的插件` 會主動選擇使用提供了更多功能的 `Paper API`，而這一切都是 `向下兼容的`

> `插件開發者` 應該盡量選擇使用 `Paper API`，而不是 `Spigot API`。以便免費地獲得 `性能提升`，同時不丟失 `兼容性`。

進一步地，`Purpur` 是一個 `基於Paper的服務端`，它提供 `更進一步的性能優化`，以及 `更高自由度的配置項`。

本文會著重討論 `Paper/Purpur` 核心。

> 如果 `Paper` 已經完全足夠滿足你的需求，那麽你可以選擇就使用它。但 `Purpur` 仍然有許多有用的 `特性開關`，以及 `性能優化`

我知道有許多 `基於Paper/Purpur的服務端`，但 `Paper/Purpur` 已經提供了足夠多的 `保守的性能優化`，以及一些 `激進的性能優化`。

在這個前提下，選擇 `其他更進一步的優化端`，將很難獲得 `顯著的性能提升`，並且將引入更多的 `不穩定性`。

## How to config the server-core ?

這個章節將占據大部分的內容，而且也是 `最重要` 的，或許也是 `最難的`。

重新強調一遍，本篇文章基於的原則是：**最小化對VANILLA的改變的同時，盡可能地獲得優化配置。**

> `優化配置` 是糟糕的方案，他們本應該在 `代碼` 中完成優化，那樣才會是最有效的。

我們會循序漸進地討論每個配置項。

### server.properties

```properties
#Minecraft server properties
enable-jmx-monitoring=false
# 請關閉基於明文傳輸的RCON協議，如果堅持使用，你的密碼將可能被嗅探，並導致潛在的安全問題。
rcon.port=25575
level-seed=
gamemode=survival
enable-command-block=false
# 是否啟用"狀態查詢協議"，這將決定Server List的Status是否會正常顯示。
enable-query=false
generator-settings={}
# 如果你希望將不當言論當成有效證據並提交給Mojang的話，請啟用該項。
enforce-secure-profile=false
level-name=world
motd=A Minecraft Server
query.port=11565
pvp=true
generate-structures=true
max-chained-neighbor-updates=1000000
difficulty=hard
network-compression-threshold=256
max-tick-time=60000
require-resource-pack=false
use-native-transport=true
max-players=20
online-mode=false
enable-status=true
allow-flight=true
broadcast-rcon-to-ops=true
# 盡管修改該項可以極大地影響性能，但同時也將極大地損壞特性。請不要碰這項。
view-distance=10
server-ip=
resource-pack-prompt=
allow-nether=true
server-port=25565
enable-rcon=false
sync-chunk-writes=true
op-permission-level=4
server-name=Unknown Server
prevent-proxy-connections=false
# 對於較高版本的Client，當Cursor懸浮在Status欄時，可以查詢到在線玩家。該項對帶寬有極小影響。
hide-online-players=true
resource-pack=
entity-broadcast-range-percentage=100
# 見view-distance
simulation-distance=10
rcon.password=
player-idle-timeout=0
debug=false
force-gamemode=false
# 不要指望通過設置該值來避免流量攻擊，當你需要用到該值時，已經為時過晚。
rate-limit=0
hardcore=false
white-list=false
broadcast-console-to-ops=true
spawn-npcs=true
previews-chat=false
spawn-animals=true
function-permission-level=3
level-type=minecraft\:normal
text-filtering-config=
spawn-monsters=true
enforce-whitelist=false
spawn-protection=0
resource-pack-sha1=
max-world-size=29999984
```

對於 `server.properties` 而言，你應當只期望在這裏完成 `最基本的設置`，通過修改這個 `配置文件` 不會讓你獲得 `期望的性能提升`。（不要碰 `view-distance` 和 `simulation-distance` ，如果你在乎 `特性` 的話）

### bukkit.yml

```yaml
settings:
  allow-end: true
  warn-on-overload: true
  permissions-file: permissions.yml
  update-folder: update
  plugin-profiling: false
  # 對於相同IP來說，兩次連接之間必須等待的間隔：該項可以一定程度防禦流量攻擊。
  connection-throttle: 4000
  query-plugins: false
  deprecated-verbose: default
  shutdown-message: Server closed.
  minimum-api: none
  use-map-color-cache: true
# 如果你遭遇了實體過多的情況，可以選擇減少spawn-limits中的數值。
# 一般來說，減少ambient和water-ambient數值不會有什麽影響，但是盡量不要減少monsters
spawn-limits:
  monsters: 70
  animals: 10
  water-animals: 5
  water-ambient: 20
  water-underground-creature: 5
  axolotls: 5
  ambient: 15
chunk-gc:
  period-in-ticks: 600
ticks-per:
  animal-spawns: 400
  # 請註意，該項會對性能造成較大的影響。該項的默認值是一個非常瘋狂的數值。它會按每秒20次的頻率不斷計算可生成怪物的區域。
  # 可以比較安全地提升該項數值，因為大部分的計算量實際上是無效的，對特性的改變極小。
  monster-spawns: 1
  water-spawns: 20
  water-ambient-spawns: 20
  water-underground-creature-spawns: '20'
  axolotl-spawns: 20
  ambient-spawns: 400
  # 可以選擇禁用Bukkit的自動保存，因為Paper提供了一個更加高效且穩定的存儲算法。
  autosave: 0
aliases: now-in-commands.yml
```

### spigot.yml

```yaml
# This is the main configuration file for Spigot.
# As you can see, there's tons to configure. Some options may impact gameplay, so use
# with caution, and make sure you know what each option does before configuring.
# For a reference for any variable inside this file, check out the Spigot wiki at
# http://www.spigotmc.org/wiki/spigot-configuration/
#
# If you need help with the configuration or have any questions related to Spigot,
# join us at the Discord or drop by our forums and leave a post.
#
# Discord: https://www.spigotmc.org/go/discord
# Forums: http://www.spigotmc.org/

settings:
  debug: false
  sample-count: 0
  # 核心在未響應狀態下，等待多久執行重啟。對於較差的CPU或者網絡狀態，建議設置該值為60到180s以避免陷入"不正常的循環重啟"之中
  # 一個註定失敗的網絡請求通常會耗費1-2分鐘時間。（一般來說，開發者們總是假設網絡請求不會失敗，並且也很少為失敗情況編寫有效的處理代碼。）
  timeout-time: 180
  restart-on-crash: true
  restart-script: ./start.sh
  bungeecord: false
  player-shuffle: 0
  user-cache-size: 1000
  save-user-cache-on-stop-only: false
  # 請務必禁用Spigot提供的AC功能，因為他們總是造成false-positive，以及影響遊玩體驗的setback
  moved-wrongly-threshold: '2048'
  moved-too-quickly-multiplier: '2048'
  netty-threads: 4
  attribute:
    maxHealth:
      max: 2048
    movementSpeed:
      max: 2048
    attackDamage:
      max: 2048
  log-villager-deaths: true
  log-named-deaths: true
messages:
  whitelist: message
  unknown-command: message
  server-full: message
  outdated-client: message
  outdated-server: message
  restart: message
advancements:
  disable-saving: false
  disabled:
  - minecraft:story/disabled
commands:
  spam-exclusions:
  - /skill
  silent-commandblock-console: false
  replace-commands:
  - setblock
  - summon
  - testforblock
  - tellraw
  log: true
  tab-complete: 0
  send-namespaced: true
players:
  disable-saving: false
world-settings:
  default:
    seed-ancientcity: 20083232
    seed-buriedtreasure: 10387320
    seed-mineshaft: default
    verbose: false
    below-zero-generation-in-existing-chunks: true
    end-portal-sound-radius: 0
    merge-radius:
      item: 2.5
      exp: 3
    # 如果你安裝了任何清道夫插件，那麽你應該回來好好看看這個配置項。
    item-despawn-rate: 6000
    view-distance: default
    simulation-distance: default
    thunder-chance: 100000
    enable-zombie-pigmen-portal-spawns: true
    wither-spawn-sound-radius: 0
    hanging-tick-frequency: 100
    arrow-despawn-rate: 1200
    trident-despawn-rate: 1200
    zombie-aggressive-towards-villager: true
    nerf-spawner-mobs: false
    mob-spawn-range: 8
    growth:
      cactus-modifier: 100
      cane-modifier: 100
      melon-modifier: 100
      mushroom-modifier: 100
      pumpkin-modifier: 100
      sapling-modifier: 100
      beetroot-modifier: 100
      carrot-modifier: 100
      potato-modifier: 100
      wheat-modifier: 100
      netherwart-modifier: 100
      vine-modifier: 100
      cocoa-modifier: 100
      bamboo-modifier: 100
      sweetberry-modifier: 100
      kelp-modifier: 100
      twistingvines-modifier: 100
      weepingvines-modifier: 100
      cavevines-modifier: 100
      glowberry-modifier: 100
    # activation-range會極大地影響性能，但仍然不建議修改該值。否則與生物特性相關的結構將會失效。
    entity-activation-range:
      animals: 32
      monsters: 32
      raiders: 48
      misc: 16
      water: 16
      villagers: 32
      flying-monsters: 32
      wake-up-inactive:
        animals-max-per-tick: 4
        animals-every: 1200
        animals-for: 100
        monsters-max-per-tick: 8
        monsters-every: 400
        monsters-for: 100
        villagers-max-per-tick: 4
        villagers-every: 600
        villagers-for: 100
        flying-monsters-max-per-tick: 8
        flying-monsters-every: 200
        flying-monsters-for: 100
      villagers-work-immunity-after: 100
      villagers-work-immunity-for: 20
      villagers-active-for-panic: true
      tick-inactive-villagers: true
      ignore-spectators: false
    entity-tracking-range:
      players: 48
      animals: 48
      monsters: 48
      misc: 32
      other: 64
    # 盡管hopper是性能代價最大的tile entity，但仍然不建議修改hopper的屬性，因為Paper針對hopper使用了優化算法。
    ticks-per:
      hopper-transfer: 8
      hopper-check: 1
    hopper-amount: 1
    hopper-can-load-chunks: false
    dragon-death-sound-radius: 0
    # 如果你希望使用anti-xray功能，請記得在地圖被生成之前修改structure-seed
    seed-village: 10387312
    seed-desert: 14357617
    seed-igloo: 14357618
    seed-jungle: 14357619
    seed-swamp: 14357620
    seed-monument: 10387313
    seed-shipwreck: 165745295
    seed-ocean: 14357621
    seed-outpost: 165745296
    seed-endcity: 10387313
    seed-slime: 987234911
    seed-nether: 30084232
    seed-mansion: 10387319
    seed-fossil: 14357921
    seed-portal: 34222645
    seed-stronghold: default
    hunger:
      jump-walk-exhaustion: 0.05
      jump-sprint-exhaustion: 0.2
      combat-exhaustion: 0.1
      regen-exhaustion: 6
      swim-multiplier: 0.01
      sprint-multiplier: 0.1
      other-multiplier: 0
    # 這項數值限製了每刻TNT的計算量上限，TNT的計算並不會造成laggy，除非該項被設置地足夠大。
    max-tnt-per-tick: 1000
    # 為了在TPS不足20.0時保證hopper等tile entity以及普通entity的正確運算，可以將max-tick-time設置地足夠長。
    max-tick-time:
      tile: 1000
      entity: 1000
  worldeditregentempworld:
    verbose: false
  faweregentempworld:
    verbose: false
config-version: 12
stats:
  disable-saving: false
  forced-stats: {}
```

### paper-global.yml

```yaml
# This is the global configuration file for Paper.
# As you can see, there's a lot to configure. Some options may impact gameplay, so use
# with caution, and make sure you know what each option does before configuring.
# 
# If you need help with the configuration or have any questions related to Paper,
# join us in our Discord or check the docs page.
# 
# The world configuration options have been moved inside
# their respective world folder. The files are named paper-world.yml
# 
# Docs: https://docs.papermc.io/
# Discord: https://discord.gg/papermc
# Website: https://papermc.io/

_version: 28
async-chunks:
  threads: -1
chunk-loading:
  autoconfig-send-distance: true
  enable-frustum-priority: false
  global-max-chunk-load-rate: -1.0
  global-max-chunk-send-rate: -1.0
  global-max-concurrent-loads: 500.0
  max-concurrent-sends: 2
  min-load-radius: 2
  player-max-chunk-load-rate: -1.0
  player-max-concurrent-loads: 20.0
  target-player-chunk-send-rate: 100.0
chunk-system:
  gen-parallelism: default
  io-threads: -1
  worker-threads: -1
collisions:
  enable-player-collisions: true
  send-full-pos-for-hard-colliding-entities: true
commands:
  fix-target-selector-tag-completion: true
  suggest-player-names-when-null-tab-completions: true
  time-command-affects-all-worlds: false
console:
  enable-brigadier-completions: true
  enable-brigadier-highlighting: true
  has-all-permissions: false
item-validation:
  book:
    author: 8192
    page: 16384
    title: 8192
  book-size:
    page-max: 2560
    total-multiplier: 0.98
  display-name: 8192
  lore-line: 8192
  resolve-selectors-in-books: false
logging:
  deobfuscate-stacktraces: true
  log-player-ip-addresses: true
  use-rgb-for-named-text-colors: true
messages:
  kick:
    authentication-servers-down: message
    connection-throttle: message
    flying-player: message
    flying-vehicle: message
  no-permission: message
  use-display-name-in-quit-message: false
misc:
  chat-threads:
    chat-executor-core-size: -1
    chat-executor-max-size: -1
  fix-entity-position-desync: true
  lag-compensate-block-breaking: true
  load-permissions-yml-before-plugins: true
  max-joins-per-tick: 3
  region-file-cache-size: 256
  strict-advancement-dimension-check: false
  use-alternative-luck-formula: false
  use-dimension-type-for-custom-spawners: false
packet-limiter:
  all-packets:
    action: KICK
    interval: 7.0
    max-packet-rate: 5000.0
  kick-message: <red><lang:disconnect.exceeded_packet_rate>
  overrides:
    ServerboundPlaceRecipePacket:
      action: DROP
      interval: 4.0
      max-packet-rate: 5.0
# 請註意，不同於bukkit.yml中的autosave，Paper中的playerdata和chunks數據是分開保存的。
player-auto-save:
  max-per-tick: -1
  rate: 6000
proxies:
  bungee-cord:
    online-mode: true
  proxy-protocol: false
  velocity:
    enabled: false
    online-mode: false
    secret: ''
scoreboards:
  save-empty-scoreboard-teams: false
  track-plugin-scoreboards: false
spam-limiter:
  incoming-packet-threshold: 300
  recipe-spam-increment: 1
  recipe-spam-limit: 20
  tab-spam-increment: 1
  tab-spam-limit: 500
timings:
  enabled: false
  hidden-config-entries:
  - database
  - proxies.velocity.secret
  history-interval: 300
  history-length: 3600
  really-enabled: false
  server-name: Unknown Server
  server-name-privacy: false
  url: https://timings.aikar.co/
  verbose: true
# 根據你的需求設置
unsupported-settings:
  allow-grindstone-overstacking: false
  allow-headless-pistons: true
  allow-permanent-block-break-exploits: true
  allow-piston-duplication: true
  perform-username-validation: true
watchdog:
  early-warning-delay: 180000
  early-warning-every: 5000
```

### paper-world-defaults.yml

```yaml
# This is the world defaults configuration file for Paper.
# As you can see, there's a lot to configure. Some options may impact gameplay, so use
# with caution, and make sure you know what each option does before configuring.
# 
# If you need help with the configuration or have any questions related to Paper,
# join us in our Discord or check the docs page.
# 
# Configuration options here apply to all worlds, unless you specify overrides inside
# the world-specific config file inside each world folder.
# 
# Docs: https://docs.papermc.io/
# Discord: https://discord.gg/papermc
# Website: https://papermc.io/

_version: 29
anticheat:
  # 如果你需要反礦透功能，請務必選擇Paper的anti-xray，沒有任何插件可以優於Paper的anti-xary
  anti-xray:
    enabled: false
    # mode 2對帶寬和內存影響非常大，但效果也最強力。（盡管仍然可以被bypass）
    # mode 1可以較為有效地降低作弊玩家的優勢。
    engine-mode: 2
    hidden-blocks:
    - chest
    - coal_ore
    - deepslate_coal_ore
    - copper_ore
    - deepslate_copper_ore
    - raw_copper_block
    - diamond_ore
    - deepslate_diamond_ore
    - emerald_ore
    - deepslate_emerald_ore
    - gold_ore
    - deepslate_gold_ore
    - iron_ore
    - deepslate_iron_ore
    - raw_iron_block
    - lapis_ore
    - deepslate_lapis_ore
    - redstone_ore
    - deepslate_redstone_ore
    lava-obscures: false
    max-block-height: 64
    replacement-blocks:
    - stone
    - oak_planks
    - deepslate
    update-radius: 2
    use-permission: false
  obfuscation:
    items:
      hide-durability: false
      hide-itemmeta: false
chunks:
  # 如果你禁用了bukkit.yml的autosave，那麽請務必記得啟用Paper的auto-save-interval （該項僅保存chunks）
  auto-save-interval: '6000'
  # 該項用於設置區塊卸載的緩沖區，如果經常發生往復傳送，則設置該項為10-20s可以避免相同區塊被反復地卸載和加載。
  delay-chunk-unloads-by: 0s
  entity-per-chunk-save-limit:
    arrow: -1
    ender_pearl: -1
    experience_orb: -1
    fireball: -1
    small_fireball: -1
    snowball: -1
  fixed-chunk-inhabited-time: -1
  max-auto-save-chunks-per-tick: 24
  prevent-moving-into-unloaded-chunks: false
collisions:
  allow-player-cramming-damage: false
  allow-vehicle-collisions: true
  fix-climbing-bypassing-cramming-rule: false
  max-entity-collisions: 8
  only-players-collide: false
entities:
  armor-stands:
    do-collision-entity-lookups: true
    tick: true
  behavior:
    baby-zombie-movement-modifier: 0.5
    disable-chest-cat-detection: false
    disable-creeper-lingering-effect: false
    disable-player-crits: false
    door-breaking-difficulty:
      husk:
      - HARD
      vindicator:
      - NORMAL
      - HARD
      zombie:
      - HARD
      zombie_villager:
      - HARD
      zombified_piglin:
      - HARD
    ender-dragons-death-always-places-dragon-egg: false
    experience-merge-max-value: -1
    mobs-can-always-pick-up-loot:
      skeletons: false
      zombies: false
    nerf-pigmen-from-nether-portals: false
    parrots-are-unaffected-by-player-movement: false
    phantoms-do-not-spawn-on-creative-players: true
    phantoms-only-attack-insomniacs: true
    piglins-guard-chests: true
    pillager-patrols:
      disable: false
      spawn-chance: 0.2
      spawn-delay:
        per-player: false
        ticks: 12000
      start:
        day: 5
        per-player: false
    should-remove-dragon: false
    spawner-nerfed-mobs-should-jump: false
    zombie-villager-infection-chance: -1.0
    zombies-target-turtle-eggs: true
  entities-target-with-follow-range: false
  mob-effects:
    immune-to-wither-effect:
      wither: true
      wither-skeleton: true
    spiders-immune-to-poison-effect: true
    undead-immune-to-certain-effects: true
  spawning:
    all-chunks-are-slime-chunks: false
    # 為不同的item設置不同的despawn-rate，這裏可能需要進行設置。
    # 保持默認配置也是可以接受的，因為item一般不造成服務端卡頓。
    alt-item-despawn-rate:
      enabled: true
      items:
        cobblestone: 300
    count-all-mobs-for-spawning: false
    creative-arrow-despawn-rate: default
    despawn-ranges:
      ambient:
        hard: 128
        soft: 32
      axolotls:
        hard: 128
        soft: 32
      creature:
        hard: 128
        soft: 32
      misc:
        hard: 128
        soft: 32
      monster:
        hard: 128
        soft: 32
      underground_water_creature:
        hard: 128
        soft: 32
      water_ambient:
        hard: 64
        soft: 32
      water_creature:
        hard: 128
        soft: 32
    disable-mob-spawner-spawn-egg-transformation: true
    duplicate-uuid:
      mode: SAFE_REGEN
      safe-regen-delete-range: 32
    filter-nbt-data-from-spawn-eggs-and-related: true
    iron-golems-can-spawn-in-air: false
    monster-spawn-max-light-level: -1
    non-player-arrow-despawn-rate: default
    per-player-mob-spawns: true
    scan-for-legacy-ender-dragon: true
    skeleton-horse-thunder-spawn-chance: default
    slime-spawn-height:
      slime-chunk:
        maximum: 40.0
      surface-biome:
        maximum: 70.0
        minimum: 50.0
    spawn-limits:
      ambient: -1
      axolotls: -1
      creature: -1
      monster: -1
      underground_water_creature: -1
      water_ambient: -1
      water_creature: -1
    wandering-trader:
      spawn-chance-failure-increment: 25
      spawn-chance-max: 75
      spawn-chance-min: 25
      spawn-day-length: 24000
      spawn-minute-length: 1200
    wateranimal-spawn-height:
      maximum: default
      minimum: default
environment:
  disable-explosion-knockback: false
  disable-ice-and-snow: false
  disable-teleportation-suffocation-check: false
  disable-thunder: false
  fire-tick-delay: 30
  frosted-ice:
    delay:
      max: 40
      min: 20
    enabled: true
  generate-flat-bedrock: false
  nether-ceiling-void-damage-height: disabled
  optimize-explosions: true
  portal-create-radius: 16
  portal-search-radius: 128
  portal-search-vanilla-dimension-scaling: true
  treasure-maps:
    enabled: true
    find-already-discovered:
      loot-tables: default
      villager-trade: false
  water-over-lava-flow-speed: 5
# 如果你願意付出使用anti-xary的mode2的代價，那麽最好也為"結構生成"啟用隨機種子
# 否則，Github上的SeedCrackerX將可以在取得一定特征值後，輕松地完成對seed的暴力破解。
feature-seeds:
  generate-random-seeds-for-all: false
fishing-time-range:
  maximum: 600
  minimum: 100
fixes:
  disable-unloaded-chunk-enderpearl-exploit: true
  falling-block-height-nerf: disabled
  fix-curing-zombie-villager-discount-exploit: false
  fix-items-merging-through-walls: false
  prevent-tnt-from-moving-in-water: false
  split-overstacked-loot: true
  tnt-entity-height-nerf: disabled
hopper:
  cooldown-when-full: true
  disable-move-event: false
  ignore-occluding-blocks: false
lootables:
  auto-replenish: false
  max-refills: -1
  refresh-max: 2d
  refresh-min: 12h
  reset-seed-on-fill: true
  restrict-player-reloot: true
maps:
  item-frame-cursor-limit: 128
  item-frame-cursor-update-interval: 10
max-growth-height:
  bamboo:
    max: 16
    min: 11
  cactus: 3
  reeds: 3
misc:
  disable-end-credits: false
  disable-relative-projectile-velocity: false
  disable-sprint-interruption-on-attack: false
  light-queue-size: 20
  max-leash-distance: 10.0
  # 盡管有些高性能的紅石實現算法，但他們往往只支持一些特定的版本，並且也不是完美復現特性。
  # 對於上述所提到的服務端核心，該項均使用的是VANILLA實現算法。
  redstone-implementation: VANILLA
  shield-blocking-delay: 5
  show-sign-click-command-failure-msgs-to-player: false
  update-pathfinding-on-block-update: false
scoreboards:
  allow-non-player-entities-on-scoreboards: false
  use-vanilla-world-scoreboard-name-coloring: false
spawn:
  allow-using-signs-inside-spawn-protection: false
  keep-spawn-loaded: true
  keep-spawn-loaded-range: 10
tick-rates:
  # 對於entity計算量過大的情況下，通常可以修改該項來進行優化。
  # 這裏不會公布一份萬能的配置，但你可以通過閱讀timings或者sparks報告來填寫這些數值。
  # 對於pillager和zombified_piglin的行為限製略有不同。
  behavior: {}
  container-update: 1
  grass-spread: 1
  mob-spawner: 1
  # 見behavior
  # 如果villager和zombie的計算量過大，則應當著重查看該項。
  sensor: {}
unsupported-settings:
  fix-invulnerable-end-crystal-exploit: true
```

### pufferfish.yml

```yaml
# Pufferfish Configuration
# Check out Pufferfish Host for maximum performance server hosting: https://pufferfish.host
# Join our Discord for support: https://discord.gg/reZw4vQV9H
# Download new builds at https://ci.pufferfish.host/job/Pufferfish
info:
  version: '1.0'
# These values define a entity's maximum lifespan. If an
# entity is in this list and it has survived for longer than
# that number of ticks, then it will be removed. Setting a value to
# -1 disables this feature.
entity_timeouts:
  SNOWBALL: -1
  LLAMA_SPIT: -1
sentry-dsn: ''
enable-books: true
enable-suffocation-optimization: true
# 這一項並不意味著mob-spawning是fully-async的，仍然是parted-async，但開啟這項基本不造成特性改變。
enable-async-mob-spawning: true
# Optimizes projectile settings
projectile:
  max-loads-per-tick: 10
  max-loads-per-projectile: 10
# Optimizes entity brains when
# they're far away from the player
# 對於實體過多的情況，使用DAB來控製brain-tick是有效的方案，但是請註意通過blacklist過濾掉不適宜的實體。
# 修改該數值會造成較為明顯的特性改變。
dab:
  enabled: false
  start-distance: 12
  max-tick-freq: 20
  activation-dist-mod: 8
  blacklisted-entities: []
inactive-goal-selector-throttle: false
# Settings for things that don't belong elsewhere
misc:
  disable-method-profiler: true
  disable-out-of-order-chat: false
```

### purpur.yml

```yaml
# This is the main configuration file for Purpur.
# As you can see, there's tons to configure. Some options may impact gameplay, so use
# with caution, and make sure you know what each option does before configuring.
#
# If you need help with the configuration or have any questions related to Purpur,
# join us in our Discord guild.
#
# Website: https://purpurmc.org 
# Docs: https://purpurmc.org/docs 

verbose: false
settings:
  block-fall-multipliers:
    minecraft:black_bed:
      distance: 0.5
    minecraft:yellow_bed:
      distance: 0.5
    minecraft:lime_bed:
      distance: 0.5
    minecraft:brown_bed:
      distance: 0.5
    minecraft:light_gray_bed:
      distance: 0.5
    minecraft:magenta_bed:
      distance: 0.5
    minecraft:purple_bed:
      distance: 0.5
    minecraft:light_blue_bed:
      distance: 0.5
    minecraft:pink_bed:
      distance: 0.5
    minecraft:red_bed:
      distance: 0.5
    minecraft:hay_block:
      damage: 0.2
    minecraft:white_bed:
      distance: 0.5
    minecraft:gray_bed:
      distance: 0.5
    minecraft:cyan_bed:
      distance: 0.5
    minecraft:blue_bed:
      distance: 0.5
    minecraft:green_bed:
      distance: 0.5
    minecraft:orange_bed:
      distance: 0.5
  fix-projectile-looting-transfer: false
  blast-resistance-overrides: {}
  messages:
    cannot-ride-mob: <red>You cannot mount that mob
    afk-broadcast-away: <yellow><italic>%s is now AFK
    afk-broadcast-back: <yellow><italic>%s is no longer AFK
    afk-tab-list-prefix: '[AFK] '
    afk-tab-list-suffix: ''
    credits-command-output: <green>%s has been shown the end credits
    demo-command-output: <green>%s has been shown the demo screen
    ping-command-output: <green>%s's ping is %sms
    ram-command-output: '<green>Ram Usage: <used>/<xmx> (<percent>)'
    rambar-command-output: <green>Rambar toggled <onoff> for <target>
    tpsbar-command-output: <green>Tpsbar toggled <onoff> for <target>
    dont-run-with-scissors: <red><italic>Don't run with scissors!
    uptime-command-output: <green>Server uptime is <uptime>
    unverified-username: default
    sleep-skipping-night: default
    sleeping-players-percent: default
    death-message:
      run-with-scissors: <player> slipped and fell on their shears
      stonecutter: <player> has sawed themself in half
  broadcasts:
    advancement:
      only-broadcast-to-affected-player: false
    death:
      only-broadcast-to-affected-player: false
  # 與anti-xray搭配使用
  seed:
    structure:
      buried_treasure: -1
      mineshaft: -1
  # 該項用於規定laggy的判定閾值，與villager的動態tick-brain搭配使用。
  lagging-threshold: 16.0
  command:
    rambar:
      title: <gray>Ram<yellow>:</yellow> <used>/<xmx> (<percent>)
      overlay: NOTCHED_20
      progress-color:
        good: GREEN
        medium: YELLOW
        low: RED
      text-color:
        good: <gradient:#55ff55:#00aa00><text></gradient>
        medium: <gradient:#ffff55:#ffaa00><text></gradient>
        low: <gradient:#ff5555:#aa0000><text></gradient>
      tick-interval: 20
    tpsbar:
      title: <gray>TPS<yellow>:</yellow> <tps> MSPT<yellow>:</yellow> <mspt> Ping<yellow>:</yellow>
        <ping>ms
      overlay: NOTCHED_20
      fill-mode: MSPT
      progress-color:
        good: GREEN
        medium: YELLOW
        low: RED
      text-color:
        good: <gradient:#55ff55:#00aa00><text></gradient>
        medium: <gradient:#ffff55:#ffaa00><text></gradient>
        low: <gradient:#ff5555:#aa0000><text></gradient>
      tick-interval: 20
    compass:
      title: 'S  ·  ◈  ·  ◈  ·  ◈  ·  SW  ·  ◈  ·  ◈  ·  ◈  ·  W  ·  ◈  ·  ◈  ·  ◈  ·  NW  ·  ◈  ·  ◈  ·  ◈  ·  N  ·  ◈  ·  ◈  ·  ◈  ·  NE  ·  ◈  ·  ◈  ·  ◈  ·  E  ·  ◈  ·  ◈  ·  ◈  ·  SE  ·  ◈  ·  ◈  ·  ◈  ·  S  ·  ◈  ·  ◈  ·  ◈  ·  SW  ·  ◈  ·  ◈  ·  ◈  ·  W  ·  ◈  ·  ◈  ·  ◈  ·  NW  ·  ◈  ·  ◈  ·  ◈  ·  N  ·  ◈  ·  ◈  ·  ◈  ·  NE  ·  ◈  ·  ◈  ·  ◈  ·  E  ·  ◈  ·  ◈  ·  ◈  ·  SE  ·  ◈  ·  ◈  ·  ◈  ·  '
      overlay: PROGRESS
      progress-color: BLUE
      percent: 1.0
      tick-interval: 5
    gamemode:
      requires-specific-permission: false
    fill:
      max-area: 32768
    hide-hidden-players-from-entity-selector: false
    uptime:
      format: <days><hours><minutes><seconds>
      day: '%02d day, '
      days: '%02d days, '
      hour: '%02d hour, '
      hours: '%02d hours, '
      minute: '%02d minute, and '
      minutes: '%02d minutes, and '
      second: '%02d second'
      seconds: '%02d seconds'
  blocks:
    barrel:
      rows: 3
    ender_chest:
      six-rows: false
      use-permissions-for-rows: false
    crying_obsidian:
      valid-for-portal-frame: false
    beehive:
      max-bees-inside: 3
    anvil:
      cumulative-cost: true
    lightning_rod:
      range: 128
    grindstone:
      ignored-enchants:
      - minecraft:binding_curse
      - minecraft:vanishing_curse
      remove-attributes: false
      remove-name-and-lore: false
    cave_vines:
      max-growth-age: 25
    kelp:
      max-growth-age: 25
    twisting_vines:
      max-growth-age: 25
    weeping_vines:
      max-growth-age: 25
    disable-mushroom-updates: false
    disable-note-block-updates: false
    disable-chorus-plant-updates: false
  enchantment:
    allow-transparent-blocks-in-enchantment-box: false
    allow-infinity-and-mending-together: false
    allow-infinity-on-crossbow: false
    allow-looting-on-shears: false
    anvil:
      allow-unsafe-enchants: false
      allow-inapplicable-enchants: false
      allow-incompatible-enchants: false
      allow-higher-enchants-levels: false
    allow-unsafe-enchant-command: false
    clamp-levels: true
  entity:
    enderman:
      short-height: false
  allow-water-placement-in-the-end: true
  logger:
    suppress-library-loader: false
    suppress-init-legacy-material-errors: false
    suppress-ignored-advancement-warnings: false
    suppress-unrecognized-recipe-errors: false
    suppress-setblock-in-far-chunk-errors: false
    suppress-sent-expired-chat: false
  network:
    upnp-port-forwarding: false
    max-joins-per-second: true
    kick-for-out-of-order-chat: false
  username-valid-characters: ^[a-zA-Z0-9_.]*$
  food-properties: {}
  use-alternate-keepalive: true
  # 動態地調整tps，可以顯著提高tps的觀測數值，基本沒有副作用。
  tps-catchup: true
  server-mod-name: Purpur
  disable-give-dropping: true
config-version: 30
world-settings:
  default:
    blocks:
      grindstone:
        allow-oversized-stacking: false
      observer:
        disable-clock: false
      anvil:
        use-mini-message: false
        allow-colors: false
        iron-ingots-used-for-repair: 0
        obsidian-used-for-damage: 0
      azalea:
        growth-chance: 0.0
      beacon:
        effect-range:
          level-1: 20
          level-2: 30
          level-3: 40
          level-4: 50
      bed:
        explode: true
        explode-on-villager-sleep: false
        explosion-power: 5.0
        explosion-fire: true
        explosion-effect: DESTROY
      big_dripleaf:
        tilt-delay:
          FULL: 100
          UNSTABLE: 10
          PARTIAL: 10
      budding_amethyst:
        silk-touch: false
      cactus:
        breaks-from-solid-neighbors: true
      campfire:
        lit-when-placed: true
      chest:
        open-with-solid-block-on-top: false
      composter:
        sneak-to-bulk-process: false
      coral:
        die-outside-water: true
      dispenser:
        apply-cursed-to-armor-slots: true
        place-anvils: false
      door:
        requires-redstone: []
      dragon_egg:
        teleport: true
      end-crystal:
        baseless:
          explode: true
          explosion-power: 6.0
          explosion-fire: false
          explosion-effect: DESTROY
        base:
          explode: true
          explosion-power: 6.0
          explosion-fire: false
          explosion-effect: DESTROY
      farmland:
        bypass-mob-griefing: false
        gets-moist-from-below: false
        use-alpha-farmland: false
        disable-trampling: false
        only-players-trample: false
        feather-fall-distance-affects-trampling: false
        trample-height: -1.0
      flowering_azalea:
        growth-chance: 0.0
      furnace:
        use-lava-from-underneath: false
      end_portal:
        safe-teleporting: false
      packed_ice:
        allow-mob-spawns: true
      blue_ice:
        allow-mob-spawns: true
        allow-snow-formation: true
      lava:
        infinite-source: false
        infinite-required-sources: 2
        speed:
          nether: 10
          not-nether: 30
      conduit:
        effect-distance: 16
        mob-damage:
          distance: 8.0
          damage-amount: 4.0
        valid-ring-blocks:
        - minecraft:prismarine
        - minecraft:prismarine_bricks
        - minecraft:sea_lantern
        - minecraft:dark_prismarine
      cauldron:
        fill-chances:
          rain: 0.05000000074505806
          powder-snow: 0.10000000149011612
          dripstone-water: 0.17578125
          dripstone-lava: 0.05859375
      piston:
        block-push-limit: 12
      magma-block:
        damage-when-sneaking: false
        damage-with-frost-walker: false
      powder_snow:
        bypass-mob-griefing: false
      powered-rail:
        activation-range: 8
      respawn_anchor:
        explode: true
        explosion-power: 5.0
        explosion-fire: true
        explosion-effect: DESTROY
      sand:
        fix-duping: false
      sculk_shrieker:
        can-summon-default: false
      shulker_box:
        allow-oversized-stacks: false
      sign:
        right-click-edit: false
        allow-colors: false
      slab:
        break-individual-slabs-when-sneaking: false
      spawner:
        deactivate-by-redstone: false
        fix-mc-238526: false
      sponge:
        absorption:
          area: 64
          radius: 6
        absorbs-lava: false
      stonecutter:
        damage: 0.0
      turtle_egg:
        break-from-exp-orbs: true
        break-from-items: true
        break-from-minecarts: true
        bypass-mob-griefing: false
        random-tick-crack-chance: 500
        feather-fall-distance-affects-trampling: false
      water:
        infinite-source: true
        infinite-required-sources: 2
      enchantment-table:
        lapis-persists: false
    tools:
      axe:
        strippables:
          minecraft:dark_oak_wood:
            into: minecraft:stripped_dark_oak_wood
            drops: {}
          minecraft:warped_stem:
            into: minecraft:stripped_warped_stem
            drops: {}
          minecraft:mangrove_log:
            into: minecraft:stripped_mangrove_log
            drops: {}
          minecraft:birch_log:
            into: minecraft:stripped_birch_log
            drops: {}
          minecraft:warped_hyphae:
            into: minecraft:stripped_warped_hyphae
            drops: {}
          minecraft:acacia_log:
            into: minecraft:stripped_acacia_log
            drops: {}
          minecraft:jungle_wood:
            into: minecraft:stripped_jungle_wood
            drops: {}
          minecraft:dark_oak_log:
            into: minecraft:stripped_dark_oak_log
            drops: {}
          minecraft:jungle_log:
            into: minecraft:stripped_jungle_log
            drops: {}
          minecraft:crimson_stem:
            into: minecraft:stripped_crimson_stem
            drops: {}
          minecraft:acacia_wood:
            into: minecraft:stripped_acacia_wood
            drops: {}
          minecraft:crimson_hyphae:
            into: minecraft:stripped_crimson_hyphae
            drops: {}
          minecraft:oak_wood:
            into: minecraft:stripped_oak_wood
            drops: {}
          minecraft:birch_wood:
            into: minecraft:stripped_birch_wood
            drops: {}
          minecraft:spruce_wood:
            into: minecraft:stripped_spruce_wood
            drops: {}
          minecraft:spruce_log:
            into: minecraft:stripped_spruce_log
            drops: {}
          minecraft:oak_log:
            into: minecraft:stripped_oak_log
            drops: {}
          minecraft:mangrove_wood:
            into: minecraft:stripped_mangrove_wood
            drops: {}
        waxables:
          minecraft:waxed_weathered_cut_copper_stairs:
            into: minecraft:weathered_cut_copper_stairs
            drops: {}
          minecraft:waxed_oxidized_cut_copper_stairs:
            into: minecraft:oxidized_cut_copper_stairs
            drops: {}
          minecraft:waxed_exposed_cut_copper:
            into: minecraft:exposed_cut_copper
            drops: {}
          minecraft:waxed_cut_copper:
            into: minecraft:cut_copper
            drops: {}
          minecraft:waxed_cut_copper_stairs:
            into: minecraft:cut_copper_stairs
            drops: {}
          minecraft:waxed_exposed_copper:
            into: minecraft:exposed_copper
            drops: {}
          minecraft:waxed_weathered_cut_copper_slab:
            into: minecraft:weathered_cut_copper_slab
            drops: {}
          minecraft:waxed_oxidized_cut_copper_slab:
            into: minecraft:oxidized_cut_copper_slab
            drops: {}
          minecraft:waxed_exposed_cut_copper_stairs:
            into: minecraft:exposed_cut_copper_stairs
            drops: {}
          minecraft:waxed_weathered_cut_copper:
            into: minecraft:weathered_cut_copper
            drops: {}
          minecraft:waxed_oxidized_cut_copper:
            into: minecraft:oxidized_cut_copper
            drops: {}
          minecraft:waxed_weathered_copper:
            into: minecraft:weathered_copper
            drops: {}
          minecraft:waxed_oxidized_copper:
            into: minecraft:oxidized_copper
            drops: {}
          minecraft:waxed_copper_block:
            into: minecraft:copper_block
            drops: {}
          minecraft:waxed_cut_copper_slab:
            into: minecraft:cut_copper_slab
            drops: {}
          minecraft:waxed_exposed_cut_copper_slab:
            into: minecraft:exposed_cut_copper_slab
            drops: {}
        weatherables:
          minecraft:weathered_cut_copper_slab:
            into: minecraft:exposed_cut_copper_slab
            drops: {}
          minecraft:oxidized_cut_copper_slab:
            into: minecraft:weathered_cut_copper_slab
            drops: {}
          minecraft:weathered_cut_copper:
            into: minecraft:exposed_cut_copper
            drops: {}
          minecraft:exposed_cut_copper_slab:
            into: minecraft:cut_copper_slab
            drops: {}
          minecraft:oxidized_cut_copper_stairs:
            into: minecraft:weathered_cut_copper_stairs
            drops: {}
          minecraft:oxidized_copper:
            into: minecraft:weathered_copper
            drops: {}
          minecraft:exposed_cut_copper_stairs:
            into: minecraft:cut_copper_stairs
            drops: {}
          minecraft:weathered_copper:
            into: minecraft:exposed_copper
            drops: {}
          minecraft:exposed_cut_copper:
            into: minecraft:cut_copper
            drops: {}
          minecraft:oxidized_cut_copper:
            into: minecraft:weathered_cut_copper
            drops: {}
          minecraft:exposed_copper:
            into: minecraft:copper_block
            drops: {}
          minecraft:weathered_cut_copper_stairs:
            into: minecraft:exposed_cut_copper_stairs
            drops: {}
      hoe:
        tillables:
          minecraft:coarse_dirt:
            into: minecraft:dirt
            drops: {}
            condition: air_above
          minecraft:dirt_path:
            into: minecraft:farmland
            drops: {}
            condition: air_above
          minecraft:rooted_dirt:
            into: minecraft:dirt
            drops:
              minecraft:hanging_roots: 1.0
            condition: always
          minecraft:dirt:
            into: minecraft:farmland
            drops: {}
            condition: air_above
          minecraft:grass_block:
            into: minecraft:farmland
            drops: {}
            condition: air_above
        replant-crops: false
        replant-nether-warts: false
    mobs:
      tropical_fish:
        ridable: false
        controllable: true
        attributes:
          max_health: 3.0
        takes-damage-from-water: false
        always-drop-exp: false
      turtle:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 30.0
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      vex:
        ridable: false
        ridable-in-water: false
        controllable: true
        ridable-max-y: 320.0
        attributes:
          max_health: 14.0
        takes-damage-from-water: false
        always-drop-exp: false
      villager:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
        brain-ticks: 300
        use-brain-ticks-only-when-lagging: true
        follow-emerald-blocks: false
        can-be-leashed: false
        can-breed: true
        breeding-delay-ticks: 6000
        clerics-farm-warts: false
        cleric-wart-farmers-throw-warts-at-villagers: true
        bypass-mob-griefing: false
        takes-damage-from-water: false
        allow-trading: true
        always-drop-exp: false
        minimum-demand: 0
        lobotomize:
          enabled: false
          check-interval: 100
        display-trade-item: true
        spawn-iron-golem:
          radius: 0
          limit: 0
      vindicator:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 24.0
        johnny:
          spawn-chance: 0.0
        takes-damage-from-water: false
        always-drop-exp: false
      wandering_trader:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
        follow-emerald-blocks: false
        can-be-leashed: false
        takes-damage-from-water: false
        allow-trading: true
        always-drop-exp: false
      warden:
        ridable: false
        ridable-in-water: false
        controllable: true
      witch:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 26.0
        takes-damage-from-water: false
        always-drop-exp: false
      wither:
        ridable: false
        ridable-in-water: false
        controllable: true
        ridable-max-y: 320.0
        attributes:
          max_health: 300.0
        health-regen-amount: 1.0
        health-regen-delay: 20
        bypass-mob-griefing: false
        takes-damage-from-water: false
        can-ride-vehicles: false
        explosion-radius: 1.0
        play-spawn-sound: true
        always-drop-exp: false
      wither_skeleton:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
        takes-damage-from-water: false
        always-drop-exp: false
      wolf:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 8.0
        default-collar-color: RED
        milk-cures-rabid-wolves: true
        spawn-rabid-chance: 0.0
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      zoglin:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 40.0
        takes-damage-from-water: false
        always-drop-exp: false
      zombie:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
          spawn_reinforcements: 0.1
        jockey:
          only-babies: true
          chance: 0.05
          try-existing-chickens: true
        aggressive-towards-villager-when-lagging: true
        bypass-mob-griefing: false
        takes-damage-from-water: false
        always-drop-exp: false
        head-visibility-percent: 0.5
      zombie_horse:
        ridable-in-water: false
        can-swim: false
        attributes:
          max_health:
            min: 15.0
            max: 15.0
          jump_strength:
            min: 0.4
            max: 1.0
          movement_speed:
            min: 0.2
            max: 0.2
        spawn-chance: 0.0
        takes-damage-from-water: false
        always-drop-exp: false
      zombie_villager:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
          spawn_reinforcements: 0.1
        jockey:
          only-babies: true
          chance: 0.05
          try-existing-chickens: true
        takes-damage-from-water: false
        curing_time:
          min: 3600
          max: 6000
        cure:
          enabled: true
        always-drop-exp: false
      zombified_piglin:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
          spawn_reinforcements: 0.0
        jockey:
          only-babies: true
          chance: 0.05
          try-existing-chickens: true
        count-as-player-kill-when-angry: true
        takes-damage-from-water: false
        always-drop-exp: false
      hoglin:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 40.0
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      horse:
        ridable-in-water: false
        attributes:
          max_health:
            min: 15.0
            max: 30.0
          jump_strength:
            min: 0.4
            max: 1.0
          movement_speed:
            min: 0.1125
            max: 0.3375
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        stand-with-rider: true
        stand-when-hurt: true
        always-drop-exp: false
      husk:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
          spawn_reinforcements: 0.1
        jockey:
          only-babies: true
          chance: 0.05
          try-existing-chickens: true
        takes-damage-from-water: false
        always-drop-exp: false
      illusioner:
        ridable: false
        ridable-in-water: false
        controllable: true
        movement-speed: 0.5
        follow-range: 18.0
        attributes:
          max_health: 32.0
        takes-damage-from-water: false
        always-drop-exp: false
      iron_golem:
        ridable: false
        ridable-in-water: false
        controllable: true
        can-swim: false
        attributes:
          max_health: 100.0
        takes-damage-from-water: false
        poppy-calms-anger: false
        healing-calms-anger: false
        always-drop-exp: false
      llama:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health:
            min: 15.0
            max: 30.0
          jump_strength:
            min: 0.5
            max: 0.5
          movement_speed:
            min: 0.175
            max: 0.175
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        join-caravans: true
        always-drop-exp: false
      magma_cube:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: size * size
          attack_damage: size
        takes-damage-from-water: false
        always-drop-exp: false
      mooshroom:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 10.0
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      mule:
        ridable-in-water: false
        attributes:
          max_health:
            min: 15.0
            max: 30.0
          jump_strength:
            min: 0.5
            max: 0.5
          movement_speed:
            min: 0.175
            max: 0.175
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      ocelot:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 10.0
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      panda:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      parrot:
        ridable: false
        ridable-in-water: false
        controllable: true
        ridable-max-y: 320.0
        attributes:
          max_health: 6.0
        takes-damage-from-water: false
        can-breed: false
        always-drop-exp: false
      phantom:
        ridable: false
        ridable-in-water: false
        controllable: true
        ridable-max-y: 320.0
        flames:
          damage: 1.0
          fire-time: 8
        allow-griefing: false
        attributes:
          max_health: '20.0'
          attack_damage: 6 + size
        attacked-by-crystal-range: 0.0
        attacked-by-crystal-damage: 1.0
        orbit-crystal-radius: 0.0
        spawn:
          delay:
            min: 1200
            max: 2400
          min-sky-darkness: 5
          only-above-sea-level: true
          only-with-visible-sky: true
          local-difficulty-chance: 3.0
          min-time-since-slept: 72000
          overhead:
            min: 20
            max: 35
            radius: 10
          per-attempt:
            min: 1
            max: -1
        burn-in-light: 0
        burn-in-daylight: true
        ignore-players-with-torch: false
        flames-on-swoop: false
        takes-damage-from-water: false
        always-drop-exp: false
        size:
          min: 0
          max: 0
      pig:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 10.0
        give-saddle-back: false
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      piglin:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 16.0
        bypass-mob-griefing: false
        takes-damage-from-water: false
        portal-spawn-modifier: 2000
        always-drop-exp: false
      piglin_brute:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 50.0
        takes-damage-from-water: false
        always-drop-exp: false
      pillager:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 24.0
        bypass-mob-griefing: false
        takes-damage-from-water: false
        always-drop-exp: false
      polar_bear:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 30.0
        breedable-item: ''
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      pufferfish:
        ridable: false
        controllable: true
        attributes:
          max_health: 3.0
        takes-damage-from-water: false
        always-drop-exp: false
      rabbit:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 3.0
        spawn-toast-chance: 0.0
        spawn-killer-rabbit-chance: 0.0
        breeding-delay-ticks: 6000
        bypass-mob-griefing: false
        takes-damage-from-water: false
        always-drop-exp: false
      ravager:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 100.0
        bypass-mob-griefing: false
        takes-damage-from-water: false
        griefable-blocks:
        - minecraft:oak_leaves
        - minecraft:spruce_leaves
        - minecraft:birch_leaves
        - minecraft:jungle_leaves
        - minecraft:acacia_leaves
        - minecraft:dark_oak_leaves
        - minecraft:beetroots
        - minecraft:carrots
        - minecraft:potatoes
        - minecraft:wheat
        always-drop-exp: false
      salmon:
        ridable: false
        controllable: true
        attributes:
          max_health: 3.0
        takes-damage-from-water: false
        always-drop-exp: false
      sheep:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 8.0
        breeding-delay-ticks: 6000
        bypass-mob-griefing: false
        takes-damage-from-water: false
        always-drop-exp: false
        jeb-shear-random-color: false
      shulker:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 30.0
        takes-damage-from-water: false
        spawn-from-bullet:
          base-chance: 1.0
          require-open-lid: true
          nearby-range: 8.0
          nearby-equation: (nearby - 1) / 5.0
          random-color: false
        change-color-with-dye: false
        always-drop-exp: false
      silverfish:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 8.0
        bypass-mob-griefing: false
        takes-damage-from-water: false
        always-drop-exp: false
      skeleton:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
        takes-damage-from-water: false
        always-drop-exp: false
        head-visibility-percent: 0.5
        feed-wither-roses: 0
        bow-accuracy: 14 - difficulty * 4
      skeleton_horse:
        ridable-in-water: true
        can-swim: false
        attributes:
          max_health:
            min: 15.0
            max: 15.0
          jump_strength:
            min: 0.4
            max: 1.0
          movement_speed:
            min: 0.2
            max: 0.2
        takes-damage-from-water: false
        always-drop-exp: false
      slime:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: size * size
          attack_damage: size
        takes-damage-from-water: false
        always-drop-exp: false
      snow_golem:
        ridable: false
        ridable-in-water: false
        controllable: true
        leave-trail-when-ridden: false
        attributes:
          max_health: 4.0
        drop-pumpkin-when-sheared: true
        pumpkin-can-be-added-back: false
        min-shoot-interval-ticks: 20
        max-shoot-interval-ticks: 20
        snow-ball-modifier: 10.0
        attack-distance: 1.25
        bypass-mob-griefing: false
        takes-damage-from-water: true
        always-drop-exp: false
      squid:
        ridable: false
        controllable: true
        attributes:
          max_health: 10.0
        immune-to-EAR: true
        water-offset-check: 0.0
        can-fly: false
        takes-damage-from-water: false
        always-drop-exp: false
      spider:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 16.0
        takes-damage-from-water: false
        always-drop-exp: false
        can-climb-world-border: true
      stray:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
        takes-damage-from-water: false
        always-drop-exp: false
      strider:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
        breeding-delay-ticks: 6000
        give-saddle-back: false
        takes-damage-from-water: true
        always-drop-exp: false
      tadpole:
        ridable: false
        ridable-in-water: false
        controllable: true
      trader_llama:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health:
            min: 15.0
            max: 30.0
          jump_strength:
            min: 0.5
            max: 0.5
          movement_speed:
            min: 0.175
            max: 0.175
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      allay:
        ridable: false
        ridable-in-water: false
        controllable: true
        respect-nbt: []
      axolotl:
        ridable: false
        controllable: true
        attributes:
          max_health: 14.0
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      bat:
        ridable: false
        ridable-in-water: false
        controllable: true
        ridable-max-y: 320.0
        attributes:
          max_health: 6.0
        takes-damage-from-water: false
        always-drop-exp: false
      bee:
        ridable: false
        ridable-in-water: false
        controllable: true
        ridable-max-y: 320.0
        attributes:
          max_health: 10.0
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        can-work-at-night: false
        can-work-in-rain: false
        always-drop-exp: false
        dies-after-sting: true
      blaze:
        ridable: false
        ridable-in-water: false
        controllable: true
        ridable-max-y: 320.0
        attributes:
          max_health: 20.0
        takes-damage-from-water: true
        always-drop-exp: false
      cat:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 10.0
        spawn-delay: 1200
        scan-range-for-other-cats:
          swamp-hut: 16
          village: 48
        breeding-delay-ticks: 6000
        default-collar-color: RED
        takes-damage-from-water: false
        always-drop-exp: false
      cave_spider:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 12.0
        takes-damage-from-water: false
        always-drop-exp: false
      chicken:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 4.0
        retaliate: false
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      cod:
        ridable: false
        controllable: true
        attributes:
          max_health: 3.0
        takes-damage-from-water: false
        always-drop-exp: false
      cow:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 10.0
        feed-mushrooms-for-mooshroom: 0
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        naturally-aggressive-to-players:
          chance: 0.0
          damage: 2.0
        always-drop-exp: false
      creeper:
        encircle-target: false
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
        naturally-charged-chance: 0.0
        allow-griefing: true
        bypass-mob-griefing: false
        takes-damage-from-water: false
        explode-when-killed: false
        health-impacts-explosion: false
        always-drop-exp: false
        head-visibility-percent: 0.5
      dolphin:
        ridable: false
        controllable: true
        spit:
          cooldown: 20
          speed: 1.0
          damage: 2.0
        attributes:
          max_health: 10.0
        disable-treasure-searching: false
        takes-damage-from-water: false
        naturally-aggressive-to-players-chance: 0.0
        always-drop-exp: false
      donkey:
        ridable-in-water: false
        attributes:
          max_health:
            min: 15.0
            max: 30.0
          jump_strength:
            min: 0.5
            max: 0.5
          movement_speed:
            min: 0.175
            max: 0.175
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      drowned:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
          spawn_reinforcements: 0.1
        jockey:
          only-babies: true
          chance: 0.05
          try-existing-chickens: true
        takes-damage-from-water: false
        can-break-doors: false
        always-drop-exp: false
      elder_guardian:
        ridable: false
        controllable: true
        attributes:
          max_health: 80.0
        takes-damage-from-water: false
        always-drop-exp: false
      ender_dragon:
        ridable: false
        ridable-in-water: false
        controllable: true
        ridable-max-y: 320.0
        attributes:
          max_health: 200.0
        always-drop-full-exp: false
        bypass-mob-griefing: false
        takes-damage-from-water: false
        can-ride-vehicles: false
      enderman:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 40.0
        allow-griefing: true
        can-despawn-with-held-block: false
        bypass-mob-griefing: false
        takes-damage-from-water: true
        aggressive-towards-endermites: true
        aggressive-towards-endermites-only-spawned-by-player-thrown-ender-pearls: false
        ignore-players-wearing-dragon-head: false
        disable-player-stare-aggression: false
        ignore-projectiles: false
        always-drop-exp: false
      endermite:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 8.0
        takes-damage-from-water: false
        always-drop-exp: false
      evoker:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 24.0
        bypass-mob-griefing: false
        takes-damage-from-water: false
        always-drop-exp: false
      fox:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 10.0
        tulips-change-type: false
        breeding-delay-ticks: 6000
        bypass-mob-griefing: false
        takes-damage-from-water: false
        always-drop-exp: false
      frog:
        ridable: false
        ridable-in-water: false
        controllable: true
        ridable-jump-height: 0.6499999761581421
        breeding-delay-ticks: 6000
      ghast:
        ridable: false
        ridable-in-water: false
        controllable: true
        ridable-max-y: 320.0
        attributes:
          max_health: 10.0
        takes-damage-from-water: false
        always-drop-exp: false
      giant:
        ridable: false
        ridable-in-water: false
        controllable: true
        movement-speed: 0.5
        attack-damage: 50.0
        attributes:
          max_health: 100.0
        step-height: 2.0
        jump-height: 1.0
        have-ai: false
        have-hostile-ai: false
        takes-damage-from-water: false
        always-drop-exp: false
      glow_squid:
        rainglow-mode: rainbow
        ridable: false
        controllable: true
        attributes:
          max_health: 10.0
        can-fly: false
        takes-damage-from-water: false
        always-drop-exp: false
      goat:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 10.0
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      guardian:
        ridable: false
        controllable: true
        attributes:
          max_health: 30.0
        takes-damage-from-water: false
        always-drop-exp: false
    hunger:
      starvation-damage: 1.0
    ridable-settings:
      babies-are-ridable: true
      untamed-tamables-are-ridable: true
      use-night-vision: false
    settings:
      entity:
        shared-random: true
    gameplay-mechanics:
      milk-clears-beneficial-effects: true
      mob-effects:
        health-regen-amount: 1.0
        minimal-health-poison-amount: 1.0
        poison-degeneration-amount: 1.0
        wither-degeneration-amount: 1.0
        hunger-exhaustion-amount: 0.004999999888241291
        saturation-regen-amount: 1.0
      mob-spawning:
        village-cats: default
        raid-patrols: default
        phantoms: default
        wandering-traders: default
        village-sieges: default
        ignore-creative-players: false
      player:
        burp-delay: 10
        netherite-fire-resistance:
          duration: 0
          amplifier: 0
          ambient: false
          show-particles: false
          show-icon: true
        idle-timeout:
          kick-if-idle: false
          tick-nearby-entities: true
          count-as-sleeping: false
          update-tab-list: false
          mobs-target: true
        spawn-invulnerable-ticks: 60
        invulnerable-while-accepting-resource-pack: false
        exp-dropped-on-death:
          equation: expLevel * 7
          maximum: 100
        teleport-if-outside-border: false
        totem-of-undying-works-in-inventory: false
        fix-stuck-in-portal: false
        one-punch-in-creative: false
        sleep-ignore-nearby-mobs: false
        can-skip-night: true
        critical-damage-multiplier: 1.5
        burp-when-full: false
        armor-click-equip:
          allow-hot-swapping: false
          creative-makes-copy: true
        ridable-in-water: false
        curse-of-binding:
          remove-with-weakness: false
        shift-right-click-repairs-mending-points: 0
        exp-pickup-delay-ticks: 2
        allow-void-trading: true
      projectile-offset:
        bow: 1.0
        crossbow: 1.0
        egg: 1.0
        ender-pearl: 1.0
        throwable-potion: 1.0
        trident: 1.0
        snowball: 1.0
      projectile-damage:
        snowball: -1
      shovel-turns-block-to-grass-path:
      - minecraft:coarse_dirt
      - minecraft:dirt
      - minecraft:grass_block
      - minecraft:mycelium
      - minecraft:podzol
      - minecraft:rooted_dirt
      silk-touch:
        enabled: false
        spawner-name: <reset><white>Spawner
        minimal-level: 1
        spawner-lore:
        - Spawns a <mob>
        tools:
        - minecraft:iron_pickaxe
        - minecraft:golden_pickaxe
        - minecraft:diamond_pickaxe
        - minecraft:netherite_pickaxe
      armorstand:
        step-height: 0.0
        set-name-visible-when-placing-with-custom-name: false
        fix-nametags: false
        can-movement-tick: true
        can-move-in-water: true
        can-move-in-water-over-fence: true
        place-with-arms-visible: false
      arrow:
        movement-resets-despawn-counter: true
      use-better-mending: false
      always-tame-in-creative: false
      boat:
        eject-players-on-land: false
        do-fall-damage: true
      disable-drops-on-cramming-death: false
      entities-can-use-portals: true
      entities-pick-up-loot-bypass-mob-griefing: false
      fireballs-bypass-mob-griefing: false
      impose-teleport-restrictions-on-gateways: false
      milk-cures-bad-omen: true
      note-block-ignore-above: false
      persistent-tileentity-display-names-and-lore: false
      persistent-droppable-entity-display-names: false
      projectiles-bypass-mob-griefing: false
      tick-fluids: true
      entity-blindness-multiplier: 1.0
      trident-loyalty-void-return-height: 0.0
      void-damage-height: -64.0
      void-damage-dealt: 4.0
      raid-cooldown-seconds: 0
      animal-breeding-cooldown-seconds: 0
      mobs-ignore-rails: false
      rain-stops-after-sleep: true
      thunder-stops-after-sleep: true
      mob-last-hurt-by-player-time: 100
      daylight-cycle-ticks:
        daytime: 12000
        nighttime: 12000
      drowning:
        air-ticks: 300
        ticks-per-damage: 20
        damage-from-drowning: 2.0
      elytra:
        damage-per-second: 1
        damage-multiplied-by-speed: 0.0
        ignore-unbreaking: false
        damage-per-boost:
          firework: 0
          trident: 0
        kinetic-damage: true
      infinity-bow:
        works-without-arrows: false
        normal-arrows: true
        spectral-arrows: false
        tipped-arrows: false
      item:
        immune:
          cactus: []
          explosion: []
          fire: []
          lightning: []
        shears:
          damage-if-sprinting: false
          sprinting-damage: 1.0
        ender-pearl:
          damage: 5.0
          cooldown: 20
          creative-cooldown: 20
          endermite-spawn-chance: 0.05000000074505806
        glow_berries:
          eat-glow-duration: 0
        shulker_box:
          drop-contents-when-destroyed: true
        compass:
          holding-shows-bossbar: false
        snowball:
          extinguish:
            fire: false
            candles: false
            campfires: false
      halloween:
        force: false
        head-chance: 0.25
      entity-lifespan: 0
      entity-left-handed-chance: 0.05000000074505806
      minecart:
        max-speed: 0.4
        place-anywhere: false
        powered-rail:
          boost-modifier: 0.06
        controllable:
          enabled: false
          step-height: 1.0
          hop-boost: 0.5
          fall-damage: true
          base-speed: 0.1
          block-speed:
            grass_block: 0.3
            stone: 0.5
  # 添加這項僅僅是為了修復Mojang不願修復的內容缺陷：避免enderman的指數爆炸增長。
  # 該項有可能影響遊玩體驗，也可能沒有影響。
  world_the_end:
    mobs:
      enderman:
        can-despawn-with-held-block: true
```

## How to analyse profile reports ?

如果你在 `服務端核心` 處於 `laggy` 狀態的時候進行 `采樣`，那麽結論往往是：`tick entity` 和 `tick chunk` 將占據最多的 `計算量`。

對於 `tick chunk` 而言，你能做的事情其實很有限。

> 可以通過修改 `tick-per` 中的 `monter-spawn` 來大幅度減少 `tick chunk` 的 `計算量`。
>
> 但這麽做取決於你的需求。

對於 `tick entity` 而言，你需要根據 `報告` 所指出的 `異常指標` ，對 `behavior` 和 `sensor` 進行調整。

> 這裏列出幾個需要特別註意的實體：`villager`， `zombified_piglin`， `illager`
>
> > 對於 `villager` 而言，可以通過修改 `acquirepoi` 來顯著地減少計算量，但這會導致 `尋路算法` 的執行頻率降低。
> >
> > 而 `validatenearbypoi` 會影響對 `工作方塊` 的 `識別速度`。
> >
> > 如果此時有多個 `劫掠塔` 在運行，則可以發現 `victorystroll` 的計算量顯著上升。
> >
> > 如果你希望 `runone` 的平均值降低，則可以修改 `dab` 或者 `lagging-threshold`，但是這將會影響 `villager` 的 `全部的` `behavior` 和 `sensor`。
> >
> > 一般不建議這麽做。
> >
> > > 請註意，`某個entity的gravity計算` 是包括在 `該entity的AI計算` 之中的。
> > >
> > > `entity` 有自己 `內置的tick` 來進行 `AI計算`，它不受 `外部的tick` 影響。
>
> > 對於 `zombified_piglin` 而言，主要是2個原因導致 `計算量` 偏高。
> >
> > - 聯動仇恨
> > - 高刷怪效率
> >
> > 即使 `zombified_piglin` 被 `高效率地處置`，仍然會 `持續占據` 這部分 `計算量`。
> >
> > > Paper早已修復了由於 `player` 跨越 `dimension` 使得 `zombified_pigin` 因為 `raytrace` 錯誤計算而導致的 `追蹤射線沿途的大量區塊被錯誤地加載` 造成的卡頓問題。
> > >
> > > 對於 `bee` 來說，曾經也存在類似的問題，但目前已經被修復。
>
> > 對於 `illeger` 來說，情況和 `zombified_piglin` 類似。
> >
> > 區別在於 `單座劫掠塔` 一般比 `單座豬人塔` 的 `刷怪效率更低`，而且 `刷怪效率` 呈現 `鋸齒形波動`。
> >
> > > 如果你只看到了 `pillager` 偏高，那麽原因可能是其在野外環境的 `自然生成` 占用 `計算量`，該BUG可以通過升級版本修復。

> 關於 `性能采樣器`，這裏使用 `Timings v2` 進行性能分析（這是Paper所提供的）。
>
> 如果你使用的是Purpur，那麽非常建議你使用 `Spark` 進行分析，它比 `Timings v2` 更加優秀。
>
> - 更美觀的UI
> - 更易讀的報表
> - 更好的性能
> - 更細的采樣粒度

> `Plugins` 不應當占據過多的 `計算量`。如果某個 `Plugin` 占據了太多計算量，那麽你應該考慮棄用它，或者選擇一個替代品。
>
> 並不是所有的開發者都會在編寫代碼的時候，時刻關註高性能。

> `Player實體` 並不真正地占用 `計算量`，他們甚至不如 `Villager實體` 占用的 `計算量` 高。
>
> `Entity` 占用計算量的真實原因是，他們需要為 `AI計算 ` 付出 `高額的代價` （往往的 `尋路算法`，也包括部分敏感的 `傳感器 (Sensor)`）。
>
> 單個 `Entity` 越聰明，則占用的 `計算量` 越大。（毫無疑問，`Villager` 是最聰明的實體，此外，`Zombie 族` 實體由於存在 `與Villager的威脅關聯`，所以其 AI計算也會比其他實體更高）

> `Tile Entity` 占用的 `計算量` 遠少於 `Entity`。
>
> 盡管 Paper 針對 `hopper` 有優化算法，但是由於 `hopper` 的數量一般較多，在報告結果中，`hopper` 仍然可能是 `計算量` 最高的 `Tile Entity`。
>
> `Chest` ，`Furnace` 和 `Sign` 對 `計算量` 的占用極小，但是他們的渲染可能會導致客戶端卡頓。
>
> `Observer` 以及 `單純的時鐘電路` 並不占用多少 `計算量`，一般取決於這個結構的 `輸出端` 在做什麽。
>
> 但 `Piston` ，特別是 `Sticky Piston` 則非常占用 `計算量`。
>
> > 這是因為他們每次的 `激活` 與 `失活` 均會造成 `方塊更新`，同時會產生 `Moving-Piston` 這個 `Tile Entity`

> 通過使用擁有更高睿頻和IPC的CPU雖然對提升性能有所幫助，但性價比極低。
>
> `Vanilla` 從一開始就沒有考慮過 `多線程任務`，並且也不是針對 `multi-player games` （個位數以上的玩家）設計的。 
>
> 後續的核心很難在維持 `Vanilla` 的同時，實現 `多線程任務`。
>
> 大部分情況下，`CPU的利用率` 僅僅維持在 `5-15%` 之間。

> 這裏提供一個有效且相對可以接受的軟件解決思路：
>
> 根據 `上下文` 來選擇性地限製 `實體` 的 `行為` 和 `傳感器`。
>
> > 目前已經有一些 `插件方案` 使用這個思路，盡管他們使用的 `具體策略` 不同。
> >
> > 對性能的優化較為顯著甚至明顯，但對 `vanilla` 的破壞較少。
> >
> > > 比較有知名度的 `anti-villager` 沒有考慮上下文和控製粒度，但實際上 `villager` 的控製粒度可以更細。
> > >
> > > 而 `farm-limiter` 雖然很早就使用該思路，但是對 `上下文` 的判定選項不夠精準。

## How to choose plugins ?

這個章節不太應該屬於本文，這裏選擇僅討論一小部分的 `Anti-Cheat` 。

對於 `plugin` 選擇，一般考慮：

- 功能足夠簡單，但滿足需求
- 可配置度高
- 沒有造成卡頓的Events

> 這兩個原則大部分情況是對的：
>
> - 服務端核心可以做的事情，不要用插件。
> - 1個插件可以做的事情，不要用2個插件去完成。
>
> 難以遵守這兩個原則的主要原因是：維護者自己根本不清楚 `core` 和 `plugin` 到底有什麽職責。

### Anti-Cheat Review

> `bypass` 是不可避免的，這是協議的缺陷。

- NCP：開源，最好搭配其他AC使用，適合魔改。
- Vulcan：較高的可配置性，適合Survival，默認不啟用setback。（已經有full-bypass了）
- Matrix：開箱即用，配置比Vulcan簡單，Movement和Timer沒什麽問題，Premium版新增對Scaffold的額外檢測，但KillAura檢測存在缺陷。
- Spartan：不推薦，`FP` 和 `FN` 指標都不好看。 
- GrimAC：值得嘗試，開源，對Reach，Movement，Timer的檢測精度較高，但Scaffold檢測存在缺陷。
- Intave：看需求，可能不適合Survival，目前存在較多的致命FP尚未解決。但是對於Mini-Game是合適的。

