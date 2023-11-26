- WordPress基础搭建笔记

- - 搭建环境

  - - 虚拟主机 or VPS or 云服务器

    - WordPress官网下载最新的源码文件（若使用VPS，则可直接下载“宝塔软件”）

    - - MySQL
      - Php

  - WordPress基础设置

  - - 自定义设置

    - 插件

    - - **Jetpack：综合性插件**

      - **WP Super Cache：官方的缓存插件。（需要WP设置固定化的结构链接）**

      - LiteSpeed：全方面的综合性缓存插件。（免费CDN）

      - **WP User Avatar：官方的用户头像插件。（头像系统）**

      - - **与Ultimate Member配合使用：解决 匿名用户 的默认头像显示错误问题。（匿名用户会默认显示Gravatar头像）**

        - - **匿名评论：显示WP User Avatar设置的默认头像**
          - **未登录但输入了 用户名 和 邮箱的评论：若邮箱在Ultimate Member有注册，则显示Ultimate Member的对应头像。否则显示Ultimate Member的默认头像。**
          - **登陆后的评论：显示Ultimate Member的头像**

      - **Ultimate Member：用户注册和管理插件。（用户系统）**

      - **WP Mail：发送邮箱的插件。（邮件系统）**

      - - **可搭配Ultimate Member使用。给用户发送邮箱**

      - **经典编辑器：回归经典WP编辑器（编辑器系统）**

      - **Google Font Fix：修复国内Google字体访问错误，修复Webfont.js加载错误（修复webfont.js加载失败）**

      - Super RSS Reader：比WordPress自带的RSS更好的RSS小组件。（可选。也可自己修改官方原版Rss的源码）

      - - 也可以自己修改WordPress源码，修改默认的RSS组件。

      - Enlighter：支持多种编程语言的代码高亮插件。（多编程语言代码高亮）

      - Wise Chat：多人即时在线聊天插件。

      - WP [Editor.MD](http://Editor.MD)：支持Markdowny语法。（评论区+文章编写+实时预览）

      - Show User-Agent：评论区显示评论者的浏览器信息。（地理位置+浏览器版本+操作系统版本）

      - **Scrollbar by webxapp：自定义网页侧边的“滚动条样式”（网页侧边进度条）**

      - Automatic Page Load Progress Bar：显示"网页加载中的进度条"。（网页加载进度条）

      - WP Snow – Best Snow Effect Plugin：为网站增加“飘落雪花特效”

      - Snow Storm: 纯白色的飘雪插件。

      - 明月浩空（MYHK）HTML5音乐播放器插件：完善的HTML5播放器。

      - - 后台管理地址：https://myhkw.cn/admin/#/user/userinfo

    - 用户

    - - 用户注册插件
      - 头像：媒体库中添加Bilibili和Taptap的默认头像

    - 页面

    - - **飘落特效**

      - - **花瓣**
        - **雪花**

      - **标签切换动态Title**

      - - 见下方

      - **网站公告栏信息**

      - - 见下方

      - **Live2D-Widget 看板娘**

      - - 见Gitee仓库

    - 鼠标

    - - 鼠标点击特效：

      - - 见下方

      - 鼠标样式更改：在主题的额外css中修改默认cursor文件

    - 功能

    - - 留言板
      - **浮动人物（Live2D）**
      - **自定义滚动条**
      - 表情包（OwO表情包插件）

    - 主题

    - - **BoxStyle**

  - WordPress进阶设置

  - - 去除WordPress原始主题 或者 自定义主题的 Google字体。
    - 去除WordPress的主页面的dns-prefetch预解析。
    - 去除window._wpemojiSettings。

  - 网站备案

  - - 个人备案

    - - 所需材料

      - - 身份证
        - 居住证（本省备案不需要）

  - 优化

  - - DNS Prefech标签

  - 页脚

  - - **百度统计/Google统计 - 脚本**
    - 萌国ICP备案
    - 十年之约
    - JS Deliver

  - 其他相关服务

  - - CDN加速
    - OSS存储
    - SSL证书

\* 鼠标点击特效: 将下面代码复制到**外观-主题编辑器-主题页脚(footer.php)**代码<?php wp_footer(); ?>上方。

<!-- 鼠标点击特效 -->

<canvas class="fireworks" style="position:fixed;left:0;top:0;z-index:99999999;pointer-events:none;"></canvas>

<script type="text/javascript" src="/wp-content/themes/extra/djtx.js"></script>

\* 动态修改Title: 

<!-- 标签页切换动态标题 -->

<script>

​    var global_Title = document.title;

​    function checkVisibilityStateAndChangeTitle() {

​        if(document.visibilityState=='hidden'){

​            document.title='> Locked.';}

​        else{document.title=global_Title;}

​    }

​    

</script>

<script>document.addEventListener('visibilitychange',function(){checkVisibilityStateAndChangeTitle();});</script>

<script>document.addEventListener("readystatechange", function () { if(document.readyState === 'complete'){

​        checkVisibilityStateAndChangeTitle();

​    } });</script>

<!-- 自定义公告栏 -->

<script>

​    document.addEventListener('DOMContentLoaded', initNotice2);

​    function initNotice2() {

​        const common = {

​            loadResource: function(id, resource, type) {

​                return new Promise(function(resolve, reject) {

​                    let loaded = document.head.querySelector('#' + id);

​                    if (loaded) {

​                        resolve('success: ' + resource);

​                        return;

​                    }

​                    const element = document.createElement(type);

​                    element.onload = element.onreadystatechange = () => {

​                        if (!loaded && (!element.readyState || /loaded|complete/.test(element.readyState))) {

​                            element.onload = element.onreadystatechange = null;

​                            loaded = true;

​                            resolve('success: ' + resource);

​                        }

​                    }

​                    element.onerror = function() {

​                        reject(Error(resource + ' load error!'));

​                    };

​                    if (type === 'link') {

​                        element.rel = 'stylesheet';

​                        element.href = resource;

​                    } else {

​                        element.src = resource;

​                    }

​                    element.id = id;

​                    document.getElementsByTagName('head')[0].appendChild(element);

​                });

​            },

​            loadResources: function() {

​                const initVue = this.initVue;

​                const loadResource = this.loadResource;

​                const host = '//s0.pstatp.com/cdn/expire-1-M/';

​                const resources = [

​                    'vue/2.6.10/vue.min.js',

​                    'element-ui/2.8.2/index.js',

​                    'element-ui/2.8.2/theme-chalk/index.css'

​                ];

​                const loadPromises = [];

​                resources.forEach(resource => {

​                    loadPromises.push(loadResource(btoa(resource).replace(/[=+\/]/g, ''), host + resource,

​                        ({

​                            'css': 'link',

​                            'js': 'script'

​                        })[resource.split('.').pop()]

​                    ));

​                });

​                Promise.all(loadPromises).then(

​                    function() {

​                        let flag = false;

​                        const waitVue = setInterval(() => {

​                            if (!flag && typeof Vue === 'function') {

​                                flag = true;

​                                initVue();

​                                clearInterval(waitVue);

​                            }

​                        }, 100);

​                    }

​                );

​            },

​            initVue: function() {

​                var blog = new Vue({

​                    el: document.createElement('div'),

​                    created() {

​                        this.sayHello();

​                        window.alert = this.alert;

​                    },

​                    computed: {

​                        hello: function() {

​                            var hours = (new Date()).getHours()

​                            var t

​                            if (hours < 5) {

​                                t = '凌晨了，注意休息哦！'

​                            } else if (hours >= 5 && hours < 8) {

​                                t = '早上好，新的一天又是元气满满呢！'

​                            } else if (hours >= 8 && hours < 12) {

​                                t = '上午好！'

​                            } else if (hours === 12) {

​                                t = '中午好！'

​                            } else if (hours > 12 && hours <= 18) {

​                                t = '下午好！'

​                            } else if (hours > 18 && hours <= 22) {

​                                t = '晚上好！'

​                            } else if (hours > 22 && hours < 24) {

​                                t = '夜深了，注意休息哦！'

​                            }

​                            return t

​                        }

​                    },

​                    methods: {

​                        alert: function(message, title, type, duration, showClose, offset, onClose) {

​                            if (duration !== 0) {

​                                duration = 4500;

​                            }

​                            this.$notify({

​                                message: message,

​                                type: type || 'error',

​                                title: title || '警告',

​                                duration: duration,

​                                showClose: showClose || false,

​                                offset: offset || 0,

​                                onClose: onClose

​                            })

​                        },

​                        sayHello: function() {

​                            setTimeout(() => {

​                                this.alert('欢迎来到 樱之森！', this.hello, 'success');

​                            }, 1000);

​                        }

​                    },

​                })

​            }

​        };

​        common.loadResources();

​    }

</script>