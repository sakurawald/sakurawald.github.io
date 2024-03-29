---
title: "[JSP] Servlet & JSP Short-Hand"
type: 'tags'
tags:
  - web
  - jsp
id: '58129'
date: 2022-06-13 11:00:00
---

{% raw %}

<h1>Servlets &amp; JSP Short-hand</h1>
<div contenteditable="true" spellcheck="false" class="mathjax-block md-end-block md-math-block md-rawblock" id="mathjax-n2" cid="n2" mdtype="math_block" data-math-tag-before="0" data-math-tag-after="0" data-math-labels="[]"><div class="md-rawblock-container md-math-container" tabindex="-1"><mjx-container class="MathJax" jax="SVG" display="true" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="2.968ex" height="2.828ex" role="img" focusable="false" viewBox="0 -972 1312 1250" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -0.629ex;" class="in-text-selection"><defs><path id="MJX-1-TEX-N-40" d="M56 347Q56 429 86 498T164 612T270 680T386 705Q522 705 622 603T722 349Q722 126 608 126Q541 126 513 176Q512 177 512 179T510 182L509 183Q508 183 503 177T487 163T464 146T429 132T385 126Q311 126 251 186T190 347Q190 448 251 508T385 568Q426 568 460 548T509 511T531 479H555Q580 479 582 478Q586 477 587 468Q588 454 588 338V260Q588 200 593 182T619 163Q641 163 655 178T674 223T680 273T682 325V330Q682 426 647 500Q611 569 544 618T388 668Q271 668 184 577T96 347Q96 216 180 121T396 26Q421 26 446 28T493 34T535 43T573 52T605 63T629 72T647 80T657 84H716Q722 78 722 74Q722 65 675 45T547 7T392 -11Q255 -11 156 90T56 347ZM274 347Q274 266 308 214T390 162Q420 162 449 182T498 235L504 245V449L498 459Q453 532 387 532Q347 532 311 483T274 347Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="menclose"><g transform="translate(267, 0)"><g data-mml-node="mstyle"><g data-mml-node="TeXAtom" data-mjx-texclass="ORD"><g data-mml-node="TeXAtom" data-mjx-texclass="ORD"><g data-mml-node="mo"><use data-c="40" xlink:href="#MJX-1-TEX-N-40"></use></g></g></g></g></g><rect x="33.5" y="-244.5" width="1245" height="1183" fill="none" stroke-width="67"></rect></g></g></g></svg></mjx-container></div></div>
<p>&nbsp;</p>
<h2>Servlet</h2>
<h3>Register a servlet</h3>
<pre><code class="language-xml" lang="xml">&lt;web-app ...&gt;
    &lt;servlet&gt;
        &lt;servlet-name&gt;This Is Your Custom Servet Name&lt;/servlet-name&gt;
        &lt;servlet-class&gt;com.sakurawald.MyServlet&lt;/servlet-class&gt;
    &lt;/servlet&gt;   

    &lt;servlet-mapping&gt;
        &lt;serlvet-name&gt;This Is Your Custom Servet Name&lt;/serlvet-name&gt;
        &lt;url-pattern&gt;/some_url_you_want_to_map&lt;/url-pattern&gt;
    &lt;/servlet-mapping&gt;    
&lt;/web-app&gt;
</code></pre>
<h3>Life-cycle</h3>
<p><code>Servlet生命周期</code></p>
<ul>
<li>servlet类加载</li>
<li>servlet实例化</li>
<li>servlet#init</li>
<li>servlet#service</li>
<li>servlet#destroy</li>

</ul>
<h3>A simple servlet demo</h3>
<pre><code class="language-java" lang="java">import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class Ch2Servlet extends HttpServlet {
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        out.println("&lt;a&gt;hello world&lt;/a&gt;");
    }

}
</code></pre>
<p>&nbsp;</p>
<h2>MVC</h2>
<blockquote><p>Servlet只运行自己的业务代码，然后调用一个特定的JSP处理响应HTML，这就能把 <code>业务逻辑</code> 与 <code>表示</code> 相分离。</p>
<p>而采用MVC，不仅要求 <code>业务逻辑</code> 与 <code>表示</code> 相分离，实际上，<code>业务逻辑</code> 根本不知道有 <code>表示</code> 的 存在。</p>
</blockquote>
<p>MVC的组成部分：</p>
<ul>
<li>Model (模型)：包含具体的 <code>业务逻辑</code> 和 <code>状态</code>。</li>
<li>View (视图)：负责进行 <code>表示</code>。</li>
<li>Controller (控制器)：从 <code>请求</code> 获得 <code>用户输入</code>，并明确这些输入对 <code>模型</code> 有什么影响。</li>

</ul>
<p>&nbsp;</p>
<p>Misc</p>
<ul>
<li>容器为 <code>Web应用</code> 提供了 <code>通信支持</code>，<code>生命周期管理</code>， <code>多线程支持</code>， <code>声明方式安全</code>， 以及 <code>JSP支持</code></li>
<li>容器根据 <code>URL</code> 查找 <code>正确的Servlet</code>，并把 <code>请求</code> 传递给该Servlet</li>

</ul>
<hr>
<pre><code class="language-java" lang="java">// src/com/example/web/BeerServlet.java
package com.example.web;

import com.example.model.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class BeerServlet extends HttpServlet {
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        
        String c = request.getParameter("color");
        BeerExpert be = new BeerExpert();
        List result = be.getBrands(c);
        
        reqeust.setAttribute("styles", result);
        RequestDispatcher view = request.getRequestDispatcher("result.jsp");
        view.forward(request, response);
    }

}
</code></pre>
<pre><code class="language-jsp" lang="jsp">// result.jsp
&lt;%@ page import="java.util.*" %&gt;

&lt;html&gt;
    &lt;body&gt;
        &lt;h1 align="center"&gt;
            Beer Recommendations JSP
        &lt;/h1&gt;
        &lt;p&gt;
            
            &lt;%
            
                List styles = (List) request.getAttribute("styles");
                Iterator it = styles.iterator();
                while(it.hasNext()) {
                    out.print("&lt;br&gt;try:" + it.next);
                }
    
            %&gt;
            
        &lt;/p&gt;
    &lt;/body&gt;
&lt;/html&gt;
</code></pre>
<h3>Servlet: Request &amp; Response</h3>
<blockquote><p><code>Servet的每个实例...</code> 这种说法是错误的，<code>任何Servlet类</code> 都不会有多个 <code>实例</code>。（除非使用 <code>SingleThreadModel</code>）</p>
<p>否则 <code>容器</code> 运行 <code>多个线程</code> 来处理 <code>对1个Servlet</code> 的 <code>多个请求</code> （准确地说：<code>每个请求</code> 使用 <code>1个线程</code> 来请求 <code>指定的Servlet</code>）</p>
</blockquote>
<blockquote><p>对于 <code>每个Servlet</code>，请在 <code>init()</code> 中进行 <code>初始化操作</code> 而不是 <code>构造器函数</code> 当中。</p>
<p><code>构造器函数</code> 使得 <code>Servlet</code> 具备 <code>Servlet特性 (Servletness)</code>，并获得 <code>作为Servlet所应具有的特权</code>：如 <code>通过ServletContext引用从容器中获取信息</code> 。</p>
<p>所以，请不要在 <code>构造器函数</code> 中过早地进行 <code>初始化操作</code> （在 <code>构造器函数</code> 中我们无法 <code>获得关于Web应用的配置信息等</code>）</p>
</blockquote>
<blockquote><p><code>每个Servlet</code> 都有 <code>自己特有的1个 ServletConfig对象</code>，它可以用于访问 <code>整个App共享的1个ServletContext</code>。</p>
<blockquote><p>注意：<code>ServletContext</code> 更准确得叫法应该叫 <code>AppContext</code>，因为 <code>实际上</code>，<code>每个Web应用</code>  <code>有且仅有</code> 1个 <code>ServletContext</code>  ！！！</p>
<p>这 <code>并不是</code> 你所想的那样：<code>每个Servlet</code> 都有 <code>自己特有的1个 ServletContext</code></p>
<blockquote><p>但是：<code>每个Servlet</code> 确确实实有 <code>自己特有的1个 ServletConfig</code> ！！！！！</p>
</blockquote>
</blockquote>
</blockquote>
<blockquote><pre><code class="language-mermaid" lang="mermaid">classDiagram

class ServletRequest{
   +Object getAttribute(String)
   +String getParamterer(String)
   +Enumeration getParameterNames()

}
class ServletResponse{
		+ServletOutputStream getOutputStream()
		+PrintWriter getWriter()
	}
	ServletRequest &lt;|-- HttpServletRequest
	class HttpServletRequest {
		+String getContextPath()
		+Cookie[] getCookies()
		+String getHeader(String)
		+String getQueryString()
		+HttpSession getSession()
		+String getMethod()
	}

	ServletResponse &lt;|-- HttpServletResponse
	class HttpServletResponse {
		+void addCookie(Cookie)
		+void addHeader(String name, String value)
	}
</code></pre>
<blockquote><p>之所以需要有 <code>GenericServlet</code> 以及 <code>HttpServletRequest</code> 和 <code>HttpServletResponse</code> ，是因为 <code>可能会有人</code> 将 <code>Servlet技术模型</code> 用于 <code>其他协议</code> （大概不会有人）。</p>
</blockquote>
</blockquote>
<blockquote><p>Servlet可以处理的 <code>HTTP Methods</code> 包括：<code>GET</code> ，<code>PUT</code>，<code>HEAD</code>，<code>TRACE</code>，<code>OPTIONS</code>，<code>PUT</code>，<code>DELETE</code> 和 <code>CONNECT</code></p>
<p>我们使用 <code>doGet()</code> 来处理 <code>简单请求</code>，而使用 <code>doPost()</code> 来 <code>接收和处理表单数据</code></p>
<figure><table>
<thead>
<tr><th>HTTP Method</th><th>Description</th></tr></thead>
<tbody><tr><td>GET</td><td>要求得到所请求URL上的一个东西 （资源/文件）</td></tr><tr><td>POST</td><td>要求服务器接受 <code>附加到请求体的体信息</code>，并提供 <code>所请求URL上的一个东西</code>。这类似于 <code>附带了额外信息的GET</code></td></tr><tr><td>HEAD</td><td>只要求得到 <code>GET返回结果的首部部分</code>。这类似于 <code>响应中没有体的GET</code></td></tr><tr><td>TRACE</td><td>要求请求消息 <code>回送</code>，这样客户端能够 <code>看到</code> 另一端接收了什么，以便进行调试。</td></tr><tr><td>PUT</td><td>指出要把 <code>所包含的体</code> 放在 <code>请求的URL</code> 上</td></tr><tr><td>DELETE</td><td>指出删除 <code>所请求的URL</code> 上的东西 （资源/文件）</td></tr><tr><td>OPTIONS</td><td>要求得到 <code>一个HTTP Method列表</code>，表明 <code>所请求的URL</code> 可以处理 这些方法</td></tr><tr><td>CONNECT</td><td>要求连接以 <code>建立隧道</code></td></tr></tbody>
</table></figure>
<blockquote><p>关于 <code>幂等性</code>：<code>GET</code> 是 <code>幂等的</code>，但 <code>POST</code> 不是。</p>
</blockquote>
</blockquote>
<blockquote><p><code>表单 FORM</code> 的默认 <code>HTTP METHOD</code> 为 <code>GET</code> ！！！</p>
<p>除非你 <code>手动地</code> 指定为 <code>POST</code></p>
<pre><code class="language-html" lang="html">&lt;form method="POST" action="SelectBeer.do"&gt;
 &lt;p&gt;
     Select beer characteristics
 &lt;/p&gt;
 &lt;select name="color" size="1"&gt;
     &lt;option&gt;light&lt;/option&gt;
     &lt;optoin&gt;amber&lt;/optoin&gt;
     &lt;option&gt;brown&lt;/option&gt;
     &lt;option&gt;dark&lt;/option&gt;
 &lt;/select&gt;

 &lt;center&gt;
 	&lt;input type="SUBMIT"&gt;
 &lt;/center&gt;

&lt;/form&gt;
</code></pre>
<p>同样的，这些 <code>参数</code> 会相应地 <code>通过</code> <code>POST请求中的体信息</code> 和 <code>HttpServetRequest#getParameter(String)</code></p>
<pre><code class="language-javascript" lang="javascript">color=dark&amp;body=heavy
</code></pre>
<pre><code class="language-java" lang="java">public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
 String colorParam = request.getParameter("color");
 String bodyParam = request.getParameter("body");
}
</code></pre>
<blockquote><p>如果试图对 <code>只实现了doPost()的servlet</code> 发送 <code>GET请求</code>，则导致 <code>运行时错误</code>。</p>
<p>如果你想让 <code>某个Servlet</code> 同时支持 <code>GET</code> 和 <code>POST</code> ，则这样做：</p>
<pre><code class="language-java" lang="java">public void doPost(...) throws ...{
 doGet(request, response);   
}
</code></pre>
</blockquote>
<p><code>单个参数</code> 可以有 <code>多个值</code> （比如 <code>Multi-CheckBox</code>），我们需要使用 <code>getParameterValues()</code> 来获取 <code>表示多值的数组</code></p>
<pre><code class="language-java" lang="java">String[] sizes = request.getParameterValues("sizes");
String first_value = request.getParameterValues("sizes")[0];
String second_value = request.getParameterValues("sizes")[1];
</code></pre>
</blockquote>
<blockquote><p><code>HttpServletRequest#getInputStream</code> 用于用于对 <code>POST请求</code> 中包含的 <code>巨大请求体</code> 进行细致处理。</p>
</blockquote>
<blockquote><pre><code class="language-java" lang="java">String forwardsNum = Integer.parseInt(request.getHeader("Max-Forwards"));
// equals to
String fowwardsNum = request.getIntHeader("Max-Forwards");
</code></pre>
</blockquote>
<blockquote><p><code>ServletRequest</code> 的 <code>getLocalPort()</code> 和 <code>getRemotePort()</code> 是相对于 <code>Servlet</code> 的</p>
</blockquote>
<blockquote><p>可以 <code>覆盖 init()</code>  ，且 <code>必须覆盖</code> 1个 <code>服务方法 (doGet(), doPost() ...)</code></p>
</blockquote>
<blockquote><pre><code class="language-mermaid" lang="mermaid">classDiagram
	class Servlet {
		+service(ServletRequest, ServletResponse)
		+init(ServletConfig)
		+destroy()
		+getServletConfig()
	}

	Servlet &lt;|-- GenericServlet
	class GenericServlet {
		+init()
		+getInitParameterNames()
		+getInitParameter(String)
		+getServletContext()
	}
	
	GenericServlet &lt;|-- HttpServlet
	class HttpServlet{
		+service(HttpServletRequest, HttpServiceResponse)
		+doGet(HttpServletRequest, HttpServiceResponse)
		+doPost(HttpServletRequest, HttpServiceResponse)
	}
</code></pre>
</blockquote>
<blockquote><p><code>ServletContext#getResourceAsStream("/bookCode.jar")</code>  中，<code>斜线</code> 代表 <code>Web Application的根目录</code></p>
</blockquote>
<blockquote><p>对于 <code>ServletResponse接口</code> 的 <code>输出流</code>，可以选择 <code>字节流</code> 或者 <code>字符流</code></p>
<pre><code class="language-java" lang="java">// Byte-Stream
ServletOutputStream out = response.getOutputStream();
out.write(aByteArray);
// Character-Stream
PrintWriter out = response.getWriter();
our.println(aString)
</code></pre>
<blockquote><p>你应当猜到，<code>PrintWriter</code> 内部包装了 <code>ServletOutputStream</code>。</p>
</blockquote>
<blockquote><p><code>获取对象的方法名</code> = <code>去掉对象的第一个词</code></p>
</blockquote>
</blockquote>
<blockquote><p><code>重定向 (Redirect)</code> 中 <code>相对路径</code> 和 <code>绝对路径</code>：</p>
<pre><code class="language-java" lang="java">// 用户原来键入: http://www.wickedlysmart.com/myApp/cool/bar.do
response.sendRedirect("foo/stuff.html") // --&gt; http://www.wickedlysmart.com/myApp/cool/foo/stuff.html
response.sendRedirect("/foo/stuff.html") // --&gt; httpL//www.wickedlysmart.com/foo/stuff.html
</code></pre>
<blockquote><p>不能在 <code>写到响应之后 （即响应已提交，也就是响应已经发送给客户端，即数据已刷新到输出流）</code> 再调用 <code>sendRedirect()</code>，否则将获得 <code>IllegalStateException</code></p>
</blockquote>
<blockquote><p><code>重定向 (Redirect)</code> 让 <code>客户端</code> 来完成工作，而 <code>请求分派 (Forward)</code> 让 <code>服务端</code> 来完成工作。</p>
</blockquote>
<blockquote><p>对于 <code>本来已经存在的header</code> 而言，<code>reponse#addHeader</code>  和 <code>response#setHeader</code> 的表现 <code>完全一样</code></p>
</blockquote>
</blockquote>
<h3>Application: Attribute &amp; Listener</h3>
<blockquote><p><code>Servlet属性的作用域</code>：<code>Request</code>，<code>Session</code>，<code>Context</code></p>
</blockquote>
<blockquote><ul>
<li><code>Servlet的初始化参数</code></li>

</ul>
<p><code>每个Servlet</code> 可以有 <code>自己特有的初始化参数 (Initialization-Parameter)</code></p>
<pre><code class="language-xml" lang="xml">&lt;servlet&gt;
    &lt;servlet-name&gt;A Stupid Name&lt;/servlet-name&gt;
    &lt;servlet-class&gt;here.you.should.fill.in.full.class.name&lt;/servlet-class&gt;

    &lt;init-param&gt;
        &lt;param-name&gt;adminEmail&lt;/param-name&gt;
        &lt;param-value&gt;sakurawald@gmail.com&lt;/param-value&gt;
    &lt;/init-param&gt;
&lt;/servlet&gt;
</code></pre>
<pre><code class="language-java" lang="java">// Inside one specific servlet
getServletConfig().getInitParameter("adminEmail");
</code></pre>
</blockquote>
<blockquote><ul>
<li><code>Context的初始化参数</code></li>

</ul>
<pre><code class="language-xml" lang="xml">&lt;web-app ...&gt;
    ...

	&lt;context-param&gt;
		&lt;param-name&gt;adminEmail&lt;/param-name&gt;
	    &lt;param-value&gt;sakurawald@gmail.com&lt;/param-value&gt;
	&lt;/context-param&gt;
&lt;/web-app&gt;
</code></pre>
<pre><code class="language-java" lang="java">// Inside every servelet
getServletContext().getInitParameter("adminEmail");
</code></pre>
</blockquote>
<blockquote><p>不管是 <code>Servlet的初始化参数</code> （对应 <code>ServletConfig</code>） 和 <code>Context的初始化参数</code> （对应 <code>ServletContext</code>），都不提供对 <code>相应的初始化参数的 setInitParameter()</code>。</p>
<p>换句话说，<code>初始化参数</code> 是 <code>部署时常量</code>， 在运行时不可以 <code>重新设置</code>。</p>
</blockquote>
<blockquote><p>默认规定，如果没有 <code>明确地指明</code> 是 <code>servlet的初始化参数</code> 还是 <code>context的初始化参数</code>，则我们 <code>默认</code> <code>初始化参数</code> 是指 <code>servlet的初始化参数</code></p>
</blockquote>
<blockquote><p>可以用 <code>两种方法</code> 获得 <code>ServletContext</code></p>
<pre><code class="language-java" lang="java">this.getServletConfig().getServletContext().getInitParameter();
// or
this.getServletContext().getInitParameter();
</code></pre>
</blockquote>
<p>&nbsp;</p>
<blockquote><ul>
<li><code>ServletContextListener</code></li>

</ul>
<pre><code class="language-xml" lang="xml">&lt;web-app ...&gt;
    &lt;listener&gt;
        &lt;listener-class&gt;com.example.MyServletContextListener&lt;/listener-class&gt;
    &lt;/listener&gt;
&lt;/web-app&gt;
</code></pre>
<pre><code class="language-java" lang="java">public class MyServletContextListener implements ServletContextListener {

    public void contextInitialized(ServletContextEvent event) {
    
        ServletContext sc = event.getServletContext();
    
        String dogBreed = sc.getInitParameter("breed");
        Dog dog = new Dog(dogBreed);
        sc.setAttribute("dog", dog);   
    }
    
    public void contextDestroyed(ServletContextEvent event) {
        // do some clean-up work.
    }

}
</code></pre>
</blockquote>
<blockquote><ul>
<li>Attribute versus Parameter</li>

</ul>
<figure><table>
<thead>
<tr><th>&nbsp;</th><th>Attribute</th><th>parameter</th></tr></thead>
<tbody><tr><td>Type</td><td>Application/Context<br>Request<br>Session</td><td>Application/Context<br>Request<br>Servlet Initialization-Parameter</td></tr><tr><td>Getter</td><td>getAttribute(String name)</td><td>getInitParameter()</td></tr><tr><td>Setter</td><td>setAttribute(String name, Object value)</td><td>DD</td></tr><tr><td>Return Type</td><td>Object</td><td>String</td></tr></tbody>
</table></figure>
</blockquote>
<blockquote><p><code>对Context加锁</code> 而不是 <code>对Servlet加锁</code></p>
<pre><code class="language-java" lang="java">synchronized(getServetContext()) {
 getServletContext().setAttribute("foo", 42);
 out.println(getServletContext().getAttribute("foo"));
}
</code></pre>
</blockquote>
<p>&nbsp;</p>
<h3>Session</h3>
<blockquote><p><code>request.getSession()</code> 会在 <code>之前没有存在会话</code> 时， <code>自动地</code> 创建 <code>新会话</code></p>
<pre><code class="language-java" lang="java">HttpSession session = request.getSession();
if (session.isNew()) {
 ...
}
</code></pre>
<blockquote><p>更准确地，可能 <code>getSession(false)</code> 才符合 <code>getter</code> 的 <code>语意</code>：在 <code>之前不存在会话</code> 时 应该返回 <code>null</code></p>
</blockquote>
</blockquote>
<blockquote><p>在 <code>request</code> 上调用 <code>getSession()</code> ，<code>容器</code> 会 <code>尝试使用cookie</code>，如果 <code>客户的浏览器没有启用cookie</code>，则说明 <code>客户不会加入会话</code>。</p>
<p>此时，<code>session#isNew</code> 总是返回 <code>true</code></p>
</blockquote>
<blockquote><p>对于 <code>客户禁用cookie</code> 的情况，<code>总是使用</code> <code>URL重写</code> 来 <code>追踪会话</code>。</p>
<p>可以通过 <code>response#encodeURL(String)</code> 在每个 <code>链接</code> 种添加 <code>会话ID (Session ID)</code></p>
<blockquote><p>如果需要在 <code>重定向</code> 的时候，仍然使用 <code>同一个会话</code> ，则调用：</p>
<pre><code class="language-java" lang="java">response.encodeRedirectURL("/BeerTest.do");
</code></pre>
</blockquote>
<blockquote><p><code>容器</code> <code>了解客户的cookie能否正常工作</code> 的 <code>唯一方式</code> 是：<code>检查客户发送的请求是否携带会话ID</code>。</p>
<p>一旦容器发现 <code>客户发送的请求</code> 没有 <code>携带会话ID</code>，则需要在 <code>返回的响应</code> 中 <code>同时尝试</code> <code>cookie</code> 和 <code>url重写</code>   这两种方法。</p>
</blockquote>
<p><code>JSESSIONID</code> 会出现在 <code>header的cookie中</code>，以及 <code>URL</code> 当中</p>
<pre><code class="language-html" lang="html">Cookie: JESSIONID=0AAB6C8DE415
// or
POST /select/selectBeerTaste.do;JESSIONID=0AAB6C8DE415
</code></pre>
</blockquote>
<blockquote><p><code>会话失效</code> 的原因： <code>会话超时</code>，<code>手动调用 session#invalidate()</code> 和 <code>应用结束 (崩溃或取消部署)</code></p>
<pre><code class="language-xml" lang="xml">&lt;web-app&gt;

 &lt;session-config&gt;
     &lt;!-- 15minutes --&gt;
 	&lt;session-timeout&gt;15&lt;/session-timeout&gt;
 &lt;/session-config&gt;
&lt;/web-app&gt;
</code></pre>
<pre><code class="language-java" lang="java">// 此处的时间单位 = 秒
session.setMaxInactiveInterval(15 * 60)
// session.setMaxInactiveInterval(0) = session.invalidate()    
</code></pre>
</blockquote>
<blockquote><p>将 <code>cookie</code> 用于 <code>其他用途</code> （不仅仅是用于 <code>会话 (Session)</code>）</p>
<pre><code class="language-java" lang="java">Cookie cookie = new Cookie("username", name);
cookie.setMaxAge(15 * 60); // 如果设置 -1，则在 浏览器退出是，cookie自动删除
response.addCookie(cookie);
</code></pre>
<blockquote><p>有 <code>getHeader()</code> 和 <code>setHeader()</code>。但只有 <code>addCookie()</code> 和 <code>getCookies()</code>，没有 <code>getCookie()</code> 和 <code>setCookie()</code></p>
</blockquote>
</blockquote>
<p>&nbsp;</p>
<h3>JSP</h3>
<div contenteditable="true" spellcheck="false" class="mathjax-block md-end-block md-math-block md-rawblock" id="mathjax-n229" cid="n229" mdtype="math_block" data-math-tag-before="0" data-math-tag-after="0" data-math-labels="[]"><div class="md-rawblock-container md-math-container" tabindex="-1"><mjx-container class="MathJax" jax="SVG" display="true" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="74.157ex" height="20.357ex" role="img" focusable="false" viewBox="0 -4749 32777.3 8998" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -9.613ex;" class="in-text-selection"><defs><path id="MJX-2-TEX-N-4A" d="M89 177Q115 177 133 160T152 112Q152 88 137 72T102 52Q99 51 101 49Q106 43 129 29Q159 15 190 15Q232 15 256 48T286 126Q286 127 286 142T286 183T286 238T287 306T287 378Q287 403 287 429T287 479T287 524T286 563T286 593T286 614V621Q281 630 263 633T182 637H154V683H166Q187 680 332 680Q439 680 457 683H465V637H449Q422 637 401 634Q393 631 389 623Q388 621 388 376T387 123Q377 61 322 20T194 -22Q188 -22 177 -21T160 -20Q96 -9 61 29T25 110Q25 144 44 160T89 177Z"></path><path id="MJX-2-TEX-N-53" d="M55 507Q55 590 112 647T243 704H257Q342 704 405 641L426 672Q431 679 436 687T446 700L449 704Q450 704 453 704T459 705H463Q466 705 472 699V462L466 456H448Q437 456 435 459T430 479Q413 605 329 646Q292 662 254 662Q201 662 168 626T135 542Q135 508 152 480T200 435Q210 431 286 412T370 389Q427 367 463 314T500 191Q500 110 448 45T301 -21Q245 -21 201 -4T140 27L122 41Q118 36 107 21T87 -7T78 -21Q76 -22 68 -22H64Q61 -22 55 -16V101Q55 220 56 222Q58 227 76 227H89Q95 221 95 214Q95 182 105 151T139 90T205 42T305 24Q352 24 386 62T420 155Q420 198 398 233T340 281Q284 295 266 300Q261 301 239 306T206 314T174 325T141 343T112 367T85 402Q55 451 55 507Z"></path><path id="MJX-2-TEX-N-50" d="M130 622Q123 629 119 631T103 634T60 637H27V683H214Q237 683 276 683T331 684Q419 684 471 671T567 616Q624 563 624 489Q624 421 573 372T451 307Q429 302 328 301H234V181Q234 62 237 58Q245 47 304 46H337V0H326Q305 3 182 3Q47 3 38 0H27V46H60Q102 47 111 49T130 61V622ZM507 488Q507 514 506 528T500 564T483 597T450 620T397 635Q385 637 307 637H286Q237 637 234 628Q231 624 231 483V342H302H339Q390 342 423 349T481 382Q507 411 507 488Z"></path><path id="MJX-2-TEX-N-20" d=""></path><path id="MJX-2-TEX-N-45" d="M128 619Q121 626 117 628T101 631T58 634H25V680H597V676Q599 670 611 560T625 444V440H585V444Q584 447 582 465Q578 500 570 526T553 571T528 601T498 619T457 629T411 633T353 634Q266 634 251 633T233 622Q233 622 233 621Q232 619 232 497V376H286Q359 378 377 385Q413 401 416 469Q416 471 416 473V493H456V213H416V233Q415 268 408 288T383 317T349 328T297 330Q290 330 286 330H232V196V114Q232 57 237 52Q243 47 289 47H340H391Q428 47 452 50T505 62T552 92T584 146Q594 172 599 200T607 247T612 270V273H652V270Q651 267 632 137T610 3V0H25V46H58Q100 47 109 49T128 61V619Z"></path><path id="MJX-2-TEX-N-6C" d="M42 46H56Q95 46 103 60V68Q103 77 103 91T103 124T104 167T104 217T104 272T104 329Q104 366 104 407T104 482T104 542T103 586T103 603Q100 622 89 628T44 637H26V660Q26 683 28 683L38 684Q48 685 67 686T104 688Q121 689 141 690T171 693T182 694H185V379Q185 62 186 60Q190 52 198 49Q219 46 247 46H263V0H255L232 1Q209 2 183 2T145 3T107 3T57 1L34 0H26V46H42Z"></path><path id="MJX-2-TEX-N-65" d="M28 218Q28 273 48 318T98 391T163 433T229 448Q282 448 320 430T378 380T406 316T415 245Q415 238 408 231H126V216Q126 68 226 36Q246 30 270 30Q312 30 342 62Q359 79 369 104L379 128Q382 131 395 131H398Q415 131 415 121Q415 117 412 108Q393 53 349 21T250 -11Q155 -11 92 58T28 218ZM333 275Q322 403 238 411H236Q228 411 220 410T195 402T166 381T143 340T127 274V267H333V275Z"></path><path id="MJX-2-TEX-N-6D" d="M41 46H55Q94 46 102 60V68Q102 77 102 91T102 122T103 161T103 203Q103 234 103 269T102 328V351Q99 370 88 376T43 385H25V408Q25 431 27 431L37 432Q47 433 65 434T102 436Q119 437 138 438T167 441T178 442H181V402Q181 364 182 364T187 369T199 384T218 402T247 421T285 437Q305 442 336 442Q351 442 364 440T387 434T406 426T421 417T432 406T441 395T448 384T452 374T455 366L457 361L460 365Q463 369 466 373T475 384T488 397T503 410T523 422T546 432T572 439T603 442Q729 442 740 329Q741 322 741 190V104Q741 66 743 59T754 49Q775 46 803 46H819V0H811L788 1Q764 2 737 2T699 3Q596 3 587 0H579V46H595Q656 46 656 62Q657 64 657 200Q656 335 655 343Q649 371 635 385T611 402T585 404Q540 404 506 370Q479 343 472 315T464 232V168V108Q464 78 465 68T468 55T477 49Q498 46 526 46H542V0H534L510 1Q487 2 460 2T422 3Q319 3 310 0H302V46H318Q379 46 379 62Q380 64 380 200Q379 335 378 343Q372 371 358 385T334 402T308 404Q263 404 229 370Q202 343 195 315T187 232V168V108Q187 78 188 68T191 55T200 49Q221 46 249 46H265V0H257L234 1Q210 2 183 2T145 3Q42 3 33 0H25V46H41Z"></path><path id="MJX-2-TEX-N-6E" d="M41 46H55Q94 46 102 60V68Q102 77 102 91T102 122T103 161T103 203Q103 234 103 269T102 328V351Q99 370 88 376T43 385H25V408Q25 431 27 431L37 432Q47 433 65 434T102 436Q119 437 138 438T167 441T178 442H181V402Q181 364 182 364T187 369T199 384T218 402T247 421T285 437Q305 442 336 442Q450 438 463 329Q464 322 464 190V104Q464 66 466 59T477 49Q498 46 526 46H542V0H534L510 1Q487 2 460 2T422 3Q319 3 310 0H302V46H318Q379 46 379 62Q380 64 380 200Q379 335 378 343Q372 371 358 385T334 402T308 404Q263 404 229 370Q202 343 195 315T187 232V168V108Q187 78 188 68T191 55T200 49Q221 46 249 46H265V0H257L234 1Q210 2 183 2T145 3Q42 3 33 0H25V46H41Z"></path><path id="MJX-2-TEX-N-74" d="M27 422Q80 426 109 478T141 600V615H181V431H316V385H181V241Q182 116 182 100T189 68Q203 29 238 29Q282 29 292 100Q293 108 293 146V181H333V146V134Q333 57 291 17Q264 -10 221 -10Q187 -10 162 2T124 33T105 68T98 100Q97 107 97 248V385H18V422H27Z"></path><path id="MJX-2-TEX-N-73" d="M295 316Q295 356 268 385T190 414Q154 414 128 401Q98 382 98 349Q97 344 98 336T114 312T157 287Q175 282 201 278T245 269T277 256Q294 248 310 236T342 195T359 133Q359 71 321 31T198 -10H190Q138 -10 94 26L86 19L77 10Q71 4 65 -1L54 -11H46H42Q39 -11 33 -5V74V132Q33 153 35 157T45 162H54Q66 162 70 158T75 146T82 119T101 77Q136 26 198 26Q295 26 295 104Q295 133 277 151Q257 175 194 187T111 210Q75 227 54 256T33 318Q33 357 50 384T93 424T143 442T187 447H198Q238 447 268 432L283 424L292 431Q302 440 314 448H322H326Q329 448 335 442V310L329 304H301Q295 310 295 316Z"></path><path id="MJX-2-TEX-S4-23A7" d="M712 899L718 893V876V865Q718 854 704 846Q627 793 577 710T510 525Q510 524 509 521Q505 493 504 349Q504 345 504 334Q504 277 504 240Q504 -2 503 -4Q502 -8 494 -9T444 -10Q392 -10 390 -9Q387 -8 386 -5Q384 5 384 230Q384 262 384 312T383 382Q383 481 392 535T434 656Q510 806 664 892L677 899H712Z"></path><path id="MJX-2-TEX-S4-23A9" d="M718 -893L712 -899H677L666 -893Q542 -825 468 -714T385 -476Q384 -466 384 -282Q384 3 385 5L389 9Q392 10 444 10Q486 10 494 9T503 4Q504 2 504 -239V-310V-366Q504 -470 508 -513T530 -609Q546 -657 569 -698T617 -767T661 -812T699 -843T717 -856T718 -876V-893Z"></path><path id="MJX-2-TEX-S4-23A8" d="M389 1159Q391 1160 455 1160Q496 1160 498 1159Q501 1158 502 1155Q504 1145 504 924Q504 691 503 682Q494 549 425 439T243 259L229 250L243 241Q349 175 421 66T503 -182Q504 -191 504 -424Q504 -600 504 -629T499 -659H498Q496 -660 444 -660T390 -659Q387 -658 386 -655Q384 -645 384 -425V-282Q384 -176 377 -116T342 10Q325 54 301 92T255 155T214 196T183 222T171 232Q170 233 170 250T171 268Q171 269 191 284T240 331T300 407T354 524T383 679Q384 691 384 925Q384 1152 385 1155L389 1159Z"></path><path id="MJX-2-TEX-S4-23AA" d="M384 150V266Q384 304 389 309Q391 310 455 310Q496 310 498 309Q502 308 503 298Q504 283 504 150Q504 32 504 12T499 -9H498Q496 -10 444 -10T390 -9Q386 -8 385 2Q384 17 384 150Z"></path><path id="MJX-2-TEX-N-63" d="M370 305T349 305T313 320T297 358Q297 381 312 396Q317 401 317 402T307 404Q281 408 258 408Q209 408 178 376Q131 329 131 219Q131 137 162 90Q203 29 272 29Q313 29 338 55T374 117Q376 125 379 127T395 129H409Q415 123 415 120Q415 116 411 104T395 71T366 33T318 2T249 -11Q163 -11 99 53T34 214Q34 318 99 383T250 448T370 421T404 357Q404 334 387 320Z"></path><path id="MJX-2-TEX-N-72" d="M36 46H50Q89 46 97 60V68Q97 77 97 91T98 122T98 161T98 203Q98 234 98 269T98 328L97 351Q94 370 83 376T38 385H20V408Q20 431 22 431L32 432Q42 433 60 434T96 436Q112 437 131 438T160 441T171 442H174V373Q213 441 271 441H277Q322 441 343 419T364 373Q364 352 351 337T313 322Q288 322 276 338T263 372Q263 381 265 388T270 400T273 405Q271 407 250 401Q234 393 226 386Q179 341 179 207V154Q179 141 179 127T179 101T180 81T180 66V61Q181 59 183 57T188 54T193 51T200 49T207 48T216 47T225 47T235 46T245 46H276V0H267Q249 3 140 3Q37 3 28 0H20V46H36Z"></path><path id="MJX-2-TEX-N-69" d="M69 609Q69 637 87 653T131 669Q154 667 171 652T188 609Q188 579 171 564T129 549Q104 549 87 564T69 609ZM247 0Q232 3 143 3Q132 3 106 3T56 1L34 0H26V46H42Q70 46 91 49Q100 53 102 60T104 102V205V293Q104 345 102 359T88 378Q74 385 41 385H30V408Q30 431 32 431L42 432Q52 433 70 434T106 436Q123 437 142 438T171 441T182 442H185V62Q190 52 197 50T232 46H255V0H247Z"></path><path id="MJX-2-TEX-N-70" d="M36 -148H50Q89 -148 97 -134V-126Q97 -119 97 -107T97 -77T98 -38T98 6T98 55T98 106Q98 140 98 177T98 243T98 296T97 335T97 351Q94 370 83 376T38 385H20V408Q20 431 22 431L32 432Q42 433 61 434T98 436Q115 437 135 438T165 441T176 442H179V416L180 390L188 397Q247 441 326 441Q407 441 464 377T522 216Q522 115 457 52T310 -11Q242 -11 190 33L182 40V-45V-101Q182 -128 184 -134T195 -145Q216 -148 244 -148H260V-194H252L228 -193Q205 -192 178 -192T140 -191Q37 -191 28 -194H20V-148H36ZM424 218Q424 292 390 347T305 402Q234 402 182 337V98Q222 26 294 26Q345 26 384 80T424 218Z"></path><path id="MJX-2-TEX-N-78" d="M201 0Q189 3 102 3Q26 3 17 0H11V46H25Q48 47 67 52T96 61T121 78T139 96T160 122T180 150L226 210L168 288Q159 301 149 315T133 336T122 351T113 363T107 370T100 376T94 379T88 381T80 383Q74 383 44 385H16V431H23Q59 429 126 429Q219 429 229 431H237V385Q201 381 201 369Q201 367 211 353T239 315T268 274L272 270L297 304Q329 345 329 358Q329 364 327 369T322 376T317 380T310 384L307 385H302V431H309Q324 428 408 428Q487 428 493 431H499V385H492Q443 385 411 368Q394 360 377 341T312 257L296 236L358 151Q424 61 429 57T446 50Q464 46 499 46H516V0H510H502Q494 1 482 1T457 2T432 2T414 3Q403 3 377 3T327 1L304 0H295V46H298Q309 46 320 51T331 63Q331 65 291 120L250 175Q249 174 219 133T185 88Q181 83 181 74Q181 63 188 55T206 46Q208 46 208 23V0H201Z"></path><path id="MJX-2-TEX-N-6F" d="M28 214Q28 309 93 378T250 448Q340 448 405 380T471 215Q471 120 407 55T250 -10Q153 -10 91 57T28 214ZM250 30Q372 30 372 193V225V250Q372 272 371 288T364 326T348 362T317 390T268 410Q263 411 252 411Q222 411 195 399Q152 377 139 338T126 246V226Q126 130 145 91Q177 30 250 30Z"></path><path id="MJX-2-TEX-S3-7B" d="M618 -943L612 -949H582L568 -943Q472 -903 411 -841T332 -703Q327 -682 327 -653T325 -350Q324 -28 323 -18Q317 24 301 61T264 124T221 171T179 205T147 225T132 234Q130 238 130 250Q130 255 130 258T131 264T132 267T134 269T139 272T144 275Q207 308 256 367Q310 436 323 519Q324 529 325 851Q326 1124 326 1154T332 1205Q369 1358 566 1443L582 1450H612L618 1444V1429Q618 1413 616 1411L608 1406Q599 1402 585 1393T552 1372T515 1343T479 1305T449 1257T429 1200Q425 1180 425 1152T423 851Q422 579 422 549T416 498Q407 459 388 424T346 364T297 318T250 284T214 264T197 254L188 251L205 242Q290 200 345 138T416 3Q421 -18 421 -48T423 -349Q423 -397 423 -472Q424 -677 428 -694Q429 -697 429 -699Q434 -722 443 -743T465 -782T491 -816T519 -845T548 -868T574 -886T595 -899T610 -908L616 -910Q618 -912 618 -928V-943Z"></path><path id="MJX-2-TEX-N-28" d="M94 250Q94 319 104 381T127 488T164 576T202 643T244 695T277 729T302 750H315H319Q333 750 333 741Q333 738 316 720T275 667T226 581T184 443T167 250T184 58T225 -81T274 -167T316 -220T333 -241Q333 -250 318 -250H315H302L274 -226Q180 -141 137 -14T94 250Z"></path><path id="MJX-2-TEX-N-61" d="M137 305T115 305T78 320T63 359Q63 394 97 421T218 448Q291 448 336 416T396 340Q401 326 401 309T402 194V124Q402 76 407 58T428 40Q443 40 448 56T453 109V145H493V106Q492 66 490 59Q481 29 455 12T400 -6T353 12T329 54V58L327 55Q325 52 322 49T314 40T302 29T287 17T269 6T247 -2T221 -8T190 -11Q130 -11 82 20T34 107Q34 128 41 147T68 188T116 225T194 253T304 268H318V290Q318 324 312 340Q290 411 215 411Q197 411 181 410T156 406T148 403Q170 388 170 359Q170 334 154 320ZM126 106Q126 75 150 51T209 26Q247 26 276 49T315 109Q317 116 318 175Q318 233 317 233Q309 233 296 232T251 223T193 203T147 166T126 106Z"></path><path id="MJX-2-TEX-N-76" d="M338 431Q344 429 422 429Q479 429 503 431H508V385H497Q439 381 423 345Q421 341 356 172T288 -2Q283 -11 263 -11Q244 -11 239 -2Q99 359 98 364Q93 378 82 381T43 385H19V431H25L33 430Q41 430 53 430T79 430T104 429T122 428Q217 428 232 431H240V385H226Q187 384 184 370Q184 366 235 234L286 102L377 341V349Q377 363 367 372T349 383T335 385H331V431H338Z"></path><path id="MJX-2-TEX-N-4C" d="M128 622Q121 629 117 631T101 634T58 637H25V683H36Q48 680 182 680Q324 680 348 683H360V637H333Q273 637 258 635T233 622L232 342V129Q232 57 237 52Q243 47 313 47Q384 47 410 53Q470 70 498 110T536 221Q536 226 537 238T540 261T542 272T562 273H582V268Q580 265 568 137T554 5V0H25V46H58Q100 47 109 49T128 61V622Z"></path><path id="MJX-2-TEX-N-67" d="M329 409Q373 453 429 453Q459 453 472 434T485 396Q485 382 476 371T449 360Q416 360 412 390Q410 404 415 411Q415 412 416 414V415Q388 412 363 393Q355 388 355 386Q355 385 359 381T368 369T379 351T388 325T392 292Q392 230 343 187T222 143Q172 143 123 171Q112 153 112 133Q112 98 138 81Q147 75 155 75T227 73Q311 72 335 67Q396 58 431 26Q470 -13 470 -72Q470 -139 392 -175Q332 -206 250 -206Q167 -206 107 -175Q29 -140 29 -75Q29 -39 50 -15T92 18L103 24Q67 55 67 108Q67 155 96 193Q52 237 52 292Q52 355 102 398T223 442Q274 442 318 416L329 409ZM299 343Q294 371 273 387T221 404Q192 404 171 388T145 343Q142 326 142 292Q142 248 149 227T179 192Q196 182 222 182Q244 182 260 189T283 207T294 227T299 242Q302 258 302 292T299 343ZM403 -75Q403 -50 389 -34T348 -11T299 -2T245 0H218Q151 0 138 -6Q118 -15 107 -34T95 -74Q95 -84 101 -97T122 -127T170 -155T250 -167Q319 -167 361 -139T403 -75Z"></path><path id="MJX-2-TEX-N-75" d="M383 58Q327 -10 256 -10H249Q124 -10 105 89Q104 96 103 226Q102 335 102 348T96 369Q86 385 36 385H25V408Q25 431 27 431L38 432Q48 433 67 434T105 436Q122 437 142 438T172 441T184 442H187V261Q188 77 190 64Q193 49 204 40Q224 26 264 26Q290 26 311 35T343 58T363 90T375 120T379 144Q379 145 379 161T380 201T380 248V315Q380 361 370 372T320 385H302V431Q304 431 378 436T457 442H464V264Q464 84 465 81Q468 61 479 55T524 46H542V0Q540 0 467 -5T390 -11H383V58Z"></path><path id="MJX-2-TEX-N-29" d="M60 749L64 750Q69 750 74 750H86L114 726Q208 641 251 514T294 250Q294 182 284 119T261 12T224 -76T186 -143T145 -194T113 -227T90 -246Q87 -249 86 -250H74Q66 -250 63 -250T58 -247T55 -238Q56 -237 66 -225Q221 -64 221 250T66 725Q56 737 55 738Q55 746 60 749Z"></path><path id="MJX-2-TEX-N-44" d="M130 622Q123 629 119 631T103 634T60 637H27V683H228Q399 682 419 682T461 676Q504 667 546 641T626 573T685 470T708 336Q708 210 634 116T442 3Q429 1 228 0H27V46H60Q102 47 111 49T130 61V622ZM593 338Q593 439 571 501T493 602Q439 637 355 637H322H294Q238 637 234 628Q231 624 231 344Q231 62 232 59Q233 49 248 48T339 46H350Q456 46 515 95Q561 133 577 191T593 338Z"></path><path id="MJX-2-TEX-N-49" d="M328 0Q307 3 180 3T32 0H21V46H43Q92 46 106 49T126 60Q128 63 128 342Q128 620 126 623Q122 628 118 630T96 635T43 637H21V683H32Q53 680 180 680T328 683H339V637H317Q268 637 254 634T234 623Q232 620 232 342Q232 63 234 60Q238 55 242 53T264 48T317 46H339V0H328Z"></path><path id="MJX-2-TEX-N-41" d="M255 0Q240 3 140 3Q48 3 39 0H32V46H47Q119 49 139 88Q140 91 192 245T295 553T348 708Q351 716 366 716H376Q396 715 400 709Q402 707 508 390L617 67Q624 54 636 51T687 46H717V0H708Q699 3 581 3Q458 3 437 0H427V46H440Q510 46 510 64Q510 66 486 138L462 209H229L209 150Q189 91 189 85Q189 72 209 59T259 46H264V0H255ZM447 255L345 557L244 256Q244 255 345 255H447Z"></path><path id="MJX-2-TEX-N-64" d="M376 495Q376 511 376 535T377 568Q377 613 367 624T316 637H298V660Q298 683 300 683L310 684Q320 685 339 686T376 688Q393 689 413 690T443 693T454 694H457V390Q457 84 458 81Q461 61 472 55T517 46H535V0Q533 0 459 -5T380 -11H373V44L365 37Q307 -11 235 -11Q158 -11 96 50T34 215Q34 315 97 378T244 442Q319 442 376 393V495ZM373 342Q328 405 260 405Q211 405 173 369Q146 341 139 305T131 211Q131 155 138 120T173 59Q203 26 251 26Q322 26 373 103V342Z"></path><path id="MJX-2-TEX-N-43" d="M56 342Q56 428 89 500T174 615T283 681T391 705Q394 705 400 705T408 704Q499 704 569 636L582 624L612 663Q639 700 643 704Q644 704 647 704T653 705H657Q660 705 666 699V419L660 413H626Q620 419 619 430Q610 512 571 572T476 651Q457 658 426 658Q322 658 252 588Q173 509 173 342Q173 221 211 151Q232 111 263 84T328 45T384 29T428 24Q517 24 571 93T626 244Q626 251 632 257H660L666 251V236Q661 133 590 56T403 -21Q262 -21 159 83T56 342Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mtable"><g data-mml-node="mtr"><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="4A" xlink:href="#MJX-2-TEX-N-4A"></use><use data-c="53" xlink:href="#MJX-2-TEX-N-53" transform="translate(514,0)"></use><use data-c="50" xlink:href="#MJX-2-TEX-N-50" transform="translate(1070,0)"></use><use data-c="20" xlink:href="#MJX-2-TEX-N-20" transform="translate(1751,0)"></use><use data-c="45" xlink:href="#MJX-2-TEX-N-45" transform="translate(2001,0)"></use><use data-c="6C" xlink:href="#MJX-2-TEX-N-6C" transform="translate(2682,0)"></use><use data-c="65" xlink:href="#MJX-2-TEX-N-65" transform="translate(2960,0)"></use><use data-c="6D" xlink:href="#MJX-2-TEX-N-6D" transform="translate(3404,0)"></use><use data-c="65" xlink:href="#MJX-2-TEX-N-65" transform="translate(4237,0)"></use><use data-c="6E" xlink:href="#MJX-2-TEX-N-6E" transform="translate(4681,0)"></use><use data-c="74" xlink:href="#MJX-2-TEX-N-74" transform="translate(5237,0)"></use><use data-c="73" xlink:href="#MJX-2-TEX-N-73" transform="translate(5626,0)"></use></g><g data-mml-node="mrow" transform="translate(6186.7,0)"><g data-mml-node="mo"><use data-c="23A7" xlink:href="#MJX-2-TEX-S4-23A7" transform="translate(0,3850)"></use><use data-c="23A9" xlink:href="#MJX-2-TEX-S4-23A9" transform="translate(0,-3350)"></use><use data-c="23A8" xlink:href="#MJX-2-TEX-S4-23A8" transform="translate(0,0)"></use><svg width="889" height="2880" y="1060" x="0" viewBox="0 507.5 889 2880" class="in-text-selection"><use data-c="23AA" xlink:href="#MJX-2-TEX-S4-23AA" transform="scale(1,14.164)"></use></svg><svg width="889" height="2880" y="-3440" x="0" viewBox="0 507.5 889 2880" class="in-text-selection"><use data-c="23AA" xlink:href="#MJX-2-TEX-S4-23AA" transform="scale(1,14.164)"></use></svg></g><g data-mml-node="mtable" transform="translate(889,0)"><g data-mml-node="mtr" transform="translate(0,3999)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="53" xlink:href="#MJX-2-TEX-N-53"></use><use data-c="63" xlink:href="#MJX-2-TEX-N-63" transform="translate(556,0)"></use><use data-c="72" xlink:href="#MJX-2-TEX-N-72" transform="translate(1000,0)"></use><use data-c="69" xlink:href="#MJX-2-TEX-N-69" transform="translate(1392,0)"></use><use data-c="70" xlink:href="#MJX-2-TEX-N-70" transform="translate(1670,0)"></use><use data-c="74" xlink:href="#MJX-2-TEX-N-74" transform="translate(2226,0)"></use><use data-c="6C" xlink:href="#MJX-2-TEX-N-6C" transform="translate(2615,0)"></use><use data-c="65" xlink:href="#MJX-2-TEX-N-65" transform="translate(2893,0)"></use><use data-c="74" xlink:href="#MJX-2-TEX-N-74" transform="translate(3337,0)"></use></g></g></g><g data-mml-node="mtr" transform="translate(0,1999.5)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="45" xlink:href="#MJX-2-TEX-N-45"></use><use data-c="78" xlink:href="#MJX-2-TEX-N-78" transform="translate(681,0)"></use><use data-c="70" xlink:href="#MJX-2-TEX-N-70" transform="translate(1209,0)"></use><use data-c="72" xlink:href="#MJX-2-TEX-N-72" transform="translate(1765,0)"></use><use data-c="65" xlink:href="#MJX-2-TEX-N-65" transform="translate(2157,0)"></use><use data-c="73" xlink:href="#MJX-2-TEX-N-73" transform="translate(2601,0)"></use><use data-c="73" xlink:href="#MJX-2-TEX-N-73" transform="translate(2995,0)"></use><use data-c="69" xlink:href="#MJX-2-TEX-N-69" transform="translate(3389,0)"></use><use data-c="6F" xlink:href="#MJX-2-TEX-N-6F" transform="translate(3667,0)"></use><use data-c="6E" xlink:href="#MJX-2-TEX-N-6E" transform="translate(4167,0)"></use></g><g data-mml-node="mrow" transform="translate(4889.7,0)"><g data-mml-node="mo" transform="translate(0 -0.5)"><use data-c="7B" xlink:href="#MJX-2-TEX-S3-7B"></use></g><g data-mml-node="mtable" transform="translate(750,0)"><g data-mml-node="mtr" transform="translate(0,650)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="53" xlink:href="#MJX-2-TEX-N-53"></use><use data-c="63" xlink:href="#MJX-2-TEX-N-63" transform="translate(556,0)"></use><use data-c="72" xlink:href="#MJX-2-TEX-N-72" transform="translate(1000,0)"></use><use data-c="69" xlink:href="#MJX-2-TEX-N-69" transform="translate(1392,0)"></use><use data-c="70" xlink:href="#MJX-2-TEX-N-70" transform="translate(1670,0)"></use><use data-c="74" xlink:href="#MJX-2-TEX-N-74" transform="translate(2226,0)"></use><use data-c="20" xlink:href="#MJX-2-TEX-N-20" transform="translate(2615,0)"></use><use data-c="45" xlink:href="#MJX-2-TEX-N-45" transform="translate(2865,0)"></use><use data-c="78" xlink:href="#MJX-2-TEX-N-78" transform="translate(3546,0)"></use><use data-c="70" xlink:href="#MJX-2-TEX-N-70" transform="translate(4074,0)"></use><use data-c="72" xlink:href="#MJX-2-TEX-N-72" transform="translate(4630,0)"></use><use data-c="65" xlink:href="#MJX-2-TEX-N-65" transform="translate(5022,0)"></use><use data-c="73" xlink:href="#MJX-2-TEX-N-73" transform="translate(5466,0)"></use><use data-c="73" xlink:href="#MJX-2-TEX-N-73" transform="translate(5860,0)"></use><use data-c="69" xlink:href="#MJX-2-TEX-N-69" transform="translate(6254,0)"></use><use data-c="6F" xlink:href="#MJX-2-TEX-N-6F" transform="translate(6532,0)"></use><use data-c="6E" xlink:href="#MJX-2-TEX-N-6E" transform="translate(7032,0)"></use><use data-c="20" xlink:href="#MJX-2-TEX-N-20" transform="translate(7588,0)"></use><use data-c="28" xlink:href="#MJX-2-TEX-N-28" transform="translate(7838,0)"></use><use data-c="4A" xlink:href="#MJX-2-TEX-N-4A" transform="translate(8227,0)"></use><use data-c="61" xlink:href="#MJX-2-TEX-N-61" transform="translate(8741,0)"></use><use data-c="76" xlink:href="#MJX-2-TEX-N-76" transform="translate(9241,0)"></use><use data-c="61" xlink:href="#MJX-2-TEX-N-61" transform="translate(9769,0)"></use><use data-c="20" xlink:href="#MJX-2-TEX-N-20" transform="translate(10269,0)"></use><use data-c="4C" xlink:href="#MJX-2-TEX-N-4C" transform="translate(10519,0)"></use><use data-c="61" xlink:href="#MJX-2-TEX-N-61" transform="translate(11144,0)"></use><use data-c="6E" xlink:href="#MJX-2-TEX-N-6E" transform="translate(11644,0)"></use><use data-c="67" xlink:href="#MJX-2-TEX-N-67" transform="translate(12200,0)"></use><use data-c="75" xlink:href="#MJX-2-TEX-N-75" transform="translate(12700,0)"></use><use data-c="61" xlink:href="#MJX-2-TEX-N-61" transform="translate(13256,0)"></use><use data-c="67" xlink:href="#MJX-2-TEX-N-67" transform="translate(13756,0)"></use><use data-c="65" xlink:href="#MJX-2-TEX-N-65" transform="translate(14256,0)"></use><use data-c="20" xlink:href="#MJX-2-TEX-N-20" transform="translate(14700,0)"></use><use data-c="45" xlink:href="#MJX-2-TEX-N-45" transform="translate(14950,0)"></use><use data-c="78" xlink:href="#MJX-2-TEX-N-78" transform="translate(15631,0)"></use><use data-c="70" xlink:href="#MJX-2-TEX-N-70" transform="translate(16159,0)"></use><use data-c="72" xlink:href="#MJX-2-TEX-N-72" transform="translate(16715,0)"></use><use data-c="65" xlink:href="#MJX-2-TEX-N-65" transform="translate(17107,0)"></use><use data-c="73" xlink:href="#MJX-2-TEX-N-73" transform="translate(17551,0)"></use><use data-c="73" xlink:href="#MJX-2-TEX-N-73" transform="translate(17945,0)"></use><use data-c="69" xlink:href="#MJX-2-TEX-N-69" transform="translate(18339,0)"></use><use data-c="6F" xlink:href="#MJX-2-TEX-N-6F" transform="translate(18617,0)"></use><use data-c="6E" xlink:href="#MJX-2-TEX-N-6E" transform="translate(19117,0)"></use><use data-c="29" xlink:href="#MJX-2-TEX-N-29" transform="translate(19673,0)"></use></g></g></g><g data-mml-node="mtr" transform="translate(0,-650)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="45" xlink:href="#MJX-2-TEX-N-45"></use><use data-c="4C" xlink:href="#MJX-2-TEX-N-4C" transform="translate(681,0)"></use><use data-c="20" xlink:href="#MJX-2-TEX-N-20" transform="translate(1306,0)"></use><use data-c="45" xlink:href="#MJX-2-TEX-N-45" transform="translate(1556,0)"></use><use data-c="78" xlink:href="#MJX-2-TEX-N-78" transform="translate(2237,0)"></use><use data-c="70" xlink:href="#MJX-2-TEX-N-70" transform="translate(2765,0)"></use><use data-c="72" xlink:href="#MJX-2-TEX-N-72" transform="translate(3321,0)"></use><use data-c="65" xlink:href="#MJX-2-TEX-N-65" transform="translate(3713,0)"></use><use data-c="73" xlink:href="#MJX-2-TEX-N-73" transform="translate(4157,0)"></use><use data-c="73" xlink:href="#MJX-2-TEX-N-73" transform="translate(4551,0)"></use><use data-c="69" xlink:href="#MJX-2-TEX-N-69" transform="translate(4945,0)"></use><use data-c="6F" xlink:href="#MJX-2-TEX-N-6F" transform="translate(5223,0)"></use><use data-c="6E" xlink:href="#MJX-2-TEX-N-6E" transform="translate(5723,0)"></use></g></g></g></g><g data-mml-node="mo" transform="translate(20812,0) translate(0 250)"></g></g></g></g><g data-mml-node="mtr" transform="translate(0,0)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="44" xlink:href="#MJX-2-TEX-N-44"></use><use data-c="65" xlink:href="#MJX-2-TEX-N-65" transform="translate(764,0)"></use><use data-c="63" xlink:href="#MJX-2-TEX-N-63" transform="translate(1208,0)"></use><use data-c="6C" xlink:href="#MJX-2-TEX-N-6C" transform="translate(1652,0)"></use><use data-c="61" xlink:href="#MJX-2-TEX-N-61" transform="translate(1930,0)"></use><use data-c="72" xlink:href="#MJX-2-TEX-N-72" transform="translate(2430,0)"></use><use data-c="61" xlink:href="#MJX-2-TEX-N-61" transform="translate(2822,0)"></use><use data-c="74" xlink:href="#MJX-2-TEX-N-74" transform="translate(3322,0)"></use><use data-c="69" xlink:href="#MJX-2-TEX-N-69" transform="translate(3711,0)"></use><use data-c="6F" xlink:href="#MJX-2-TEX-N-6F" transform="translate(3989,0)"></use><use data-c="6E" xlink:href="#MJX-2-TEX-N-6E" transform="translate(4489,0)"></use></g></g></g><g data-mml-node="mtr" transform="translate(0,-1300)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="49" xlink:href="#MJX-2-TEX-N-49"></use><use data-c="6E" xlink:href="#MJX-2-TEX-N-6E" transform="translate(361,0)"></use><use data-c="73" xlink:href="#MJX-2-TEX-N-73" transform="translate(917,0)"></use><use data-c="74" xlink:href="#MJX-2-TEX-N-74" transform="translate(1311,0)"></use><use data-c="72" xlink:href="#MJX-2-TEX-N-72" transform="translate(1700,0)"></use><use data-c="75" xlink:href="#MJX-2-TEX-N-75" transform="translate(2092,0)"></use><use data-c="63" xlink:href="#MJX-2-TEX-N-63" transform="translate(2648,0)"></use><use data-c="74" xlink:href="#MJX-2-TEX-N-74" transform="translate(3092,0)"></use><use data-c="69" xlink:href="#MJX-2-TEX-N-69" transform="translate(3481,0)"></use><use data-c="6F" xlink:href="#MJX-2-TEX-N-6F" transform="translate(3759,0)"></use><use data-c="6E" xlink:href="#MJX-2-TEX-N-6E" transform="translate(4259,0)"></use></g></g></g><g data-mml-node="mtr" transform="translate(0,-3299.5)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="41" xlink:href="#MJX-2-TEX-N-41"></use><use data-c="63" xlink:href="#MJX-2-TEX-N-63" transform="translate(750,0)"></use><use data-c="74" xlink:href="#MJX-2-TEX-N-74" transform="translate(1194,0)"></use><use data-c="69" xlink:href="#MJX-2-TEX-N-69" transform="translate(1583,0)"></use><use data-c="6F" xlink:href="#MJX-2-TEX-N-6F" transform="translate(1861,0)"></use><use data-c="6E" xlink:href="#MJX-2-TEX-N-6E" transform="translate(2361,0)"></use></g><g data-mml-node="mrow" transform="translate(3083.7,0)"><g data-mml-node="mo" transform="translate(0 -0.5)"><use data-c="7B" xlink:href="#MJX-2-TEX-S3-7B"></use></g><g data-mml-node="mtable" transform="translate(750,0)"><g data-mml-node="mtr" transform="translate(0,650)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="53" xlink:href="#MJX-2-TEX-N-53"></use><use data-c="74" xlink:href="#MJX-2-TEX-N-74" transform="translate(556,0)"></use><use data-c="61" xlink:href="#MJX-2-TEX-N-61" transform="translate(945,0)"></use><use data-c="6E" xlink:href="#MJX-2-TEX-N-6E" transform="translate(1445,0)"></use><use data-c="64" xlink:href="#MJX-2-TEX-N-64" transform="translate(2001,0)"></use><use data-c="61" xlink:href="#MJX-2-TEX-N-61" transform="translate(2557,0)"></use><use data-c="72" xlink:href="#MJX-2-TEX-N-72" transform="translate(3057,0)"></use><use data-c="64" xlink:href="#MJX-2-TEX-N-64" transform="translate(3449,0)"></use><use data-c="20" xlink:href="#MJX-2-TEX-N-20" transform="translate(4005,0)"></use><use data-c="41" xlink:href="#MJX-2-TEX-N-41" transform="translate(4255,0)"></use><use data-c="63" xlink:href="#MJX-2-TEX-N-63" transform="translate(5005,0)"></use><use data-c="74" xlink:href="#MJX-2-TEX-N-74" transform="translate(5449,0)"></use><use data-c="69" xlink:href="#MJX-2-TEX-N-69" transform="translate(5838,0)"></use><use data-c="6F" xlink:href="#MJX-2-TEX-N-6F" transform="translate(6116,0)"></use><use data-c="6E" xlink:href="#MJX-2-TEX-N-6E" transform="translate(6616,0)"></use></g></g></g><g data-mml-node="mtr" transform="translate(0,-650)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="43" xlink:href="#MJX-2-TEX-N-43"></use><use data-c="75" xlink:href="#MJX-2-TEX-N-75" transform="translate(722,0)"></use><use data-c="73" xlink:href="#MJX-2-TEX-N-73" transform="translate(1278,0)"></use><use data-c="74" xlink:href="#MJX-2-TEX-N-74" transform="translate(1672,0)"></use><use data-c="6F" xlink:href="#MJX-2-TEX-N-6F" transform="translate(2061,0)"></use><use data-c="6D" xlink:href="#MJX-2-TEX-N-6D" transform="translate(2561,0)"></use><use data-c="20" xlink:href="#MJX-2-TEX-N-20" transform="translate(3394,0)"></use><use data-c="41" xlink:href="#MJX-2-TEX-N-41" transform="translate(3644,0)"></use><use data-c="63" xlink:href="#MJX-2-TEX-N-63" transform="translate(4394,0)"></use><use data-c="74" xlink:href="#MJX-2-TEX-N-74" transform="translate(4838,0)"></use><use data-c="69" xlink:href="#MJX-2-TEX-N-69" transform="translate(5227,0)"></use><use data-c="6F" xlink:href="#MJX-2-TEX-N-6F" transform="translate(5505,0)"></use><use data-c="6E" xlink:href="#MJX-2-TEX-N-6E" transform="translate(6005,0)"></use></g></g></g></g><g data-mml-node="mo" transform="translate(7922,0) translate(0 250)"></g></g></g></g></g><g data-mml-node="mo" transform="translate(26590.7,0) translate(0 250)"></g></g></g></g></g></g></g></svg></mjx-container></div></div>
<blockquote><p>当说到 <code>表达式</code> 时，默认指 <code>脚本表达式 (Java语言表达式)</code>，而不是 <code>EL表达式</code></p>
</blockquote>
<figure><table>
<thead>
<tr><th>Element Type</th><th>Example</th></tr></thead>
<tbody><tr><td>Scriptlet</td><td>&lt;% Float one = new Float(42.5); %&gt;</td></tr><tr><td>Script Expression</td><td>&lt;%= pageContext.getAttribute("foo") %&gt;</td></tr><tr><td>EL Expression</td><td>email: ${applicationScope.mail}</td></tr><tr><td>Declaration</td><td>&lt;%! int y = 3; %&gt;</td></tr><tr><td>Instruction</td><td>&lt;%@ page import="java.util.*" %&gt;</td></tr><tr><td>Action</td><td>&lt;jsp: include page="foo.html" /&gt;</td></tr></tbody>
</table></figure>
<hr>
<p>编写的 <code>JSP</code> 最终被 <code>编译</code> 为 <code>Servlet</code></p>
<pre><code class="language-jsp" lang="jsp">&lt;html&gt;
    &lt;body&gt;
        The page count is:
         &lt;%
    	out.println(foo.Counter.getCount()); // 使用 scriptlet + 全限定类名
    	 %&gt;
    &lt;/body&gt;
&lt;/html&gt;
</code></pre>
<pre><code class="language-jsp" lang="jsp">&lt;%@ page import="foo.*" %&gt;
&lt;html&gt;
    &lt;body&gt;
        The page count is:
         &lt;%
    	out.println(Counter.getCount()); // 使用 scriptlet + page import
    	 %&gt;
    &lt;/body&gt;
&lt;/html&gt;
</code></pre>
<p>进一步完善，使用 <code>JSEL</code></p>
<pre><code class="language-jsp" lang="jsp">&lt;%@ page import="foo.*" %&gt;
&lt;html&gt;
    &lt;body&gt;
        The page count is:
         &lt;%= Counter.getCount() //使用 Expression
    %&gt;
    &lt;/body&gt;
&lt;/html&gt;
</code></pre>
<blockquote><p>当使用 <code>表达式</code> 时，<code>语句末尾</code> 不能有 <code>分号</code> ！！！</p>
<p>因为 <code>&lt;%= Counter.getCount() &gt;</code> 等价于 <code>out.print(Counter.getCount())</code></p>
</blockquote>
<blockquote><p>在 <code>Scriptlet</code> 中 <code>定义变量</code></p>
<pre><code class="language-jsp" lang="jsp">&lt;% int count = 0; // 局部变量 %&gt; 
&lt;%! int count = 0; // 实例变量 %&gt;
</code></pre>
</blockquote>
<blockquote><p><code>JSP的隐式对象</code></p>
<figure><table>
<thead>
<tr><th>API (Servlet)</th><th>隐式对象 (JSP)</th></tr></thead>
<tbody><tr><td>JspWriter</td><td>out</td></tr><tr><td>HttpServletRequest</td><td>request</td></tr><tr><td>HttpServletResponse</td><td>response</td></tr><tr><td>HttpSession</td><td>session</td></tr><tr><td>ServletContext</td><td>application</td></tr><tr><td>ServletConfig</td><td>config</td></tr><tr><td>Throwable</td><td>exception</td></tr><tr><td>PageContext</td><td>pageContext</td></tr><tr><td>Object</td><td>page</td></tr></tbody>
</table></figure>
<blockquote><p><code>JspWriter</code> 不在 <code>PrintWriter</code> 的 <code>类层次体系</code> 中，但它类似于 <code>带了缓冲的PrintWriter</code></p>
</blockquote>
</blockquote>
<blockquote><p><code>JSP注释</code></p>
<pre><code class="language-jsp" lang="jsp">&lt;%-- your comment --%&gt;
</code></pre>
</blockquote>
<blockquote><p><code>属性的作用域</code> <code>映射关系</code></p>
<figure><table>
<thead>
<tr><th>Scope</th><th>Servlet</th><th>JSP</th></tr></thead>
<tbody><tr><td>Application</td><td>getServletContext().setAttribute("foo", barObj);</td><td>application.setAttribute("foo", barObj);</td></tr><tr><td>Request</td><td>request.setAttribute("foo", barObj);</td><td>request.setAttribute("foo", barObj);</td></tr><tr><td>Session</td><td>request.getSession.setAttribute("foo", barObj);</td><td>session.setAttribute("foo", barObj);</td></tr><tr><td>Page</td><td>\</td><td>pageContext.setAttribute("foo", barObj);</td></tr></tbody>
</table></figure>
<p>&nbsp;</p>
</blockquote>
<blockquote><p>使用 <code>PAGE_CONTEXT</code> 得到 <code>属性</code></p>
<pre><code class="language-mermaid" lang="mermaid">classDiagram
	class JspContext {
		+getAttribute(String name)
		+getAttribute(String name, int scope)
		+getAttributeNames()
		+findAttribuite(String name)
	}

	JspContext &lt;|-- PageContext
	class PageContext{
		+APPLICATION_SCOPE
		+PAGE_SCOPE
		+REQUEST_SCOPE
		+SESSION_SCOPE
		+getRequest()
		+getServletConfig()
		+getServletContext()
		+getSession()
	}
</code></pre>
<blockquote><p><code>getAttribute(String name)</code> = <code>getAttribute(String name, PAGE_SCOPE)</code></p>
</blockquote>
<blockquote><p><code>findAttribute(String name)</code>  的查找范围为：<code>PAGE_SCOPE</code>  -&gt; <code>REQUEST_SCOPE</code> -&gt; <code>SESSION_SCOPE</code> -&gt; <code>APPLICATION_SCOPE</code></p>
</blockquote>
</blockquote>
<blockquote><p><code>表达式语言 (Expression Language)</code> 的形式为 <code>${something}</code></p>
<pre><code class="language-jsp" lang="jsp">&lt;!-- Use Expression Language --&gt;
Please contact: ${applicationScope.mail}

&lt;!-- Use Java Language --&gt;
Please contact: &lt;%= application.getAttribute("mail") %&gt;
</code></pre>
<p>在 <code>使用EL</code>时，别忘了顺便 <code>封杀JSP中的</code> <code>脚本元素 (Script)</code></p>
<pre><code class="language-xml" lang="xml">&lt;web-app&gt;
	&lt;jsp-config&gt;
   &lt;jsp-property-group&gt;
       &lt;url-pattern&gt;*.jsp&lt;/url-pattern&gt;&gt;
       &lt;scripting-invalid&gt;true&lt;/scripting-invalid&gt;
   &lt;/jsp-property-group&gt;
&lt;/jsp-config&gt;
&lt;/web-app&gt;
</code></pre>
</blockquote>
<blockquote><p><code>动作元素</code> 分为 <code>标准动作</code> 和 <code>定制动作</code></p>
<pre><code class="language-jsp" lang="jsp">// 标准动作
&lt;jsp:include page="wickedFooter.jsp" /&gt;
// 定制动作
&lt;c:set var="rate" value="32" /&gt;
</code></pre>
<blockquote><p>有些 <code>非标准动作</code> 仍然位于 <code>标准库</code>。</p>
</blockquote>
</blockquote>
<h3>Scriptless-JSP</h3>
<pre><code class="language-jsp" lang="jsp">&lt;html&gt;
    &lt;body&gt;
        &lt;% foo.Person p = (foo.Person) request.getAttribute("person"); %&gt;
        Person is: &lt;%= p.getName() %&gt;
    &lt;/body&gt;
&lt;/html&gt;
&lt;!-- equals to --&gt;
&lt;html&gt;
    &lt;body&gt;
        &lt;jsp:useBean id="person" class="foo.Person" scope="request" /&gt;
        Person created by servlet: &lt;jsp:getProperty name="person" property="name" /&gt;
    &lt;/body&gt;
&lt;/html&gt;
</code></pre>
<pre><code class="language-jsp" lang="jsp">// &lt;jsp:useBean&gt; 在 创建新Bean 时 执行体中的内容
&lt;jsp:useBean id="person" class="foo.Person" scope="page" &gt;
	&lt;jsp:setProperty name="person"	property="name" value="Fred" /&gt;
&lt;/jsp:useBean&gt;
</code></pre>
<blockquote><p>JavaBean只有 <code>无参构造器</code>，<code>&lt;jsp:useBean&gt;</code> 在 <code>对象</code> 不存在时，会 <code>自动地</code> 通过无参构造器创建新对象</p>
</blockquote>
<blockquote><ul>
<li><code>useBean</code> 的 <code>type</code> 和 <code>class</code></li>

</ul>
<pre><code class="language-jsp" lang="jsp">&lt;!-- 建立多态的bean引用 --&gt;
&lt;jsp:useBean id="person" type="foo.Person" class="foo.Employee" scope="page" &gt;&lt;/jsp:useBean&gt;
</code></pre>
<pre><code class="language-jsp" lang="jsp">&lt;!-- 只使用type，而没有class --&gt;
&lt;jsp:useBean id="person" type="foo.Person" scope="page"&gt;&lt;/jsp:useBean&gt;
</code></pre>
<p>规则是这样的：<code>type</code> 表示 <code>引用类型</code>，<code>class</code> 表示 <code>对象类型 （实际类型）</code>。即 <code>type x = new class()</code></p>
<p><code>scope</code> 默认为 "page"。</p>
<ul>
<li>如果 <code>只有type</code>，则要求 <code>bean</code> 必须要 <code>已经存在</code></li>
<li>如果 <code>使用class</code> （不管是否有type），则 <code>class不能是抽象类</code>，且 <code>必须有无参构造函数</code></li>

</ul>
</blockquote>
<p>&nbsp;</p>
<blockquote><ul>
<li>设置 <code>JavaBean</code> 的 <code>属性</code> 为 <code>相应的请求参数</code></li>

</ul>
<pre><code class="language-jsp" lang="jsp">&lt;!-- 使用 Java-Language Expression --&gt;
&lt;jsp:setProperty name="person" property="name" value="&lt;%= request.getParameter("username")%&gt;" /&gt;
&lt;!-- 直接使用 param属性 (甚至当 表单的请求参数名 与 JavaBean的性质名 相等时，可以直接省略 param) --&gt;
&lt;!-- 更进一步的，如果 所有的参数名与性质名 都相等，可以使用 param="*" --&gt;
&lt;jsp:setProperty name="person" property="name" param="userName" /&gt;
</code></pre>
</blockquote>
<blockquote><ul>
<li>setProperty 的 <code>自动类型转化</code>：<code>String -&gt; Primitive</code></li>

</ul>
<pre><code class="language-xml" lang="xml">&lt;!-- 下列这些会自动转化 --&gt;
&lt;jsp:setProperty name="person" property="*" /&gt;
&lt;jsp:setProperty name="person" property="empID" /&gt;
&lt;jsp:setProperty name="person" property="empID" value="343" /&gt;
&lt;jsp:setProperty name="person" property="empID" param="343" /&gt;
&lt;!-- 如果使用脚本，则不会自动转化(此时保证类型正确是你的责任) --&gt;
&lt;jsp:setProperty name="person" property="empID" value="&lt;%= request.getParameter("empID") %&gt;" /&gt;
</code></pre>
</blockquote>
<blockquote><ul>
<li>getProperty</li>

</ul>
<pre><code class="language-jsp" lang="jsp">&lt;html&gt;
    &lt;jsp:useBean id="person" class="foo.Person" scope="request" /&gt;
    Dog's name is: &lt;%= ((foo.Person) request.getAttribute("person")).getDog().getName() %&gt;
	&lt;!-- equals to--&gt;
    Dog's name is: ${person.dog.name}
&lt;/html&gt;    
</code></pre>
<blockquote><p>注意：<code>&lt;jsp:getProperty&gt;</code> 只能访问 <code>bean属性的性质</code>，它无法访问 <code>嵌套性质</code> （如 person.dog.name）</p>
</blockquote>
</blockquote>
<blockquote><ul>
<li><p><code>EL表达式的隐式对象</code>：映射对象 （<code>pageScope</code>，<code>requestScope</code>，<code>sessionScope</code>，<code>applicationScope</code>，<code>param</code> ，<code>paramValues</code>，<code>header</code>，<code>headerValues</code>，<code>cookie</code>，<code>initParam (上下文初始化参数，而不是Servlet初始化参数)</code>），非映射对象 （<code>pageContext</code>）。</p>
<blockquote><p>即 <code>pageContext隐式对象</code> 是 <code>JavaBean</code>，<code>其他隐式对象</code> 是 <code>Map</code></p>
</blockquote>
</li>

</ul>
</blockquote>
<blockquote><ul>
<li><code>点号操作符</code> 与 <code>中括号操作符</code></li>

</ul>
<div contenteditable="true" spellcheck="false" class="mathjax-block md-end-block md-math-block md-rawblock" id="mathjax-n391" cid="n391" mdtype="math_block" data-math-tag-before="0" data-math-tag-after="0" data-math-labels="[]"><div class="md-rawblock-container md-math-container" tabindex="-1"><mjx-container class="MathJax" jax="SVG" display="true" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="30.625ex" height="5.428ex" role="img" focusable="false" viewBox="0 -1449.5 13536.3 2399" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -2.148ex;" class="in-text-selection"><defs><path id="MJX-3-TEX-S3-7B" d="M618 -943L612 -949H582L568 -943Q472 -903 411 -841T332 -703Q327 -682 327 -653T325 -350Q324 -28 323 -18Q317 24 301 61T264 124T221 171T179 205T147 225T132 234Q130 238 130 250Q130 255 130 258T131 264T132 267T134 269T139 272T144 275Q207 308 256 367Q310 436 323 519Q324 529 325 851Q326 1124 326 1154T332 1205Q369 1358 566 1443L582 1450H612L618 1444V1429Q618 1413 616 1411L608 1406Q599 1402 585 1393T552 1372T515 1343T479 1305T449 1257T429 1200Q425 1180 425 1152T423 851Q422 579 422 549T416 498Q407 459 388 424T346 364T297 318T250 284T214 264T197 254L188 251L205 242Q290 200 345 138T416 3Q421 -18 421 -48T423 -349Q423 -397 423 -472Q424 -677 428 -694Q429 -697 429 -699Q434 -722 443 -743T465 -782T491 -816T519 -845T548 -868T574 -886T595 -899T610 -908L616 -910Q618 -912 618 -928V-943Z"></path><path id="MJX-3-TEX-N-4D" d="M132 622Q125 629 121 631T105 634T62 637H29V683H135Q221 683 232 682T249 675Q250 674 354 398L458 124L562 398Q666 674 668 675Q671 681 683 682T781 683H887V637H854Q814 636 803 634T785 622V61Q791 51 802 49T854 46H887V0H876Q855 3 736 3Q605 3 596 0H585V46H618Q660 47 669 49T688 61V347Q688 424 688 461T688 546T688 613L687 632Q454 14 450 7Q446 1 430 1T410 7Q409 9 292 316L176 624V606Q175 588 175 543T175 463T175 356L176 86Q187 50 261 46H278V0H269Q254 3 154 3Q52 3 37 0H29V46H46Q78 48 98 56T122 69T132 86V622Z"></path><path id="MJX-3-TEX-N-61" d="M137 305T115 305T78 320T63 359Q63 394 97 421T218 448Q291 448 336 416T396 340Q401 326 401 309T402 194V124Q402 76 407 58T428 40Q443 40 448 56T453 109V145H493V106Q492 66 490 59Q481 29 455 12T400 -6T353 12T329 54V58L327 55Q325 52 322 49T314 40T302 29T287 17T269 6T247 -2T221 -8T190 -11Q130 -11 82 20T34 107Q34 128 41 147T68 188T116 225T194 253T304 268H318V290Q318 324 312 340Q290 411 215 411Q197 411 181 410T156 406T148 403Q170 388 170 359Q170 334 154 320ZM126 106Q126 75 150 51T209 26Q247 26 276 49T315 109Q317 116 318 175Q318 233 317 233Q309 233 296 232T251 223T193 203T147 166T126 106Z"></path><path id="MJX-3-TEX-N-70" d="M36 -148H50Q89 -148 97 -134V-126Q97 -119 97 -107T97 -77T98 -38T98 6T98 55T98 106Q98 140 98 177T98 243T98 296T97 335T97 351Q94 370 83 376T38 385H20V408Q20 431 22 431L32 432Q42 433 61 434T98 436Q115 437 135 438T165 441T176 442H179V416L180 390L188 397Q247 441 326 441Q407 441 464 377T522 216Q522 115 457 52T310 -11Q242 -11 190 33L182 40V-45V-101Q182 -128 184 -134T195 -145Q216 -148 244 -148H260V-194H252L228 -193Q205 -192 178 -192T140 -191Q37 -191 28 -194H20V-148H36ZM424 218Q424 292 390 347T305 402Q234 402 182 337V98Q222 26 294 26Q345 26 384 80T424 218Z"></path><path id="MJX-3-TEX-N-2E" d="M78 60Q78 84 95 102T138 120Q162 120 180 104T199 61Q199 36 182 18T139 0T96 17T78 60Z"></path><path id="MJX-3-TEX-I-1D43E" d="M285 628Q285 635 228 637Q205 637 198 638T191 647Q191 649 193 661Q199 681 203 682Q205 683 214 683H219Q260 681 355 681Q389 681 418 681T463 682T483 682Q500 682 500 674Q500 669 497 660Q496 658 496 654T495 648T493 644T490 641T486 639T479 638T470 637T456 637Q416 636 405 634T387 623L306 305Q307 305 490 449T678 597Q692 611 692 620Q692 635 667 637Q651 637 651 648Q651 650 654 662T659 677Q662 682 676 682Q680 682 711 681T791 680Q814 680 839 681T869 682Q889 682 889 672Q889 650 881 642Q878 637 862 637Q787 632 726 586Q710 576 656 534T556 455L509 418L518 396Q527 374 546 329T581 244Q656 67 661 61Q663 59 666 57Q680 47 717 46H738Q744 38 744 37T741 19Q737 6 731 0H720Q680 3 625 3Q503 3 488 0H478Q472 6 472 9T474 27Q478 40 480 43T491 46H494Q544 46 544 71Q544 75 517 141T485 216L427 354L359 301L291 248L268 155Q245 63 245 58Q245 51 253 49T303 46H334Q340 37 340 35Q340 19 333 5Q328 0 317 0Q314 0 280 1T180 2Q118 2 85 2T49 1Q31 1 31 11Q31 13 34 25Q38 41 42 43T65 46Q92 46 125 49Q139 52 144 61Q147 65 216 339T285 628Z"></path><path id="MJX-3-TEX-I-1D452" d="M39 168Q39 225 58 272T107 350T174 402T244 433T307 442H310Q355 442 388 420T421 355Q421 265 310 237Q261 224 176 223Q139 223 138 221Q138 219 132 186T125 128Q125 81 146 54T209 26T302 45T394 111Q403 121 406 121Q410 121 419 112T429 98T420 82T390 55T344 24T281 -1T205 -11Q126 -11 83 42T39 168ZM373 353Q367 405 305 405Q272 405 244 391T199 357T170 316T154 280T149 261Q149 260 169 260Q282 260 327 284T373 353Z"></path><path id="MJX-3-TEX-I-1D466" d="M21 287Q21 301 36 335T84 406T158 442Q199 442 224 419T250 355Q248 336 247 334Q247 331 231 288T198 191T182 105Q182 62 196 45T238 27Q261 27 281 38T312 61T339 94Q339 95 344 114T358 173T377 247Q415 397 419 404Q432 431 462 431Q475 431 483 424T494 412T496 403Q496 390 447 193T391 -23Q363 -106 294 -155T156 -205Q111 -205 77 -183T43 -117Q43 -95 50 -80T69 -58T89 -48T106 -45Q150 -45 150 -87Q150 -107 138 -122T115 -142T102 -147L99 -148Q101 -153 118 -160T152 -167H160Q177 -167 186 -165Q219 -156 247 -127T290 -65T313 -9T321 21L315 17Q309 13 296 6T270 -6Q250 -11 231 -11Q185 -11 150 11T104 82Q103 89 103 113Q103 170 138 262T173 379Q173 380 173 381Q173 390 173 393T169 400T158 404H154Q131 404 112 385T82 344T65 302T57 280Q55 278 41 278H27Q21 284 21 287Z"></path><path id="MJX-3-TEX-N-4A" d="M89 177Q115 177 133 160T152 112Q152 88 137 72T102 52Q99 51 101 49Q106 43 129 29Q159 15 190 15Q232 15 256 48T286 126Q286 127 286 142T286 183T286 238T287 306T287 378Q287 403 287 429T287 479T287 524T286 563T286 593T286 614V621Q281 630 263 633T182 637H154V683H166Q187 680 332 680Q439 680 457 683H465V637H449Q422 637 401 634Q393 631 389 623Q388 621 388 376T387 123Q377 61 322 20T194 -22Q188 -22 177 -21T160 -20Q96 -9 61 29T25 110Q25 144 44 160T89 177Z"></path><path id="MJX-3-TEX-N-76" d="M338 431Q344 429 422 429Q479 429 503 431H508V385H497Q439 381 423 345Q421 341 356 172T288 -2Q283 -11 263 -11Q244 -11 239 -2Q99 359 98 364Q93 378 82 381T43 385H19V431H25L33 430Q41 430 53 430T79 430T104 429T122 428Q217 428 232 431H240V385H226Q187 384 184 370Q184 366 235 234L286 102L377 341V349Q377 363 367 372T349 383T335 385H331V431H338Z"></path><path id="MJX-3-TEX-N-42" d="M131 622Q124 629 120 631T104 634T61 637H28V683H229H267H346Q423 683 459 678T531 651Q574 627 599 590T624 512Q624 461 583 419T476 360L466 357Q539 348 595 302T651 187Q651 119 600 67T469 3Q456 1 242 0H28V46H61Q103 47 112 49T131 61V622ZM511 513Q511 560 485 594T416 636Q415 636 403 636T371 636T333 637Q266 637 251 636T232 628Q229 624 229 499V374H312L396 375L406 377Q410 378 417 380T442 393T474 417T499 456T511 513ZM537 188Q537 239 509 282T430 336L329 337H229V200V116Q229 57 234 52Q240 47 334 47H383Q425 47 443 53Q486 67 511 104T537 188Z"></path><path id="MJX-3-TEX-N-65" d="M28 218Q28 273 48 318T98 391T163 433T229 448Q282 448 320 430T378 380T406 316T415 245Q415 238 408 231H126V216Q126 68 226 36Q246 30 270 30Q312 30 342 62Q359 79 369 104L379 128Q382 131 395 131H398Q415 131 415 121Q415 117 412 108Q393 53 349 21T250 -11Q155 -11 92 58T28 218ZM333 275Q322 403 238 411H236Q228 411 220 410T195 402T166 381T143 340T127 274V267H333V275Z"></path><path id="MJX-3-TEX-N-6E" d="M41 46H55Q94 46 102 60V68Q102 77 102 91T102 122T103 161T103 203Q103 234 103 269T102 328V351Q99 370 88 376T43 385H25V408Q25 431 27 431L37 432Q47 433 65 434T102 436Q119 437 138 438T167 441T178 442H181V402Q181 364 182 364T187 369T199 384T218 402T247 421T285 437Q305 442 336 442Q450 438 463 329Q464 322 464 190V104Q464 66 466 59T477 49Q498 46 526 46H542V0H534L510 1Q487 2 460 2T422 3Q319 3 310 0H302V46H318Q379 46 379 62Q380 64 380 200Q379 335 378 343Q372 371 358 385T334 402T308 404Q263 404 229 370Q202 343 195 315T187 232V168V108Q187 78 188 68T191 55T200 49Q221 46 249 46H265V0H257L234 1Q210 2 183 2T145 3Q42 3 33 0H25V46H41Z"></path><path id="MJX-3-TEX-I-1D443" d="M287 628Q287 635 230 637Q206 637 199 638T192 648Q192 649 194 659Q200 679 203 681T397 683Q587 682 600 680Q664 669 707 631T751 530Q751 453 685 389Q616 321 507 303Q500 302 402 301H307L277 182Q247 66 247 59Q247 55 248 54T255 50T272 48T305 46H336Q342 37 342 35Q342 19 335 5Q330 0 319 0Q316 0 282 1T182 2Q120 2 87 2T51 1Q33 1 33 11Q33 13 36 25Q40 41 44 43T67 46Q94 46 127 49Q141 52 146 61Q149 65 218 339T287 628ZM645 554Q645 567 643 575T634 597T609 619T560 635Q553 636 480 637Q463 637 445 637T416 636T404 636Q391 635 386 627Q384 621 367 550T332 412T314 344Q314 342 395 342H407H430Q542 342 590 392Q617 419 631 471T645 554Z"></path><path id="MJX-3-TEX-I-1D45F" d="M21 287Q22 290 23 295T28 317T38 348T53 381T73 411T99 433T132 442Q161 442 183 430T214 408T225 388Q227 382 228 382T236 389Q284 441 347 441H350Q398 441 422 400Q430 381 430 363Q430 333 417 315T391 292T366 288Q346 288 334 299T322 328Q322 376 378 392Q356 405 342 405Q286 405 239 331Q229 315 224 298T190 165Q156 25 151 16Q138 -11 108 -11Q95 -11 87 -5T76 7T74 17Q74 30 114 189T154 366Q154 405 128 405Q107 405 92 377T68 316T57 280Q55 278 41 278H27Q21 284 21 287Z"></path><path id="MJX-3-TEX-I-1D45C" d="M201 -11Q126 -11 80 38T34 156Q34 221 64 279T146 380Q222 441 301 441Q333 441 341 440Q354 437 367 433T402 417T438 387T464 338T476 268Q476 161 390 75T201 -11ZM121 120Q121 70 147 48T206 26Q250 26 289 58T351 142Q360 163 374 216T388 308Q388 352 370 375Q346 405 306 405Q243 405 195 347Q158 303 140 230T121 120Z"></path><path id="MJX-3-TEX-I-1D45D" d="M23 287Q24 290 25 295T30 317T40 348T55 381T75 411T101 433T134 442Q209 442 230 378L240 387Q302 442 358 442Q423 442 460 395T497 281Q497 173 421 82T249 -10Q227 -10 210 -4Q199 1 187 11T168 28L161 36Q160 35 139 -51T118 -138Q118 -144 126 -145T163 -148H188Q194 -155 194 -157T191 -175Q188 -187 185 -190T172 -194Q170 -194 161 -194T127 -193T65 -192Q-5 -192 -24 -194H-32Q-39 -187 -39 -183Q-37 -156 -26 -148H-6Q28 -147 33 -136Q36 -130 94 103T155 350Q156 355 156 364Q156 405 131 405Q109 405 94 377T71 316T59 280Q57 278 43 278H29Q23 284 23 287ZM178 102Q200 26 252 26Q282 26 310 49T356 107Q374 141 392 215T411 325V331Q411 405 350 405Q339 405 328 402T306 393T286 380T269 365T254 350T243 336T235 326L232 322Q232 321 229 308T218 264T204 212Q178 106 178 102Z"></path><path id="MJX-3-TEX-I-1D461" d="M26 385Q19 392 19 395Q19 399 22 411T27 425Q29 430 36 430T87 431H140L159 511Q162 522 166 540T173 566T179 586T187 603T197 615T211 624T229 626Q247 625 254 615T261 596Q261 589 252 549T232 470L222 433Q222 431 272 431H323Q330 424 330 420Q330 398 317 385H210L174 240Q135 80 135 68Q135 26 162 26Q197 26 230 60T283 144Q285 150 288 151T303 153H307Q322 153 322 145Q322 142 319 133Q314 117 301 95T267 48T216 6T155 -11Q125 -11 98 4T59 56Q57 64 57 83V101L92 241Q127 382 128 383Q128 385 77 385H26Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mtable"><g data-mml-node="mtr"><g data-mml-node="mtd"><g data-mml-node="mtext"><text data-variant="normal" transform="scale(1,-1)" font-size="827.1px" font-family="serif">点</text><text data-variant="normal" transform="translate(826.7,0) scale(1,-1)" font-size="827.1px" font-family="serif">号</text><text data-variant="normal" transform="translate(1653.5,0) scale(1,-1)" font-size="827.1px" font-family="serif">操</text><text data-variant="normal" transform="translate(2480.2,0) scale(1,-1)" font-size="827.1px" font-family="serif">作</text><text data-variant="normal" transform="translate(3306.9,0) scale(1,-1)" font-size="827.1px" font-family="serif">符</text></g><g data-mml-node="mrow" transform="translate(4300.3,0)"><g data-mml-node="mo" transform="translate(0 -0.5)"><use data-c="7B" xlink:href="#MJX-3-TEX-S3-7B"></use></g><g data-mml-node="mtable" transform="translate(750,0)"><g data-mml-node="mtr" transform="translate(0,650)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="4D" xlink:href="#MJX-3-TEX-N-4D"></use><use data-c="61" xlink:href="#MJX-3-TEX-N-61" transform="translate(917,0)"></use><use data-c="70" xlink:href="#MJX-3-TEX-N-70" transform="translate(1417,0)"></use><use data-c="2E" xlink:href="#MJX-3-TEX-N-2E" transform="translate(1973,0)"></use></g><g data-mml-node="mi" transform="translate(2251,0)"><use data-c="1D43E" xlink:href="#MJX-3-TEX-I-1D43E"></use></g><g data-mml-node="mi" transform="translate(3140,0)"><use data-c="1D452" xlink:href="#MJX-3-TEX-I-1D452"></use></g><g data-mml-node="mi" transform="translate(3606,0)"><use data-c="1D466" xlink:href="#MJX-3-TEX-I-1D466"></use></g></g></g><g data-mml-node="mtr" transform="translate(0,-650)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="4A" xlink:href="#MJX-3-TEX-N-4A"></use><use data-c="61" xlink:href="#MJX-3-TEX-N-61" transform="translate(514,0)"></use><use data-c="76" xlink:href="#MJX-3-TEX-N-76" transform="translate(1014,0)"></use><use data-c="61" xlink:href="#MJX-3-TEX-N-61" transform="translate(1542,0)"></use><use data-c="42" xlink:href="#MJX-3-TEX-N-42" transform="translate(2042,0)"></use><use data-c="65" xlink:href="#MJX-3-TEX-N-65" transform="translate(2750,0)"></use><use data-c="61" xlink:href="#MJX-3-TEX-N-61" transform="translate(3194,0)"></use><use data-c="6E" xlink:href="#MJX-3-TEX-N-6E" transform="translate(3694,0)"></use><use data-c="2E" xlink:href="#MJX-3-TEX-N-2E" transform="translate(4250,0)"></use></g><g data-mml-node="mi" transform="translate(4528,0)"><use data-c="1D443" xlink:href="#MJX-3-TEX-I-1D443"></use></g><g data-mml-node="mi" transform="translate(5279,0)"><use data-c="1D45F" xlink:href="#MJX-3-TEX-I-1D45F"></use></g><g data-mml-node="mi" transform="translate(5730,0)"><use data-c="1D45C" xlink:href="#MJX-3-TEX-I-1D45C"></use></g><g data-mml-node="mi" transform="translate(6215,0)"><use data-c="1D45D" xlink:href="#MJX-3-TEX-I-1D45D"></use></g><g data-mml-node="mi" transform="translate(6718,0)"><use data-c="1D452" xlink:href="#MJX-3-TEX-I-1D452"></use></g><g data-mml-node="mi" transform="translate(7184,0)"><use data-c="1D45F" xlink:href="#MJX-3-TEX-I-1D45F"></use></g><g data-mml-node="mi" transform="translate(7635,0)"><use data-c="1D461" xlink:href="#MJX-3-TEX-I-1D461"></use></g><g data-mml-node="mi" transform="translate(7996,0)"><use data-c="1D466" xlink:href="#MJX-3-TEX-I-1D466"></use></g></g></g></g><g data-mml-node="mo" transform="translate(9236,0) translate(0 250)"></g></g></g></g></g></g></g></svg></mjx-container></div></div>
<div contenteditable="true" spellcheck="false" class="mathjax-block md-end-block md-math-block md-rawblock" id="mathjax-n392" cid="n392" mdtype="math_block" data-math-tag-before="0" data-math-tag-after="0" data-math-labels="[]"><div class="md-rawblock-container md-math-container" tabindex="-1"><mjx-container class="MathJax" jax="SVG" display="true" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="42.645ex" height="8.145ex" role="img" focusable="false" viewBox="0 -2050 18848.9 3600" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -3.507ex;" class="in-text-selection"><defs><path id="MJX-4-TEX-S4-23A7" d="M712 899L718 893V876V865Q718 854 704 846Q627 793 577 710T510 525Q510 524 509 521Q505 493 504 349Q504 345 504 334Q504 277 504 240Q504 -2 503 -4Q502 -8 494 -9T444 -10Q392 -10 390 -9Q387 -8 386 -5Q384 5 384 230Q384 262 384 312T383 382Q383 481 392 535T434 656Q510 806 664 892L677 899H712Z"></path><path id="MJX-4-TEX-S4-23A9" d="M718 -893L712 -899H677L666 -893Q542 -825 468 -714T385 -476Q384 -466 384 -282Q384 3 385 5L389 9Q392 10 444 10Q486 10 494 9T503 4Q504 2 504 -239V-310V-366Q504 -470 508 -513T530 -609Q546 -657 569 -698T617 -767T661 -812T699 -843T717 -856T718 -876V-893Z"></path><path id="MJX-4-TEX-S4-23A8" d="M389 1159Q391 1160 455 1160Q496 1160 498 1159Q501 1158 502 1155Q504 1145 504 924Q504 691 503 682Q494 549 425 439T243 259L229 250L243 241Q349 175 421 66T503 -182Q504 -191 504 -424Q504 -600 504 -629T499 -659H498Q496 -660 444 -660T390 -659Q387 -658 386 -655Q384 -645 384 -425V-282Q384 -176 377 -116T342 10Q325 54 301 92T255 155T214 196T183 222T171 232Q170 233 170 250T171 268Q171 269 191 284T240 331T300 407T354 524T383 679Q384 691 384 925Q384 1152 385 1155L389 1159Z"></path><path id="MJX-4-TEX-S4-23AA" d="M384 150V266Q384 304 389 309Q391 310 455 310Q496 310 498 309Q502 308 503 298Q504 283 504 150Q504 32 504 12T499 -9H498Q496 -10 444 -10T390 -9Q386 -8 385 2Q384 17 384 150Z"></path><path id="MJX-4-TEX-I-1D43F" d="M228 637Q194 637 192 641Q191 643 191 649Q191 673 202 682Q204 683 217 683Q271 680 344 680Q485 680 506 683H518Q524 677 524 674T522 656Q517 641 513 637H475Q406 636 394 628Q387 624 380 600T313 336Q297 271 279 198T252 88L243 52Q243 48 252 48T311 46H328Q360 46 379 47T428 54T478 72T522 106T564 161Q580 191 594 228T611 270Q616 273 628 273H641Q647 264 647 262T627 203T583 83T557 9Q555 4 553 3T537 0T494 -1Q483 -1 418 -1T294 0H116Q32 0 32 10Q32 17 34 24Q39 43 44 45Q48 46 59 46H65Q92 46 125 49Q139 52 144 61Q147 65 216 339T285 628Q285 635 228 637Z"></path><path id="MJX-4-TEX-I-1D456" d="M184 600Q184 624 203 642T247 661Q265 661 277 649T290 619Q290 596 270 577T226 557Q211 557 198 567T184 600ZM21 287Q21 295 30 318T54 369T98 420T158 442Q197 442 223 419T250 357Q250 340 236 301T196 196T154 83Q149 61 149 51Q149 26 166 26Q175 26 185 29T208 43T235 78T260 137Q263 149 265 151T282 153Q302 153 302 143Q302 135 293 112T268 61T223 11T161 -11Q129 -11 102 10T74 74Q74 91 79 106T122 220Q160 321 166 341T173 380Q173 404 156 404H154Q124 404 99 371T61 287Q60 286 59 284T58 281T56 279T53 278T49 278T41 278H27Q21 284 21 287Z"></path><path id="MJX-4-TEX-I-1D460" d="M131 289Q131 321 147 354T203 415T300 442Q362 442 390 415T419 355Q419 323 402 308T364 292Q351 292 340 300T328 326Q328 342 337 354T354 372T367 378Q368 378 368 379Q368 382 361 388T336 399T297 405Q249 405 227 379T204 326Q204 301 223 291T278 274T330 259Q396 230 396 163Q396 135 385 107T352 51T289 7T195 -10Q118 -10 86 19T53 87Q53 126 74 143T118 160Q133 160 146 151T160 120Q160 94 142 76T111 58Q109 57 108 57T107 55Q108 52 115 47T146 34T201 27Q237 27 263 38T301 66T318 97T323 122Q323 150 302 164T254 181T195 196T148 231Q131 256 131 289Z"></path><path id="MJX-4-TEX-I-1D461" d="M26 385Q19 392 19 395Q19 399 22 411T27 425Q29 430 36 430T87 431H140L159 511Q162 522 166 540T173 566T179 586T187 603T197 615T211 624T229 626Q247 625 254 615T261 596Q261 589 252 549T232 470L222 433Q222 431 272 431H323Q330 424 330 420Q330 398 317 385H210L174 240Q135 80 135 68Q135 26 162 26Q197 26 230 60T283 144Q285 150 288 151T303 153H307Q322 153 322 145Q322 142 319 133Q314 117 301 95T267 48T216 6T155 -11Q125 -11 98 4T59 56Q57 64 57 83V101L92 241Q127 382 128 383Q128 385 77 385H26Z"></path><path id="MJX-4-TEX-N-2F" d="M423 750Q432 750 438 744T444 730Q444 725 271 248T92 -240Q85 -250 75 -250Q68 -250 62 -245T56 -231Q56 -221 230 257T407 740Q411 750 423 750Z"></path><path id="MJX-4-TEX-N-5B" d="M118 -250V750H255V710H158V-210H255V-250H118Z"></path><path id="MJX-4-TEX-N-5D" d="M22 710V750H159V-250H22V-210H119V710H22Z"></path><path id="MJX-4-TEX-N-4D" d="M132 622Q125 629 121 631T105 634T62 637H29V683H135Q221 683 232 682T249 675Q250 674 354 398L458 124L562 398Q666 674 668 675Q671 681 683 682T781 683H887V637H854Q814 636 803 634T785 622V61Q791 51 802 49T854 46H887V0H876Q855 3 736 3Q605 3 596 0H585V46H618Q660 47 669 49T688 61V347Q688 424 688 461T688 546T688 613L687 632Q454 14 450 7Q446 1 430 1T410 7Q409 9 292 316L176 624V606Q175 588 175 543T175 463T175 356L176 86Q187 50 261 46H278V0H269Q254 3 154 3Q52 3 37 0H29V46H46Q78 48 98 56T122 69T132 86V622Z"></path><path id="MJX-4-TEX-N-61" d="M137 305T115 305T78 320T63 359Q63 394 97 421T218 448Q291 448 336 416T396 340Q401 326 401 309T402 194V124Q402 76 407 58T428 40Q443 40 448 56T453 109V145H493V106Q492 66 490 59Q481 29 455 12T400 -6T353 12T329 54V58L327 55Q325 52 322 49T314 40T302 29T287 17T269 6T247 -2T221 -8T190 -11Q130 -11 82 20T34 107Q34 128 41 147T68 188T116 225T194 253T304 268H318V290Q318 324 312 340Q290 411 215 411Q197 411 181 410T156 406T148 403Q170 388 170 359Q170 334 154 320ZM126 106Q126 75 150 51T209 26Q247 26 276 49T315 109Q317 116 318 175Q318 233 317 233Q309 233 296 232T251 223T193 203T147 166T126 106Z"></path><path id="MJX-4-TEX-N-70" d="M36 -148H50Q89 -148 97 -134V-126Q97 -119 97 -107T97 -77T98 -38T98 6T98 55T98 106Q98 140 98 177T98 243T98 296T97 335T97 351Q94 370 83 376T38 385H20V408Q20 431 22 431L32 432Q42 433 61 434T98 436Q115 437 135 438T165 441T176 442H179V416L180 390L188 397Q247 441 326 441Q407 441 464 377T522 216Q522 115 457 52T310 -11Q242 -11 190 33L182 40V-45V-101Q182 -128 184 -134T195 -145Q216 -148 244 -148H260V-194H252L228 -193Q205 -192 178 -192T140 -191Q37 -191 28 -194H20V-148H36ZM424 218Q424 292 390 347T305 402Q234 402 182 337V98Q222 26 294 26Q345 26 384 80T424 218Z"></path><path id="MJX-4-TEX-I-1D43E" d="M285 628Q285 635 228 637Q205 637 198 638T191 647Q191 649 193 661Q199 681 203 682Q205 683 214 683H219Q260 681 355 681Q389 681 418 681T463 682T483 682Q500 682 500 674Q500 669 497 660Q496 658 496 654T495 648T493 644T490 641T486 639T479 638T470 637T456 637Q416 636 405 634T387 623L306 305Q307 305 490 449T678 597Q692 611 692 620Q692 635 667 637Q651 637 651 648Q651 650 654 662T659 677Q662 682 676 682Q680 682 711 681T791 680Q814 680 839 681T869 682Q889 682 889 672Q889 650 881 642Q878 637 862 637Q787 632 726 586Q710 576 656 534T556 455L509 418L518 396Q527 374 546 329T581 244Q656 67 661 61Q663 59 666 57Q680 47 717 46H738Q744 38 744 37T741 19Q737 6 731 0H720Q680 3 625 3Q503 3 488 0H478Q472 6 472 9T474 27Q478 40 480 43T491 46H494Q544 46 544 71Q544 75 517 141T485 216L427 354L359 301L291 248L268 155Q245 63 245 58Q245 51 253 49T303 46H334Q340 37 340 35Q340 19 333 5Q328 0 317 0Q314 0 280 1T180 2Q118 2 85 2T49 1Q31 1 31 11Q31 13 34 25Q38 41 42 43T65 46Q92 46 125 49Q139 52 144 61Q147 65 216 339T285 628Z"></path><path id="MJX-4-TEX-I-1D452" d="M39 168Q39 225 58 272T107 350T174 402T244 433T307 442H310Q355 442 388 420T421 355Q421 265 310 237Q261 224 176 223Q139 223 138 221Q138 219 132 186T125 128Q125 81 146 54T209 26T302 45T394 111Q403 121 406 121Q410 121 419 112T429 98T420 82T390 55T344 24T281 -1T205 -11Q126 -11 83 42T39 168ZM373 353Q367 405 305 405Q272 405 244 391T199 357T170 316T154 280T149 261Q149 260 169 260Q282 260 327 284T373 353Z"></path><path id="MJX-4-TEX-I-1D466" d="M21 287Q21 301 36 335T84 406T158 442Q199 442 224 419T250 355Q248 336 247 334Q247 331 231 288T198 191T182 105Q182 62 196 45T238 27Q261 27 281 38T312 61T339 94Q339 95 344 114T358 173T377 247Q415 397 419 404Q432 431 462 431Q475 431 483 424T494 412T496 403Q496 390 447 193T391 -23Q363 -106 294 -155T156 -205Q111 -205 77 -183T43 -117Q43 -95 50 -80T69 -58T89 -48T106 -45Q150 -45 150 -87Q150 -107 138 -122T115 -142T102 -147L99 -148Q101 -153 118 -160T152 -167H160Q177 -167 186 -165Q219 -156 247 -127T290 -65T313 -9T321 21L315 17Q309 13 296 6T270 -6Q250 -11 231 -11Q185 -11 150 11T104 82Q103 89 103 113Q103 170 138 262T173 379Q173 380 173 381Q173 390 173 393T169 400T158 404H154Q131 404 112 385T82 344T65 302T57 280Q55 278 41 278H27Q21 284 21 287Z"></path><path id="MJX-4-TEX-N-4A" d="M89 177Q115 177 133 160T152 112Q152 88 137 72T102 52Q99 51 101 49Q106 43 129 29Q159 15 190 15Q232 15 256 48T286 126Q286 127 286 142T286 183T286 238T287 306T287 378Q287 403 287 429T287 479T287 524T286 563T286 593T286 614V621Q281 630 263 633T182 637H154V683H166Q187 680 332 680Q439 680 457 683H465V637H449Q422 637 401 634Q393 631 389 623Q388 621 388 376T387 123Q377 61 322 20T194 -22Q188 -22 177 -21T160 -20Q96 -9 61 29T25 110Q25 144 44 160T89 177Z"></path><path id="MJX-4-TEX-N-76" d="M338 431Q344 429 422 429Q479 429 503 431H508V385H497Q439 381 423 345Q421 341 356 172T288 -2Q283 -11 263 -11Q244 -11 239 -2Q99 359 98 364Q93 378 82 381T43 385H19V431H25L33 430Q41 430 53 430T79 430T104 429T122 428Q217 428 232 431H240V385H226Q187 384 184 370Q184 366 235 234L286 102L377 341V349Q377 363 367 372T349 383T335 385H331V431H338Z"></path><path id="MJX-4-TEX-N-42" d="M131 622Q124 629 120 631T104 634T61 637H28V683H229H267H346Q423 683 459 678T531 651Q574 627 599 590T624 512Q624 461 583 419T476 360L466 357Q539 348 595 302T651 187Q651 119 600 67T469 3Q456 1 242 0H28V46H61Q103 47 112 49T131 61V622ZM511 513Q511 560 485 594T416 636Q415 636 403 636T371 636T333 637Q266 637 251 636T232 628Q229 624 229 499V374H312L396 375L406 377Q410 378 417 380T442 393T474 417T499 456T511 513ZM537 188Q537 239 509 282T430 336L329 337H229V200V116Q229 57 234 52Q240 47 334 47H383Q425 47 443 53Q486 67 511 104T537 188Z"></path><path id="MJX-4-TEX-N-65" d="M28 218Q28 273 48 318T98 391T163 433T229 448Q282 448 320 430T378 380T406 316T415 245Q415 238 408 231H126V216Q126 68 226 36Q246 30 270 30Q312 30 342 62Q359 79 369 104L379 128Q382 131 395 131H398Q415 131 415 121Q415 117 412 108Q393 53 349 21T250 -11Q155 -11 92 58T28 218ZM333 275Q322 403 238 411H236Q228 411 220 410T195 402T166 381T143 340T127 274V267H333V275Z"></path><path id="MJX-4-TEX-N-6E" d="M41 46H55Q94 46 102 60V68Q102 77 102 91T102 122T103 161T103 203Q103 234 103 269T102 328V351Q99 370 88 376T43 385H25V408Q25 431 27 431L37 432Q47 433 65 434T102 436Q119 437 138 438T167 441T178 442H181V402Q181 364 182 364T187 369T199 384T218 402T247 421T285 437Q305 442 336 442Q450 438 463 329Q464 322 464 190V104Q464 66 466 59T477 49Q498 46 526 46H542V0H534L510 1Q487 2 460 2T422 3Q319 3 310 0H302V46H318Q379 46 379 62Q380 64 380 200Q379 335 378 343Q372 371 358 385T334 402T308 404Q263 404 229 370Q202 343 195 315T187 232V168V108Q187 78 188 68T191 55T200 49Q221 46 249 46H265V0H257L234 1Q210 2 183 2T145 3Q42 3 33 0H25V46H41Z"></path><path id="MJX-4-TEX-I-1D443" d="M287 628Q287 635 230 637Q206 637 199 638T192 648Q192 649 194 659Q200 679 203 681T397 683Q587 682 600 680Q664 669 707 631T751 530Q751 453 685 389Q616 321 507 303Q500 302 402 301H307L277 182Q247 66 247 59Q247 55 248 54T255 50T272 48T305 46H336Q342 37 342 35Q342 19 335 5Q330 0 319 0Q316 0 282 1T182 2Q120 2 87 2T51 1Q33 1 33 11Q33 13 36 25Q40 41 44 43T67 46Q94 46 127 49Q141 52 146 61Q149 65 218 339T287 628ZM645 554Q645 567 643 575T634 597T609 619T560 635Q553 636 480 637Q463 637 445 637T416 636T404 636Q391 635 386 627Q384 621 367 550T332 412T314 344Q314 342 395 342H407H430Q542 342 590 392Q617 419 631 471T645 554Z"></path><path id="MJX-4-TEX-I-1D45F" d="M21 287Q22 290 23 295T28 317T38 348T53 381T73 411T99 433T132 442Q161 442 183 430T214 408T225 388Q227 382 228 382T236 389Q284 441 347 441H350Q398 441 422 400Q430 381 430 363Q430 333 417 315T391 292T366 288Q346 288 334 299T322 328Q322 376 378 392Q356 405 342 405Q286 405 239 331Q229 315 224 298T190 165Q156 25 151 16Q138 -11 108 -11Q95 -11 87 -5T76 7T74 17Q74 30 114 189T154 366Q154 405 128 405Q107 405 92 377T68 316T57 280Q55 278 41 278H27Q21 284 21 287Z"></path><path id="MJX-4-TEX-I-1D45C" d="M201 -11Q126 -11 80 38T34 156Q34 221 64 279T146 380Q222 441 301 441Q333 441 341 440Q354 437 367 433T402 417T438 387T464 338T476 268Q476 161 390 75T201 -11ZM121 120Q121 70 147 48T206 26Q250 26 289 58T351 142Q360 163 374 216T388 308Q388 352 370 375Q346 405 306 405Q243 405 195 347Q158 303 140 230T121 120Z"></path><path id="MJX-4-TEX-I-1D45D" d="M23 287Q24 290 25 295T30 317T40 348T55 381T75 411T101 433T134 442Q209 442 230 378L240 387Q302 442 358 442Q423 442 460 395T497 281Q497 173 421 82T249 -10Q227 -10 210 -4Q199 1 187 11T168 28L161 36Q160 35 139 -51T118 -138Q118 -144 126 -145T163 -148H188Q194 -155 194 -157T191 -175Q188 -187 185 -190T172 -194Q170 -194 161 -194T127 -193T65 -192Q-5 -192 -24 -194H-32Q-39 -187 -39 -183Q-37 -156 -26 -148H-6Q28 -147 33 -136Q36 -130 94 103T155 350Q156 355 156 364Q156 405 131 405Q109 405 94 377T71 316T59 280Q57 278 43 278H29Q23 284 23 287ZM178 102Q200 26 252 26Q282 26 310 49T356 107Q374 141 392 215T411 325V331Q411 405 350 405Q339 405 328 402T306 393T286 380T269 365T254 350T243 336T235 326L232 322Q232 321 229 308T218 264T204 212Q178 106 178 102Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mtable"><g data-mml-node="mtr"><g data-mml-node="mtd"><g data-mml-node="mtext"><text data-variant="normal" transform="scale(1,-1)" font-size="827.1px" font-family="serif">中</text></g><g data-mml-node="mtext" transform="translate(826.7,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="827.1px" font-family="serif">括</text></g><g data-mml-node="mtext" transform="translate(1653.5,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="827.1px" font-family="serif">号</text></g><g data-mml-node="mtext" transform="translate(2480.2,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="827.1px" font-family="serif">操</text></g><g data-mml-node="mtext" transform="translate(3306.9,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="827.1px" font-family="serif">作</text></g><g data-mml-node="mtext" transform="translate(4133.7,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="827.1px" font-family="serif">符</text></g><g data-mml-node="mrow" transform="translate(5127.1,0)"><g data-mml-node="mo"><use data-c="23A7" xlink:href="#MJX-4-TEX-S4-23A7" transform="translate(0,1151)"></use><use data-c="23A9" xlink:href="#MJX-4-TEX-S4-23A9" transform="translate(0,-651)"></use><use data-c="23A8" xlink:href="#MJX-4-TEX-S4-23A8" transform="translate(0,0)"></use><svg width="889" height="181" y="1060" x="0" viewBox="0 31.9 889 181" class="in-text-selection"><use data-c="23AA" xlink:href="#MJX-4-TEX-S4-23AA" transform="scale(1,0.89)"></use></svg><svg width="889" height="181" y="-741" x="0" viewBox="0 31.9 889 181" class="in-text-selection"><use data-c="23AA" xlink:href="#MJX-4-TEX-S4-23AA" transform="scale(1,0.89)"></use></svg></g><g data-mml-node="mtable" transform="translate(889,0)"><g data-mml-node="mtr" transform="translate(0,1300)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mstyle" fill="blue" stroke="blue"><g data-mml-node="mi"><use data-c="1D43F" xlink:href="#MJX-4-TEX-I-1D43F"></use></g><g data-mml-node="mi" transform="translate(681,0)"><use data-c="1D456" xlink:href="#MJX-4-TEX-I-1D456"></use></g><g data-mml-node="mi" transform="translate(1026,0)"><use data-c="1D460" xlink:href="#MJX-4-TEX-I-1D460"></use></g><g data-mml-node="mi" transform="translate(1495,0)"><use data-c="1D461" xlink:href="#MJX-4-TEX-I-1D461"></use></g><g data-mml-node="TeXAtom" data-mjx-texclass="ORD" transform="translate(1856,0)"><g data-mml-node="mo"><use data-c="2F" xlink:href="#MJX-4-TEX-N-2F"></use></g></g><g data-mml-node="mtext" transform="translate(2356,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="827.1px" font-family="serif">数</text></g><g data-mml-node="mtext" transform="translate(3182.7,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="827.1px" font-family="serif">组</text></g></g><g data-mml-node="mo" transform="translate(4009.5,0)"><use data-c="5B" xlink:href="#MJX-4-TEX-N-5B"></use></g><g data-mml-node="mtext" transform="translate(4287.5,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="827.1px" font-family="serif">可</text></g><g data-mml-node="mtext" transform="translate(5114.2,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="827.1px" font-family="serif">被</text></g><g data-mml-node="mtext" transform="translate(5940.9,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="827.1px" font-family="serif">解</text></g><g data-mml-node="mtext" transform="translate(6767.7,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="827.1px" font-family="serif">析</text></g><g data-mml-node="mtext" transform="translate(7594.4,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="827.1px" font-family="serif">为</text></g><g data-mml-node="mtext" transform="translate(8421.1,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="827.1px" font-family="serif">数</text></g><g data-mml-node="mtext" transform="translate(9247.9,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="827.1px" font-family="serif">字</text></g><g data-mml-node="mtext" transform="translate(10074.6,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="827.1px" font-family="serif">的</text></g><g data-mml-node="mtext" transform="translate(10901.3,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="827.1px" font-family="serif">东</text></g><g data-mml-node="mtext" transform="translate(11728.1,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="827.1px" font-family="serif">西</text></g><g data-mml-node="mo" transform="translate(12554.8,0)"><use data-c="5D" xlink:href="#MJX-4-TEX-N-5D"></use></g></g></g><g data-mml-node="mtr" transform="translate(0,0)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="4D" xlink:href="#MJX-4-TEX-N-4D"></use><use data-c="61" xlink:href="#MJX-4-TEX-N-61" transform="translate(917,0)"></use><use data-c="70" xlink:href="#MJX-4-TEX-N-70" transform="translate(1417,0)"></use></g><g data-mml-node="mo" transform="translate(1973,0)"><use data-c="5B" xlink:href="#MJX-4-TEX-N-5B"></use></g><g data-mml-node="mi" transform="translate(2251,0)"><use data-c="1D43E" xlink:href="#MJX-4-TEX-I-1D43E"></use></g><g data-mml-node="mi" transform="translate(3140,0)"><use data-c="1D452" xlink:href="#MJX-4-TEX-I-1D452"></use></g><g data-mml-node="mi" transform="translate(3606,0)"><use data-c="1D466" xlink:href="#MJX-4-TEX-I-1D466"></use></g><g data-mml-node="mo" transform="translate(4096,0)"><use data-c="5D" xlink:href="#MJX-4-TEX-N-5D"></use></g></g></g><g data-mml-node="mtr" transform="translate(0,-1300)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="4A" xlink:href="#MJX-4-TEX-N-4A"></use><use data-c="61" xlink:href="#MJX-4-TEX-N-61" transform="translate(514,0)"></use><use data-c="76" xlink:href="#MJX-4-TEX-N-76" transform="translate(1014,0)"></use><use data-c="61" xlink:href="#MJX-4-TEX-N-61" transform="translate(1542,0)"></use><use data-c="42" xlink:href="#MJX-4-TEX-N-42" transform="translate(2042,0)"></use><use data-c="65" xlink:href="#MJX-4-TEX-N-65" transform="translate(2750,0)"></use><use data-c="61" xlink:href="#MJX-4-TEX-N-61" transform="translate(3194,0)"></use><use data-c="6E" xlink:href="#MJX-4-TEX-N-6E" transform="translate(3694,0)"></use></g><g data-mml-node="mo" transform="translate(4250,0)"><use data-c="5B" xlink:href="#MJX-4-TEX-N-5B"></use></g><g data-mml-node="mi" transform="translate(4528,0)"><use data-c="1D443" xlink:href="#MJX-4-TEX-I-1D443"></use></g><g data-mml-node="mi" transform="translate(5279,0)"><use data-c="1D45F" xlink:href="#MJX-4-TEX-I-1D45F"></use></g><g data-mml-node="mi" transform="translate(5730,0)"><use data-c="1D45C" xlink:href="#MJX-4-TEX-I-1D45C"></use></g><g data-mml-node="mi" transform="translate(6215,0)"><use data-c="1D45D" xlink:href="#MJX-4-TEX-I-1D45D"></use></g><g data-mml-node="mi" transform="translate(6718,0)"><use data-c="1D452" xlink:href="#MJX-4-TEX-I-1D452"></use></g><g data-mml-node="mi" transform="translate(7184,0)"><use data-c="1D45F" xlink:href="#MJX-4-TEX-I-1D45F"></use></g><g data-mml-node="mi" transform="translate(7635,0)"><use data-c="1D461" xlink:href="#MJX-4-TEX-I-1D461"></use></g><g data-mml-node="mi" transform="translate(7996,0)"><use data-c="1D466" xlink:href="#MJX-4-TEX-I-1D466"></use></g><g data-mml-node="mo" transform="translate(8486,0)"><use data-c="5D" xlink:href="#MJX-4-TEX-N-5D"></use></g></g></g></g><g data-mml-node="mo" transform="translate(13721.8,0) translate(0 250)"></g></g></g></g></g></g></g></svg></mjx-container></div></div>
<pre><code class="language-jsp" lang="jsp">${musicMap.Ambient} equals to ${musicMap["Ambient"]}
${musicList["1"]} NOT equals to ${musicList.1} (后者是错误的,因为 点号操作符 严格要求 标识符的命名规范)
</code></pre>
<blockquote><p><code>EL保留字</code> 不能用于 <code>标识符</code>：<code>true</code>，<code>false</code>，<code>null</code>，<code>instanceof</code>，<code>empty</code></p>
</blockquote>
</blockquote>
<blockquote><p><code>requestScope</code> 不是 <code>请求对象 (Request)</code>。</p>
<p>应通过 <code>pageContext</code> 来获得 <code>request</code></p>
<pre><code class="language-jsp" lang="jsp">Method is: ${pageContext.request.method}
</code></pre>
</blockquote>
<blockquote><ul>
<li>使用 <code>作用域隐式对象</code> 来避免 <code>命名冲突</code></li>

</ul>
<pre><code class="language-jsp" lang="jsp">${foo.person.name}
&lt;!-- and --&gt;
${requestScope["foo.person"].name}
</code></pre>
<p>通过 <code>明确地指定</code> <code>作用域</code>，以避免 <code>错误地将foo当作某个作用域中的属性</code></p>
</blockquote>
<blockquote><p>首先，我们知道如下事实：</p>
<ul>
<li><code>servlet的初始化参数</code> 使用 <code>&lt;init-param&gt;</code> 进行配置</li>
<li><code>context的初始化参数</code> 使用 <code>&lt;context-param&gt;</code> 进行配置</li>

</ul>
<p>但是，<code>EL的initParam隐式对象</code> 实际上对应的是 <code>上下文的参数</code> （即它使用 <code>&lt;contex-param&gt;</code> 来进行配置）</p>
</blockquote>
<blockquote><ul>
<li>TLD</li>

</ul>
<pre><code class="language-java" lang="java">package foo;
public class DiceRoller {
    public static int rollDice() {
        return (int) ((Math.random() * 6) + 1);
    }
}
</code></pre>
<pre><code class="language-xml" lang="xml">&lt;taglib ...&gt;
    &lt;tlib-version&gt;1.2&lt;/tlib-version&gt;
    &lt;uri&gt;DiceFunctions&lt;/uri&gt;
    &lt;function&gt;
    	&lt;name&gt;rollIt&lt;/name&gt;
        &lt;function-class&gt;foo.DiceRoller&lt;/function-class&gt;
        &lt;function-signature&gt;int rollDice()&lt;/function-signature&gt;
    &lt;/function&gt;
&lt;/taglib&gt;
</code></pre>
<pre><code class="language-jsp" lang="jsp">&lt;%@ taglib prefix="mine" uri="DiceFunctions" %&gt;
&lt;html&gt;
    &lt;body&gt;
        ${mine:rollIt()}
    &lt;/body&gt;
&lt;/html&gt;
</code></pre>
</blockquote>
<blockquote><p>EL表达式中，<code>除0得到INFINITY</code>，但 <code>模0将得到错误</code></p>
</blockquote>
<blockquote><p><code>EL表达式</code> 对 <code>null</code> 是 <code>友好处理的</code> ：<code>什么也不做</code> 胜过于 <code>抛出错误</code></p>
<p>对于 <code>unknown</code> 和 <code>null</code>，即使 <code>找不到表达式中指定名的属性/性质/键</code>，也仍然会 <code>显示页面</code>。</p>
<ul>
<li>在 <code>算数表达式</code> 中，<code>null</code> 被视为 <code>0</code></li>
<li>在 <code>逻辑表达式</code> 中，<code>null</code> 被视为 <code>false</code></li>

</ul>
</blockquote>
<blockquote><ul>
<li>两种 <code>页面包含机制</code></li>

</ul>
<figure><table>
<thead>
<tr><th>&lt;%@ include file="..."&gt; 指令</th><th>&lt;jsp:include page="..."&gt; 标准动作</th></tr></thead>
<tbody><tr><td>在 <code>转换</code> 时将 <code>全部的源代码</code> 进行 <code>简单的文本粘贴</code>（取得"Header.jsp"文件中的内容，并在转义之前 <code>放入</code> 到 <code>Contact.jsp</code> 中）：<br>out.write("the content of Header.jsp");</td><td>在 <code>运行时</code> 进行 <code>调用</code>：<br>org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Header.jsp", out, false)</td></tr></tbody>
</table></figure>
<blockquote><p><code>被包含的页面</code> 不能 <code>修改响应状态码</code> 或 <code>设置首部</code>。如果尝试这么做，不会 <code>得到错误</code>，而仅仅是 <code>结果达不到预期的目标</code></p>
</blockquote>
<blockquote><p>在 <code>可重用组件</code> 中不应该编写 <code>HTMl</code> 或 <code>BODY</code> 标签，以避免 <code>标签嵌套</code></p>
</blockquote>
</blockquote>
<blockquote><p><code>&lt;jsp:forward&gt;</code> 的 响应缓存区 会在 <code>转发</code> 之前 <code>被清空</code>：故 <code>不要先刷新输出</code> 然后再 <code>转发</code></p>
<blockquote><p>如果在 <code>转发</code> 之前 <code>已经刷新了响应缓冲区 （提交了响应）</code>，则会将 <code>刷新输出的内容</code> 发送给 <code>客户</code>，并且不会再 <code>发生转发</code>。</p>
<p>原页面的 <code>剩余部分</code> 不会得到处理。</p>
</blockquote>
</blockquote>
<blockquote><p><code>&lt;jsp:param&gt;</code> 只能用于 <code>&lt;jsp:include&gt;</code> 和 <code>&lt;jsp:forward&gt;</code> 当中。</p>
</blockquote>
<h3>JSTL</h3>
<p><code>JSTL</code> = <code>JSP Standard Tag Library</code></p>
<div contenteditable="true" spellcheck="false" class="mathjax-block md-end-block md-math-block md-rawblock" id="mathjax-n455" cid="n455" mdtype="math_block" data-math-tag-before="0" data-math-tag-after="0" data-math-labels="[]"><div class="md-rawblock-container md-math-container" tabindex="-1"><mjx-container class="MathJax" jax="SVG" display="true" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="36.022ex" height="37.557ex" role="img" focusable="false" viewBox="0 -8550 15921.7 16600" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -18.213ex;" class="in-text-selection"><defs><path id="MJX-5-TEX-N-4A" d="M89 177Q115 177 133 160T152 112Q152 88 137 72T102 52Q99 51 101 49Q106 43 129 29Q159 15 190 15Q232 15 256 48T286 126Q286 127 286 142T286 183T286 238T287 306T287 378Q287 403 287 429T287 479T287 524T286 563T286 593T286 614V621Q281 630 263 633T182 637H154V683H166Q187 680 332 680Q439 680 457 683H465V637H449Q422 637 401 634Q393 631 389 623Q388 621 388 376T387 123Q377 61 322 20T194 -22Q188 -22 177 -21T160 -20Q96 -9 61 29T25 110Q25 144 44 160T89 177Z"></path><path id="MJX-5-TEX-N-53" d="M55 507Q55 590 112 647T243 704H257Q342 704 405 641L426 672Q431 679 436 687T446 700L449 704Q450 704 453 704T459 705H463Q466 705 472 699V462L466 456H448Q437 456 435 459T430 479Q413 605 329 646Q292 662 254 662Q201 662 168 626T135 542Q135 508 152 480T200 435Q210 431 286 412T370 389Q427 367 463 314T500 191Q500 110 448 45T301 -21Q245 -21 201 -4T140 27L122 41Q118 36 107 21T87 -7T78 -21Q76 -22 68 -22H64Q61 -22 55 -16V101Q55 220 56 222Q58 227 76 227H89Q95 221 95 214Q95 182 105 151T139 90T205 42T305 24Q352 24 386 62T420 155Q420 198 398 233T340 281Q284 295 266 300Q261 301 239 306T206 314T174 325T141 343T112 367T85 402Q55 451 55 507Z"></path><path id="MJX-5-TEX-N-54" d="M36 443Q37 448 46 558T55 671V677H666V671Q667 666 676 556T685 443V437H645V443Q645 445 642 478T631 544T610 593Q593 614 555 625Q534 630 478 630H451H443Q417 630 414 618Q413 616 413 339V63Q420 53 439 50T528 46H558V0H545L361 3Q186 1 177 0H164V46H194Q264 46 283 49T309 63V339V550Q309 620 304 625T271 630H244H224Q154 630 119 601Q101 585 93 554T81 486T76 443V437H36V443Z"></path><path id="MJX-5-TEX-N-4C" d="M128 622Q121 629 117 631T101 634T58 637H25V683H36Q48 680 182 680Q324 680 348 683H360V637H333Q273 637 258 635T233 622L232 342V129Q232 57 237 52Q243 47 313 47Q384 47 410 53Q470 70 498 110T536 221Q536 226 537 238T540 261T542 272T562 273H582V268Q580 265 568 137T554 5V0H25V46H58Q100 47 109 49T128 61V622Z"></path><path id="MJX-5-TEX-N-20" d=""></path><path id="MJX-5-TEX-N-43" d="M56 342Q56 428 89 500T174 615T283 681T391 705Q394 705 400 705T408 704Q499 704 569 636L582 624L612 663Q639 700 643 704Q644 704 647 704T653 705H657Q660 705 666 699V419L660 413H626Q620 419 619 430Q610 512 571 572T476 651Q457 658 426 658Q322 658 252 588Q173 509 173 342Q173 221 211 151Q232 111 263 84T328 45T384 29T428 24Q517 24 571 93T626 244Q626 251 632 257H660L666 251V236Q661 133 590 56T403 -21Q262 -21 159 83T56 342Z"></path><path id="MJX-5-TEX-N-6F" d="M28 214Q28 309 93 378T250 448Q340 448 405 380T471 215Q471 120 407 55T250 -10Q153 -10 91 57T28 214ZM250 30Q372 30 372 193V225V250Q372 272 371 288T364 326T348 362T317 390T268 410Q263 411 252 411Q222 411 195 399Q152 377 139 338T126 246V226Q126 130 145 91Q177 30 250 30Z"></path><path id="MJX-5-TEX-N-72" d="M36 46H50Q89 46 97 60V68Q97 77 97 91T98 122T98 161T98 203Q98 234 98 269T98 328L97 351Q94 370 83 376T38 385H20V408Q20 431 22 431L32 432Q42 433 60 434T96 436Q112 437 131 438T160 441T171 442H174V373Q213 441 271 441H277Q322 441 343 419T364 373Q364 352 351 337T313 322Q288 322 276 338T263 372Q263 381 265 388T270 400T273 405Q271 407 250 401Q234 393 226 386Q179 341 179 207V154Q179 141 179 127T179 101T180 81T180 66V61Q181 59 183 57T188 54T193 51T200 49T207 48T216 47T225 47T235 46T245 46H276V0H267Q249 3 140 3Q37 3 28 0H20V46H36Z"></path><path id="MJX-5-TEX-N-65" d="M28 218Q28 273 48 318T98 391T163 433T229 448Q282 448 320 430T378 380T406 316T415 245Q415 238 408 231H126V216Q126 68 226 36Q246 30 270 30Q312 30 342 62Q359 79 369 104L379 128Q382 131 395 131H398Q415 131 415 121Q415 117 412 108Q393 53 349 21T250 -11Q155 -11 92 58T28 218ZM333 275Q322 403 238 411H236Q228 411 220 410T195 402T166 381T143 340T127 274V267H333V275Z"></path><path id="MJX-5-TEX-N-69" d="M69 609Q69 637 87 653T131 669Q154 667 171 652T188 609Q188 579 171 564T129 549Q104 549 87 564T69 609ZM247 0Q232 3 143 3Q132 3 106 3T56 1L34 0H26V46H42Q70 46 91 49Q100 53 102 60T104 102V205V293Q104 345 102 359T88 378Q74 385 41 385H30V408Q30 431 32 431L42 432Q52 433 70 434T106 436Q123 437 142 438T171 441T182 442H185V62Q190 52 197 50T232 46H255V0H247Z"></path><path id="MJX-5-TEX-N-62" d="M307 -11Q234 -11 168 55L158 37Q156 34 153 28T147 17T143 10L138 1L118 0H98V298Q98 599 97 603Q94 622 83 628T38 637H20V660Q20 683 22 683L32 684Q42 685 61 686T98 688Q115 689 135 690T165 693T176 694H179V543Q179 391 180 391L183 394Q186 397 192 401T207 411T228 421T254 431T286 439T323 442Q401 442 461 379T522 216Q522 115 458 52T307 -11ZM182 98Q182 97 187 90T196 79T206 67T218 55T233 44T250 35T271 29T295 26Q330 26 363 46T412 113Q424 148 424 212Q424 287 412 323Q385 405 300 405Q270 405 239 390T188 347L182 339V98Z"></path><path id="MJX-5-TEX-N-61" d="M137 305T115 305T78 320T63 359Q63 394 97 421T218 448Q291 448 336 416T396 340Q401 326 401 309T402 194V124Q402 76 407 58T428 40Q443 40 448 56T453 109V145H493V106Q492 66 490 59Q481 29 455 12T400 -6T353 12T329 54V58L327 55Q325 52 322 49T314 40T302 29T287 17T269 6T247 -2T221 -8T190 -11Q130 -11 82 20T34 107Q34 128 41 147T68 188T116 225T194 253T304 268H318V290Q318 324 312 340Q290 411 215 411Q197 411 181 410T156 406T148 403Q170 388 170 359Q170 334 154 320ZM126 106Q126 75 150 51T209 26Q247 26 276 49T315 109Q317 116 318 175Q318 233 317 233Q309 233 296 232T251 223T193 203T147 166T126 106Z"></path><path id="MJX-5-TEX-N-79" d="M69 -66Q91 -66 104 -80T118 -116Q118 -134 109 -145T91 -160Q84 -163 97 -166Q104 -168 111 -168Q131 -168 148 -159T175 -138T197 -106T213 -75T225 -43L242 0L170 183Q150 233 125 297Q101 358 96 368T80 381Q79 382 78 382Q66 385 34 385H19V431H26L46 430Q65 430 88 429T122 428Q129 428 142 428T171 429T200 430T224 430L233 431H241V385H232Q183 385 185 366L286 112Q286 113 332 227L376 341V350Q376 365 366 373T348 383T334 385H331V431H337H344Q351 431 361 431T382 430T405 429T422 429Q477 429 503 431H508V385H497Q441 380 422 345Q420 343 378 235T289 9T227 -131Q180 -204 113 -204Q69 -204 44 -177T19 -116Q19 -89 35 -78T69 -66Z"></path><path id="MJX-5-TEX-S4-23A7" d="M712 899L718 893V876V865Q718 854 704 846Q627 793 577 710T510 525Q510 524 509 521Q505 493 504 349Q504 345 504 334Q504 277 504 240Q504 -2 503 -4Q502 -8 494 -9T444 -10Q392 -10 390 -9Q387 -8 386 -5Q384 5 384 230Q384 262 384 312T383 382Q383 481 392 535T434 656Q510 806 664 892L677 899H712Z"></path><path id="MJX-5-TEX-S4-23A9" d="M718 -893L712 -899H677L666 -893Q542 -825 468 -714T385 -476Q384 -466 384 -282Q384 3 385 5L389 9Q392 10 444 10Q486 10 494 9T503 4Q504 2 504 -239V-310V-366Q504 -470 508 -513T530 -609Q546 -657 569 -698T617 -767T661 -812T699 -843T717 -856T718 -876V-893Z"></path><path id="MJX-5-TEX-S4-23A8" d="M389 1159Q391 1160 455 1160Q496 1160 498 1159Q501 1158 502 1155Q504 1145 504 924Q504 691 503 682Q494 549 425 439T243 259L229 250L243 241Q349 175 421 66T503 -182Q504 -191 504 -424Q504 -600 504 -629T499 -659H498Q496 -660 444 -660T390 -659Q387 -658 386 -655Q384 -645 384 -425V-282Q384 -176 377 -116T342 10Q325 54 301 92T255 155T214 196T183 222T171 232Q170 233 170 250T171 268Q171 269 191 284T240 331T300 407T354 524T383 679Q384 691 384 925Q384 1152 385 1155L389 1159Z"></path><path id="MJX-5-TEX-S4-23AA" d="M384 150V266Q384 304 389 309Q391 310 455 310Q496 310 498 309Q502 308 503 298Q504 283 504 150Q504 32 504 12T499 -9H498Q496 -10 444 -10T390 -9Q386 -8 385 2Q384 17 384 150Z"></path><path id="MJX-5-TEX-N-3C" d="M694 -11T694 -19T688 -33T678 -40Q671 -40 524 29T234 166L90 235Q83 240 83 250Q83 261 91 266Q664 540 678 540Q681 540 687 534T694 519T687 505Q686 504 417 376L151 250L417 124Q686 -4 687 -5Q694 -11 694 -19Z"></path><path id="MJX-5-TEX-N-63" d="M370 305T349 305T313 320T297 358Q297 381 312 396Q317 401 317 402T307 404Q281 408 258 408Q209 408 178 376Q131 329 131 219Q131 137 162 90Q203 29 272 29Q313 29 338 55T374 117Q376 125 379 127T395 129H409Q415 123 415 120Q415 116 411 104T395 71T366 33T318 2T249 -11Q163 -11 99 53T34 214Q34 318 99 383T250 448T370 421T404 357Q404 334 387 320Z"></path><path id="MJX-5-TEX-N-3A" d="M78 370Q78 394 95 412T138 430Q162 430 180 414T199 371Q199 346 182 328T139 310T96 327T78 370ZM78 60Q78 84 95 102T138 120Q162 120 180 104T199 61Q199 36 182 18T139 0T96 17T78 60Z"></path><path id="MJX-5-TEX-N-75" d="M383 58Q327 -10 256 -10H249Q124 -10 105 89Q104 96 103 226Q102 335 102 348T96 369Q86 385 36 385H25V408Q25 431 27 431L38 432Q48 433 67 434T105 436Q122 437 142 438T172 441T184 442H187V261Q188 77 190 64Q193 49 204 40Q224 26 264 26Q290 26 311 35T343 58T363 90T375 120T379 144Q379 145 379 161T380 201T380 248V315Q380 361 370 372T320 385H302V431Q304 431 378 436T457 442H464V264Q464 84 465 81Q468 61 479 55T524 46H542V0Q540 0 467 -5T390 -11H383V58Z"></path><path id="MJX-5-TEX-N-74" d="M27 422Q80 426 109 478T141 600V615H181V431H316V385H181V241Q182 116 182 100T189 68Q203 29 238 29Q282 29 292 100Q293 108 293 146V181H333V146V134Q333 57 291 17Q264 -10 221 -10Q187 -10 162 2T124 33T105 68T98 100Q97 107 97 248V385H18V422H27Z"></path><path id="MJX-5-TEX-N-3E" d="M84 520Q84 528 88 533T96 539L99 540Q106 540 253 471T544 334L687 265Q694 260 694 250T687 235Q685 233 395 96L107 -40H101Q83 -38 83 -20Q83 -19 83 -17Q82 -10 98 -1Q117 9 248 71Q326 108 378 132L626 250L378 368Q90 504 86 509Q84 513 84 520Z"></path><path id="MJX-5-TEX-N-73" d="M295 316Q295 356 268 385T190 414Q154 414 128 401Q98 382 98 349Q97 344 98 336T114 312T157 287Q175 282 201 278T245 269T277 256Q294 248 310 236T342 195T359 133Q359 71 321 31T198 -10H190Q138 -10 94 26L86 19L77 10Q71 4 65 -1L54 -11H46H42Q39 -11 33 -5V74V132Q33 153 35 157T45 162H54Q66 162 70 158T75 146T82 119T101 77Q136 26 198 26Q295 26 295 104Q295 133 277 151Q257 175 194 187T111 210Q75 227 54 256T33 318Q33 357 50 384T93 424T143 442T187 447H198Q238 447 268 432L283 424L292 431Q302 440 314 448H322H326Q329 448 335 442V310L329 304H301Q295 310 295 316Z"></path><path id="MJX-5-TEX-N-6D" d="M41 46H55Q94 46 102 60V68Q102 77 102 91T102 122T103 161T103 203Q103 234 103 269T102 328V351Q99 370 88 376T43 385H25V408Q25 431 27 431L37 432Q47 433 65 434T102 436Q119 437 138 438T167 441T178 442H181V402Q181 364 182 364T187 369T199 384T218 402T247 421T285 437Q305 442 336 442Q351 442 364 440T387 434T406 426T421 417T432 406T441 395T448 384T452 374T455 366L457 361L460 365Q463 369 466 373T475 384T488 397T503 410T523 422T546 432T572 439T603 442Q729 442 740 329Q741 322 741 190V104Q741 66 743 59T754 49Q775 46 803 46H819V0H811L788 1Q764 2 737 2T699 3Q596 3 587 0H579V46H595Q656 46 656 62Q657 64 657 200Q656 335 655 343Q649 371 635 385T611 402T585 404Q540 404 506 370Q479 343 472 315T464 232V168V108Q464 78 465 68T468 55T477 49Q498 46 526 46H542V0H534L510 1Q487 2 460 2T422 3Q319 3 310 0H302V46H318Q379 46 379 62Q380 64 380 200Q379 335 378 343Q372 371 358 385T334 402T308 404Q263 404 229 370Q202 343 195 315T187 232V168V108Q187 78 188 68T191 55T200 49Q221 46 249 46H265V0H257L234 1Q210 2 183 2T145 3Q42 3 33 0H25V46H41Z"></path><path id="MJX-5-TEX-N-76" d="M338 431Q344 429 422 429Q479 429 503 431H508V385H497Q439 381 423 345Q421 341 356 172T288 -2Q283 -11 263 -11Q244 -11 239 -2Q99 359 98 364Q93 378 82 381T43 385H19V431H25L33 430Q41 430 53 430T79 430T104 429T122 428Q217 428 232 431H240V385H226Q187 384 184 370Q184 366 235 234L286 102L377 341V349Q377 363 367 372T349 383T335 385H331V431H338Z"></path><path id="MJX-5-TEX-N-68" d="M41 46H55Q94 46 102 60V68Q102 77 102 91T102 124T102 167T103 217T103 272T103 329Q103 366 103 407T103 482T102 542T102 586T102 603Q99 622 88 628T43 637H25V660Q25 683 27 683L37 684Q47 685 66 686T103 688Q120 689 140 690T170 693T181 694H184V367Q244 442 328 442Q451 442 463 329Q464 322 464 190V104Q464 66 466 59T477 49Q498 46 526 46H542V0H534L510 1Q487 2 460 2T422 3Q319 3 310 0H302V46H318Q379 46 379 62Q380 64 380 200Q379 335 378 343Q372 371 358 385T334 402T308 404Q263 404 229 370Q202 343 195 315T187 232V168V108Q187 78 188 68T191 55T200 49Q221 46 249 46H265V0H257L234 1Q210 2 183 2T145 3Q42 3 33 0H25V46H41Z"></path><path id="MJX-5-TEX-N-66" d="M273 0Q255 3 146 3Q43 3 34 0H26V46H42Q70 46 91 49Q99 52 103 60Q104 62 104 224V385H33V431H104V497L105 564L107 574Q126 639 171 668T266 704Q267 704 275 704T289 705Q330 702 351 679T372 627Q372 604 358 590T321 576T284 590T270 627Q270 647 288 667H284Q280 668 273 668Q245 668 223 647T189 592Q183 572 182 497V431H293V385H185V225Q185 63 186 61T189 57T194 54T199 51T206 49T213 48T222 47T231 47T241 46T251 46H282V0H273Z"></path><path id="MJX-5-TEX-N-77" d="M90 368Q84 378 76 380T40 385H18V431H24L43 430Q62 430 84 429T116 428Q206 428 221 431H229V385H215Q177 383 177 368Q177 367 221 239L265 113L339 328L333 345Q323 374 316 379Q308 384 278 385H258V431H264Q270 428 348 428Q439 428 454 431H461V385H452Q404 385 404 369Q404 366 418 324T449 234T481 143L496 100L537 219Q579 341 579 347Q579 363 564 373T530 385H522V431H529Q541 428 624 428Q692 428 698 431H703V385H697Q696 385 691 385T682 384Q635 377 619 334L559 161Q546 124 528 71Q508 12 503 1T487 -11H479Q460 -11 456 -4Q455 -3 407 133L361 267Q359 263 266 -4Q261 -11 243 -11H238Q225 -11 220 -3L90 368Z"></path><path id="MJX-5-TEX-N-6E" d="M41 46H55Q94 46 102 60V68Q102 77 102 91T102 122T103 161T103 203Q103 234 103 269T102 328V351Q99 370 88 376T43 385H25V408Q25 431 27 431L37 432Q47 433 65 434T102 436Q119 437 138 438T167 441T178 442H181V402Q181 364 182 364T187 369T199 384T218 402T247 421T285 437Q305 442 336 442Q450 438 463 329Q464 322 464 190V104Q464 66 466 59T477 49Q498 46 526 46H542V0H534L510 1Q487 2 460 2T422 3Q319 3 310 0H302V46H318Q379 46 379 62Q380 64 380 200Q379 335 378 343Q372 371 358 385T334 402T308 404Q263 404 229 370Q202 343 195 315T187 232V168V108Q187 78 188 68T191 55T200 49Q221 46 249 46H265V0H257L234 1Q210 2 183 2T145 3Q42 3 33 0H25V46H41Z"></path><path id="MJX-5-TEX-N-70" d="M36 -148H50Q89 -148 97 -134V-126Q97 -119 97 -107T97 -77T98 -38T98 6T98 55T98 106Q98 140 98 177T98 243T98 296T97 335T97 351Q94 370 83 376T38 385H20V408Q20 431 22 431L32 432Q42 433 61 434T98 436Q115 437 135 438T165 441T176 442H179V416L180 390L188 397Q247 441 326 441Q407 441 464 377T522 216Q522 115 457 52T310 -11Q242 -11 190 33L182 40V-45V-101Q182 -128 184 -134T195 -145Q216 -148 244 -148H260V-194H252L228 -193Q205 -192 178 -192T140 -191Q37 -191 28 -194H20V-148H36ZM424 218Q424 292 390 347T305 402Q234 402 182 337V98Q222 26 294 26Q345 26 384 80T424 218Z"></path><path id="MJX-5-TEX-N-6C" d="M42 46H56Q95 46 103 60V68Q103 77 103 91T103 124T104 167T104 217T104 272T104 329Q104 366 104 407T104 482T104 542T103 586T103 603Q100 622 89 628T44 637H26V660Q26 683 28 683L38 684Q48 685 67 686T104 688Q121 689 141 690T171 693T182 694H185V379Q185 62 186 60Q190 52 198 49Q219 46 247 46H263V0H255L232 1Q209 2 183 2T145 3T107 3T57 1L34 0H26V46H42Z"></path><path id="MJX-5-TEX-N-64" d="M376 495Q376 511 376 535T377 568Q377 613 367 624T316 637H298V660Q298 683 300 683L310 684Q320 685 339 686T376 688Q393 689 413 690T443 693T454 694H457V390Q457 84 458 81Q461 61 472 55T517 46H535V0Q533 0 459 -5T380 -11H373V44L365 37Q307 -11 235 -11Q158 -11 96 50T34 215Q34 315 97 378T244 442Q319 442 376 393V495ZM373 342Q328 405 260 405Q211 405 173 369Q146 341 139 305T131 211Q131 155 138 120T173 59Q203 26 251 26Q322 26 373 103V342Z"></path><path id="MJX-5-TEX-N-45" d="M128 619Q121 626 117 628T101 631T58 634H25V680H597V676Q599 670 611 560T625 444V440H585V444Q584 447 582 465Q578 500 570 526T553 571T528 601T498 619T457 629T411 633T353 634Q266 634 251 633T233 622Q233 622 233 621Q232 619 232 497V376H286Q359 378 377 385Q413 401 416 469Q416 471 416 473V493H456V213H416V233Q415 268 408 288T383 317T349 328T297 330Q290 330 286 330H232V196V114Q232 57 237 52Q243 47 289 47H340H391Q428 47 452 50T505 62T552 92T584 146Q594 172 599 200T607 247T612 270V273H652V270Q651 267 632 137T610 3V0H25V46H58Q100 47 109 49T128 61V619Z"></path><path id="MJX-5-TEX-N-6B" d="M36 46H50Q89 46 97 60V68Q97 77 97 91T97 124T98 167T98 217T98 272T98 329Q98 366 98 407T98 482T98 542T97 586T97 603Q94 622 83 628T38 637H20V660Q20 683 22 683L32 684Q42 685 61 686T98 688Q115 689 135 690T165 693T176 694H179V463L180 233L240 287Q300 341 304 347Q310 356 310 364Q310 383 289 385H284V431H293Q308 428 412 428Q475 428 484 431H489V385H476Q407 380 360 341Q286 278 286 274Q286 273 349 181T420 79Q434 60 451 53T500 46H511V0H505Q496 3 418 3Q322 3 307 0H299V46H306Q330 48 330 65Q330 72 326 79Q323 84 276 153T228 222L176 176V120V84Q176 65 178 59T189 49Q210 46 238 46H254V0H246Q231 3 137 3T28 0H20V46H36Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mtable"><g data-mml-node="mtr"><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="4A" xlink:href="#MJX-5-TEX-N-4A"></use><use data-c="53" xlink:href="#MJX-5-TEX-N-53" transform="translate(514,0)"></use><use data-c="54" xlink:href="#MJX-5-TEX-N-54" transform="translate(1070,0)"></use><use data-c="4C" xlink:href="#MJX-5-TEX-N-4C" transform="translate(1792,0)"></use><use data-c="20" xlink:href="#MJX-5-TEX-N-20" transform="translate(2417,0)"></use><use data-c="43" xlink:href="#MJX-5-TEX-N-43" transform="translate(2667,0)"></use><use data-c="6F" xlink:href="#MJX-5-TEX-N-6F" transform="translate(3389,0)"></use><use data-c="72" xlink:href="#MJX-5-TEX-N-72" transform="translate(3889,0)"></use><use data-c="65" xlink:href="#MJX-5-TEX-N-65" transform="translate(4281,0)"></use><use data-c="20" xlink:href="#MJX-5-TEX-N-20" transform="translate(4725,0)"></use><use data-c="4C" xlink:href="#MJX-5-TEX-N-4C" transform="translate(4975,0)"></use><use data-c="69" xlink:href="#MJX-5-TEX-N-69" transform="translate(5600,0)"></use><use data-c="62" xlink:href="#MJX-5-TEX-N-62" transform="translate(5878,0)"></use><use data-c="72" xlink:href="#MJX-5-TEX-N-72" transform="translate(6434,0)"></use><use data-c="61" xlink:href="#MJX-5-TEX-N-61" transform="translate(6826,0)"></use><use data-c="72" xlink:href="#MJX-5-TEX-N-72" transform="translate(7326,0)"></use><use data-c="79" xlink:href="#MJX-5-TEX-N-79" transform="translate(7718,0)"></use></g><g data-mml-node="mrow" transform="translate(8412.7,0)"><g data-mml-node="mo"><use data-c="23A7" xlink:href="#MJX-5-TEX-S4-23A7" transform="translate(0,7651)"></use><use data-c="23A9" xlink:href="#MJX-5-TEX-S4-23A9" transform="translate(0,-7151)"></use><use data-c="23A8" xlink:href="#MJX-5-TEX-S4-23A8" transform="translate(0,0)"></use><svg width="889" height="6681" y="1060" x="0" viewBox="0 1177.4 889 6681" class="in-text-selection"><use data-c="23AA" xlink:href="#MJX-5-TEX-S4-23AA" transform="scale(1,32.857)"></use></svg><svg width="889" height="6681" y="-7241" x="0" viewBox="0 1177.4 889 6681" class="in-text-selection"><use data-c="23AA" xlink:href="#MJX-5-TEX-S4-23AA" transform="scale(1,32.857)"></use></svg></g><g data-mml-node="mtable" transform="translate(889,0)"><g data-mml-node="mtr" transform="translate(0,7800)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="3C" xlink:href="#MJX-5-TEX-N-3C"></use><use data-c="63" xlink:href="#MJX-5-TEX-N-63" transform="translate(778,0)"></use><use data-c="3A" xlink:href="#MJX-5-TEX-N-3A" transform="translate(1222,0)"></use><use data-c="6F" xlink:href="#MJX-5-TEX-N-6F" transform="translate(1500,0)"></use><use data-c="75" xlink:href="#MJX-5-TEX-N-75" transform="translate(2000,0)"></use><use data-c="74" xlink:href="#MJX-5-TEX-N-74" transform="translate(2556,0)"></use><use data-c="3E" xlink:href="#MJX-5-TEX-N-3E" transform="translate(2945,0)"></use></g></g></g><g data-mml-node="mtr" transform="translate(0,6500)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="3C" xlink:href="#MJX-5-TEX-N-3C"></use><use data-c="63" xlink:href="#MJX-5-TEX-N-63" transform="translate(778,0)"></use><use data-c="3A" xlink:href="#MJX-5-TEX-N-3A" transform="translate(1222,0)"></use><use data-c="73" xlink:href="#MJX-5-TEX-N-73" transform="translate(1500,0)"></use><use data-c="65" xlink:href="#MJX-5-TEX-N-65" transform="translate(1894,0)"></use><use data-c="74" xlink:href="#MJX-5-TEX-N-74" transform="translate(2338,0)"></use><use data-c="3E" xlink:href="#MJX-5-TEX-N-3E" transform="translate(2727,0)"></use></g></g></g><g data-mml-node="mtr" transform="translate(0,5200)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="3C" xlink:href="#MJX-5-TEX-N-3C"></use><use data-c="63" xlink:href="#MJX-5-TEX-N-63" transform="translate(778,0)"></use><use data-c="3A" xlink:href="#MJX-5-TEX-N-3A" transform="translate(1222,0)"></use><use data-c="72" xlink:href="#MJX-5-TEX-N-72" transform="translate(1500,0)"></use><use data-c="65" xlink:href="#MJX-5-TEX-N-65" transform="translate(1892,0)"></use><use data-c="6D" xlink:href="#MJX-5-TEX-N-6D" transform="translate(2336,0)"></use><use data-c="6F" xlink:href="#MJX-5-TEX-N-6F" transform="translate(3169,0)"></use><use data-c="76" xlink:href="#MJX-5-TEX-N-76" transform="translate(3669,0)"></use><use data-c="65" xlink:href="#MJX-5-TEX-N-65" transform="translate(4197,0)"></use><use data-c="3E" xlink:href="#MJX-5-TEX-N-3E" transform="translate(4641,0)"></use></g></g></g><g data-mml-node="mtr" transform="translate(0,3900)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="3C" xlink:href="#MJX-5-TEX-N-3C"></use><use data-c="63" xlink:href="#MJX-5-TEX-N-63" transform="translate(778,0)"></use><use data-c="3A" xlink:href="#MJX-5-TEX-N-3A" transform="translate(1222,0)"></use><use data-c="63" xlink:href="#MJX-5-TEX-N-63" transform="translate(1500,0)"></use><use data-c="61" xlink:href="#MJX-5-TEX-N-61" transform="translate(1944,0)"></use><use data-c="74" xlink:href="#MJX-5-TEX-N-74" transform="translate(2444,0)"></use><use data-c="63" xlink:href="#MJX-5-TEX-N-63" transform="translate(2833,0)"></use><use data-c="68" xlink:href="#MJX-5-TEX-N-68" transform="translate(3277,0)"></use><use data-c="3E" xlink:href="#MJX-5-TEX-N-3E" transform="translate(3833,0)"></use></g></g></g><g data-mml-node="mtr" transform="translate(0,2600)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="3C" xlink:href="#MJX-5-TEX-N-3C"></use><use data-c="63" xlink:href="#MJX-5-TEX-N-63" transform="translate(778,0)"></use><use data-c="3A" xlink:href="#MJX-5-TEX-N-3A" transform="translate(1222,0)"></use><use data-c="69" xlink:href="#MJX-5-TEX-N-69" transform="translate(1500,0)"></use><use data-c="66" xlink:href="#MJX-5-TEX-N-66" transform="translate(1778,0)"></use><use data-c="3E" xlink:href="#MJX-5-TEX-N-3E" transform="translate(2084,0)"></use></g></g></g><g data-mml-node="mtr" transform="translate(0,1300)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="3C" xlink:href="#MJX-5-TEX-N-3C"></use><use data-c="63" xlink:href="#MJX-5-TEX-N-63" transform="translate(778,0)"></use><use data-c="3A" xlink:href="#MJX-5-TEX-N-3A" transform="translate(1222,0)"></use><use data-c="63" xlink:href="#MJX-5-TEX-N-63" transform="translate(1500,0)"></use><use data-c="68" xlink:href="#MJX-5-TEX-N-68" transform="translate(1944,0)"></use><use data-c="6F" xlink:href="#MJX-5-TEX-N-6F" transform="translate(2500,0)"></use><use data-c="6F" xlink:href="#MJX-5-TEX-N-6F" transform="translate(3000,0)"></use><use data-c="73" xlink:href="#MJX-5-TEX-N-73" transform="translate(3500,0)"></use><use data-c="65" xlink:href="#MJX-5-TEX-N-65" transform="translate(3894,0)"></use><use data-c="3E" xlink:href="#MJX-5-TEX-N-3E" transform="translate(4338,0)"></use></g></g></g><g data-mml-node="mtr" transform="translate(0,0)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="3C" xlink:href="#MJX-5-TEX-N-3C"></use><use data-c="63" xlink:href="#MJX-5-TEX-N-63" transform="translate(778,0)"></use><use data-c="3A" xlink:href="#MJX-5-TEX-N-3A" transform="translate(1222,0)"></use><use data-c="77" xlink:href="#MJX-5-TEX-N-77" transform="translate(1500,0)"></use><use data-c="68" xlink:href="#MJX-5-TEX-N-68" transform="translate(2222,0)"></use><use data-c="65" xlink:href="#MJX-5-TEX-N-65" transform="translate(2778,0)"></use><use data-c="6E" xlink:href="#MJX-5-TEX-N-6E" transform="translate(3222,0)"></use><use data-c="3E" xlink:href="#MJX-5-TEX-N-3E" transform="translate(3778,0)"></use></g></g></g><g data-mml-node="mtr" transform="translate(0,-1300)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="3C" xlink:href="#MJX-5-TEX-N-3C"></use><use data-c="63" xlink:href="#MJX-5-TEX-N-63" transform="translate(778,0)"></use><use data-c="3A" xlink:href="#MJX-5-TEX-N-3A" transform="translate(1222,0)"></use><use data-c="6F" xlink:href="#MJX-5-TEX-N-6F" transform="translate(1500,0)"></use><use data-c="74" xlink:href="#MJX-5-TEX-N-74" transform="translate(2000,0)"></use><use data-c="68" xlink:href="#MJX-5-TEX-N-68" transform="translate(2389,0)"></use><use data-c="65" xlink:href="#MJX-5-TEX-N-65" transform="translate(2945,0)"></use><use data-c="72" xlink:href="#MJX-5-TEX-N-72" transform="translate(3389,0)"></use><use data-c="77" xlink:href="#MJX-5-TEX-N-77" transform="translate(3781,0)"></use><use data-c="69" xlink:href="#MJX-5-TEX-N-69" transform="translate(4503,0)"></use><use data-c="73" xlink:href="#MJX-5-TEX-N-73" transform="translate(4781,0)"></use><use data-c="65" xlink:href="#MJX-5-TEX-N-65" transform="translate(5175,0)"></use><use data-c="3E" xlink:href="#MJX-5-TEX-N-3E" transform="translate(5619,0)"></use></g></g></g><g data-mml-node="mtr" transform="translate(0,-2600)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="3C" xlink:href="#MJX-5-TEX-N-3C"></use><use data-c="63" xlink:href="#MJX-5-TEX-N-63" transform="translate(778,0)"></use><use data-c="3A" xlink:href="#MJX-5-TEX-N-3A" transform="translate(1222,0)"></use><use data-c="69" xlink:href="#MJX-5-TEX-N-69" transform="translate(1500,0)"></use><use data-c="6D" xlink:href="#MJX-5-TEX-N-6D" transform="translate(1778,0)"></use><use data-c="70" xlink:href="#MJX-5-TEX-N-70" transform="translate(2611,0)"></use><use data-c="6F" xlink:href="#MJX-5-TEX-N-6F" transform="translate(3167,0)"></use><use data-c="72" xlink:href="#MJX-5-TEX-N-72" transform="translate(3667,0)"></use><use data-c="74" xlink:href="#MJX-5-TEX-N-74" transform="translate(4059,0)"></use><use data-c="3E" xlink:href="#MJX-5-TEX-N-3E" transform="translate(4448,0)"></use></g></g></g><g data-mml-node="mtr" transform="translate(0,-3900)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="3C" xlink:href="#MJX-5-TEX-N-3C"></use><use data-c="63" xlink:href="#MJX-5-TEX-N-63" transform="translate(778,0)"></use><use data-c="3A" xlink:href="#MJX-5-TEX-N-3A" transform="translate(1222,0)"></use><use data-c="75" xlink:href="#MJX-5-TEX-N-75" transform="translate(1500,0)"></use><use data-c="72" xlink:href="#MJX-5-TEX-N-72" transform="translate(2056,0)"></use><use data-c="6C" xlink:href="#MJX-5-TEX-N-6C" transform="translate(2448,0)"></use><use data-c="3E" xlink:href="#MJX-5-TEX-N-3E" transform="translate(2726,0)"></use></g></g></g><g data-mml-node="mtr" transform="translate(0,-5200)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="3C" xlink:href="#MJX-5-TEX-N-3C"></use><use data-c="63" xlink:href="#MJX-5-TEX-N-63" transform="translate(778,0)"></use><use data-c="3A" xlink:href="#MJX-5-TEX-N-3A" transform="translate(1222,0)"></use><use data-c="72" xlink:href="#MJX-5-TEX-N-72" transform="translate(1500,0)"></use><use data-c="65" xlink:href="#MJX-5-TEX-N-65" transform="translate(1892,0)"></use><use data-c="64" xlink:href="#MJX-5-TEX-N-64" transform="translate(2336,0)"></use><use data-c="69" xlink:href="#MJX-5-TEX-N-69" transform="translate(2892,0)"></use><use data-c="72" xlink:href="#MJX-5-TEX-N-72" transform="translate(3170,0)"></use><use data-c="65" xlink:href="#MJX-5-TEX-N-65" transform="translate(3562,0)"></use><use data-c="63" xlink:href="#MJX-5-TEX-N-63" transform="translate(4006,0)"></use><use data-c="74" xlink:href="#MJX-5-TEX-N-74" transform="translate(4450,0)"></use><use data-c="3E" xlink:href="#MJX-5-TEX-N-3E" transform="translate(4839,0)"></use></g></g></g><g data-mml-node="mtr" transform="translate(0,-6500)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="3C" xlink:href="#MJX-5-TEX-N-3C"></use><use data-c="63" xlink:href="#MJX-5-TEX-N-63" transform="translate(778,0)"></use><use data-c="3A" xlink:href="#MJX-5-TEX-N-3A" transform="translate(1222,0)"></use><use data-c="66" xlink:href="#MJX-5-TEX-N-66" transform="translate(1500,0)"></use><use data-c="6F" xlink:href="#MJX-5-TEX-N-6F" transform="translate(1806,0)"></use><use data-c="72" xlink:href="#MJX-5-TEX-N-72" transform="translate(2306,0)"></use><use data-c="45" xlink:href="#MJX-5-TEX-N-45" transform="translate(2698,0)"></use><use data-c="61" xlink:href="#MJX-5-TEX-N-61" transform="translate(3379,0)"></use><use data-c="63" xlink:href="#MJX-5-TEX-N-63" transform="translate(3879,0)"></use><use data-c="68" xlink:href="#MJX-5-TEX-N-68" transform="translate(4323,0)"></use><use data-c="3E" xlink:href="#MJX-5-TEX-N-3E" transform="translate(4879,0)"></use></g></g></g><g data-mml-node="mtr" transform="translate(0,-7800)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="3C" xlink:href="#MJX-5-TEX-N-3C"></use><use data-c="63" xlink:href="#MJX-5-TEX-N-63" transform="translate(778,0)"></use><use data-c="3A" xlink:href="#MJX-5-TEX-N-3A" transform="translate(1222,0)"></use><use data-c="66" xlink:href="#MJX-5-TEX-N-66" transform="translate(1500,0)"></use><use data-c="6F" xlink:href="#MJX-5-TEX-N-6F" transform="translate(1806,0)"></use><use data-c="72" xlink:href="#MJX-5-TEX-N-72" transform="translate(2306,0)"></use><use data-c="54" xlink:href="#MJX-5-TEX-N-54" transform="translate(2698,0)"></use><use data-c="6F" xlink:href="#MJX-5-TEX-N-6F" transform="translate(3420,0)"></use><use data-c="6B" xlink:href="#MJX-5-TEX-N-6B" transform="translate(3920,0)"></use><use data-c="65" xlink:href="#MJX-5-TEX-N-65" transform="translate(4448,0)"></use><use data-c="6E" xlink:href="#MJX-5-TEX-N-6E" transform="translate(4892,0)"></use><use data-c="73" xlink:href="#MJX-5-TEX-N-73" transform="translate(5448,0)"></use><use data-c="3E" xlink:href="#MJX-5-TEX-N-3E" transform="translate(5842,0)"></use></g></g></g></g><g data-mml-node="mo" transform="translate(7509,0) translate(0 250)"></g></g></g></g></g></g></g></svg></mjx-container></div></div>
<blockquote><ul>
<li><code>&lt;c:out&gt;</code></li>

</ul>
<pre><code class="language-jsp" lang="jsp">&lt;!-- escapeXml默认为false --&gt;
&lt;c:out value="pageContext.currentTip" escapeXml="true" /&gt;
&lt;!-- 设置 输出的默认值 --&gt;
&lt;c:out value="${user}" default="guest"&gt;
</code></pre>
</blockquote>
<blockquote><ul>
<li><code>&lt;c:forEach&gt;</code></li>

</ul>
<pre><code class="language-jsp" lang="jsp">&lt;c:forEach var="movie" items="movieList"&gt;
    &lt;tr&gt;
        &lt;td&gt;${movie}&lt;/td&gt;
    &lt;/tr&gt;
&lt;/c:forEach&gt;
</code></pre>
<blockquote><p>可选属性 <code>varStatus</code> 可以获得 <code>循环计次</code>：1..n</p>
</blockquote>
</blockquote>
<blockquote><ul>
<li><code>&lt;c:if&gt;</code></li>

</ul>
<pre><code class="language-jsp" lang="jsp">&lt;c:if test="${userType=='member'"&gt;
    &lt;jsp:include page="inputComments.jsp" /&gt;
&lt;/c:if&gt;
</code></pre>
<blockquote><p>虽然有 <code>if标签</code>，但没有 <code>else标签</code>。如果需要制定 <code>默认的分支</code>，请使用 <code>choose标签</code></p>
</blockquote>
</blockquote>
<blockquote><ul>
<li><code>&lt;c: choose&gt;</code></li>

</ul>
<pre><code class="language-jsp" lang="jsp">&lt;c:choose&gt;
    &lt;c:when test="..."&gt;...&lt;/c:when&gt;
	&lt;c:when test="..."&gt;...&lt;/c:when&gt;
	&lt;c:when test="..."&gt;...&lt;/c:when&gt;
    &lt;c:otherwise&gt;...&lt;/c:otherwise&gt;
&lt;/c:choose&gt;
</code></pre>
</blockquote>
<blockquote><ul>
<li><code>&lt;c:set&gt;</code></li>

</ul>
<div contenteditable="true" spellcheck="false" class="mathjax-block md-end-block md-math-block md-rawblock" id="mathjax-n485" cid="n485" mdtype="math_block" data-math-tag-before="0" data-math-tag-after="0" data-math-labels="[]"><div class="md-rawblock-container md-math-container" tabindex="-1"><mjx-container class="MathJax" jax="SVG" display="true" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="46.136ex" height="8.369ex" role="img" focusable="false" viewBox="0 -2099.5 20392.1 3699" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -3.619ex;" class="in-text-selection"><defs><path id="MJX-6-TEX-N-3C" d="M694 -11T694 -19T688 -33T678 -40Q671 -40 524 29T234 166L90 235Q83 240 83 250Q83 261 91 266Q664 540 678 540Q681 540 687 534T694 519T687 505Q686 504 417 376L151 250L417 124Q686 -4 687 -5Q694 -11 694 -19Z"></path><path id="MJX-6-TEX-N-63" d="M370 305T349 305T313 320T297 358Q297 381 312 396Q317 401 317 402T307 404Q281 408 258 408Q209 408 178 376Q131 329 131 219Q131 137 162 90Q203 29 272 29Q313 29 338 55T374 117Q376 125 379 127T395 129H409Q415 123 415 120Q415 116 411 104T395 71T366 33T318 2T249 -11Q163 -11 99 53T34 214Q34 318 99 383T250 448T370 421T404 357Q404 334 387 320Z"></path><path id="MJX-6-TEX-N-3A" d="M78 370Q78 394 95 412T138 430Q162 430 180 414T199 371Q199 346 182 328T139 310T96 327T78 370ZM78 60Q78 84 95 102T138 120Q162 120 180 104T199 61Q199 36 182 18T139 0T96 17T78 60Z"></path><path id="MJX-6-TEX-N-73" d="M295 316Q295 356 268 385T190 414Q154 414 128 401Q98 382 98 349Q97 344 98 336T114 312T157 287Q175 282 201 278T245 269T277 256Q294 248 310 236T342 195T359 133Q359 71 321 31T198 -10H190Q138 -10 94 26L86 19L77 10Q71 4 65 -1L54 -11H46H42Q39 -11 33 -5V74V132Q33 153 35 157T45 162H54Q66 162 70 158T75 146T82 119T101 77Q136 26 198 26Q295 26 295 104Q295 133 277 151Q257 175 194 187T111 210Q75 227 54 256T33 318Q33 357 50 384T93 424T143 442T187 447H198Q238 447 268 432L283 424L292 431Q302 440 314 448H322H326Q329 448 335 442V310L329 304H301Q295 310 295 316Z"></path><path id="MJX-6-TEX-N-65" d="M28 218Q28 273 48 318T98 391T163 433T229 448Q282 448 320 430T378 380T406 316T415 245Q415 238 408 231H126V216Q126 68 226 36Q246 30 270 30Q312 30 342 62Q359 79 369 104L379 128Q382 131 395 131H398Q415 131 415 121Q415 117 412 108Q393 53 349 21T250 -11Q155 -11 92 58T28 218ZM333 275Q322 403 238 411H236Q228 411 220 410T195 402T166 381T143 340T127 274V267H333V275Z"></path><path id="MJX-6-TEX-N-74" d="M27 422Q80 426 109 478T141 600V615H181V431H316V385H181V241Q182 116 182 100T189 68Q203 29 238 29Q282 29 292 100Q293 108 293 146V181H333V146V134Q333 57 291 17Q264 -10 221 -10Q187 -10 162 2T124 33T105 68T98 100Q97 107 97 248V385H18V422H27Z"></path><path id="MJX-6-TEX-N-3E" d="M84 520Q84 528 88 533T96 539L99 540Q106 540 253 471T544 334L687 265Q694 260 694 250T687 235Q685 233 395 96L107 -40H101Q83 -38 83 -20Q83 -19 83 -17Q82 -10 98 -1Q117 9 248 71Q326 108 378 132L626 250L378 368Q90 504 86 509Q84 513 84 520Z"></path><path id="MJX-6-TEX-S4-23A7" d="M712 899L718 893V876V865Q718 854 704 846Q627 793 577 710T510 525Q510 524 509 521Q505 493 504 349Q504 345 504 334Q504 277 504 240Q504 -2 503 -4Q502 -8 494 -9T444 -10Q392 -10 390 -9Q387 -8 386 -5Q384 5 384 230Q384 262 384 312T383 382Q383 481 392 535T434 656Q510 806 664 892L677 899H712Z"></path><path id="MJX-6-TEX-S4-23A9" d="M718 -893L712 -899H677L666 -893Q542 -825 468 -714T385 -476Q384 -466 384 -282Q384 3 385 5L389 9Q392 10 444 10Q486 10 494 9T503 4Q504 2 504 -239V-310V-366Q504 -470 508 -513T530 -609Q546 -657 569 -698T617 -767T661 -812T699 -843T717 -856T718 -876V-893Z"></path><path id="MJX-6-TEX-S4-23A8" d="M389 1159Q391 1160 455 1160Q496 1160 498 1159Q501 1158 502 1155Q504 1145 504 924Q504 691 503 682Q494 549 425 439T243 259L229 250L243 241Q349 175 421 66T503 -182Q504 -191 504 -424Q504 -600 504 -629T499 -659H498Q496 -660 444 -660T390 -659Q387 -658 386 -655Q384 -645 384 -425V-282Q384 -176 377 -116T342 10Q325 54 301 92T255 155T214 196T183 222T171 232Q170 233 170 250T171 268Q171 269 191 284T240 331T300 407T354 524T383 679Q384 691 384 925Q384 1152 385 1155L389 1159Z"></path><path id="MJX-6-TEX-S4-23AA" d="M384 150V266Q384 304 389 309Q391 310 455 310Q496 310 498 309Q502 308 503 298Q504 283 504 150Q504 32 504 12T499 -9H498Q496 -10 444 -10T390 -9Q386 -8 385 2Q384 17 384 150Z"></path><path id="MJX-6-TEX-N-76" d="M338 431Q344 429 422 429Q479 429 503 431H508V385H497Q439 381 423 345Q421 341 356 172T288 -2Q283 -11 263 -11Q244 -11 239 -2Q99 359 98 364Q93 378 82 381T43 385H19V431H25L33 430Q41 430 53 430T79 430T104 429T122 428Q217 428 232 431H240V385H226Q187 384 184 370Q184 366 235 234L286 102L377 341V349Q377 363 367 372T349 383T335 385H331V431H338Z"></path><path id="MJX-6-TEX-N-61" d="M137 305T115 305T78 320T63 359Q63 394 97 421T218 448Q291 448 336 416T396 340Q401 326 401 309T402 194V124Q402 76 407 58T428 40Q443 40 448 56T453 109V145H493V106Q492 66 490 59Q481 29 455 12T400 -6T353 12T329 54V58L327 55Q325 52 322 49T314 40T302 29T287 17T269 6T247 -2T221 -8T190 -11Q130 -11 82 20T34 107Q34 128 41 147T68 188T116 225T194 253T304 268H318V290Q318 324 312 340Q290 411 215 411Q197 411 181 410T156 406T148 403Q170 388 170 359Q170 334 154 320ZM126 106Q126 75 150 51T209 26Q247 26 276 49T315 109Q317 116 318 175Q318 233 317 233Q309 233 296 232T251 223T193 203T147 166T126 106Z"></path><path id="MJX-6-TEX-N-72" d="M36 46H50Q89 46 97 60V68Q97 77 97 91T98 122T98 161T98 203Q98 234 98 269T98 328L97 351Q94 370 83 376T38 385H20V408Q20 431 22 431L32 432Q42 433 60 434T96 436Q112 437 131 438T160 441T171 442H174V373Q213 441 271 441H277Q322 441 343 419T364 373Q364 352 351 337T313 322Q288 322 276 338T263 372Q263 381 265 388T270 400T273 405Q271 407 250 401Q234 393 226 386Q179 341 179 207V154Q179 141 179 127T179 101T180 81T180 66V61Q181 59 183 57T188 54T193 51T200 49T207 48T216 47T225 47T235 46T245 46H276V0H267Q249 3 140 3Q37 3 28 0H20V46H36Z"></path><path id="MJX-6-TEX-N-20" d=""></path><path id="MJX-6-TEX-N-69" d="M69 609Q69 637 87 653T131 669Q154 667 171 652T188 609Q188 579 171 564T129 549Q104 549 87 564T69 609ZM247 0Q232 3 143 3Q132 3 106 3T56 1L34 0H26V46H42Q70 46 91 49Q100 53 102 60T104 102V205V293Q104 345 102 359T88 378Q74 385 41 385H30V408Q30 431 32 431L42 432Q52 433 70 434T106 436Q123 437 142 438T171 441T182 442H185V62Q190 52 197 50T232 46H255V0H247Z"></path><path id="MJX-6-TEX-N-6F" d="M28 214Q28 309 93 378T250 448Q340 448 405 380T471 215Q471 120 407 55T250 -10Q153 -10 91 57T28 214ZM250 30Q372 30 372 193V225V250Q372 272 371 288T364 326T348 362T317 390T268 410Q263 411 252 411Q222 411 195 399Q152 377 139 338T126 246V226Q126 130 145 91Q177 30 250 30Z"></path><path id="MJX-6-TEX-N-6E" d="M41 46H55Q94 46 102 60V68Q102 77 102 91T102 122T103 161T103 203Q103 234 103 269T102 328V351Q99 370 88 376T43 385H25V408Q25 431 27 431L37 432Q47 433 65 434T102 436Q119 437 138 438T167 441T178 442H181V402Q181 364 182 364T187 369T199 384T218 402T247 421T285 437Q305 442 336 442Q450 438 463 329Q464 322 464 190V104Q464 66 466 59T477 49Q498 46 526 46H542V0H534L510 1Q487 2 460 2T422 3Q319 3 310 0H302V46H318Q379 46 379 62Q380 64 380 200Q379 335 378 343Q372 371 358 385T334 402T308 404Q263 404 229 370Q202 343 195 315T187 232V168V108Q187 78 188 68T191 55T200 49Q221 46 249 46H265V0H257L234 1Q210 2 183 2T145 3Q42 3 33 0H25V46H41Z"></path><path id="MJX-6-TEX-N-67" d="M329 409Q373 453 429 453Q459 453 472 434T485 396Q485 382 476 371T449 360Q416 360 412 390Q410 404 415 411Q415 412 416 414V415Q388 412 363 393Q355 388 355 386Q355 385 359 381T368 369T379 351T388 325T392 292Q392 230 343 187T222 143Q172 143 123 171Q112 153 112 133Q112 98 138 81Q147 75 155 75T227 73Q311 72 335 67Q396 58 431 26Q470 -13 470 -72Q470 -139 392 -175Q332 -206 250 -206Q167 -206 107 -175Q29 -140 29 -75Q29 -39 50 -15T92 18L103 24Q67 55 67 108Q67 155 96 193Q52 237 52 292Q52 355 102 398T223 442Q274 442 318 416L329 409ZM299 343Q294 371 273 387T221 404Q192 404 171 388T145 343Q142 326 142 292Q142 248 149 227T179 192Q196 182 222 182Q244 182 260 189T283 207T294 227T299 242Q302 258 302 292T299 343ZM403 -75Q403 -50 389 -34T348 -11T299 -2T245 0H218Q151 0 138 -6Q118 -15 107 -34T95 -74Q95 -84 101 -97T122 -127T170 -155T250 -167Q319 -167 361 -139T403 -75Z"></path><path id="MJX-6-TEX-S3-7B" d="M618 -943L612 -949H582L568 -943Q472 -903 411 -841T332 -703Q327 -682 327 -653T325 -350Q324 -28 323 -18Q317 24 301 61T264 124T221 171T179 205T147 225T132 234Q130 238 130 250Q130 255 130 258T131 264T132 267T134 269T139 272T144 275Q207 308 256 367Q310 436 323 519Q324 529 325 851Q326 1124 326 1154T332 1205Q369 1358 566 1443L582 1450H612L618 1444V1429Q618 1413 616 1411L608 1406Q599 1402 585 1393T552 1372T515 1343T479 1305T449 1257T429 1200Q425 1180 425 1152T423 851Q422 579 422 549T416 498Q407 459 388 424T346 364T297 318T250 284T214 264T197 254L188 251L205 242Q290 200 345 138T416 3Q421 -18 421 -48T423 -349Q423 -397 423 -472Q424 -677 428 -694Q429 -697 429 -699Q434 -722 443 -743T465 -782T491 -816T519 -845T548 -868T574 -886T595 -899T610 -908L616 -910Q618 -912 618 -928V-943Z"></path><path id="MJX-6-TEX-N-4A" d="M89 177Q115 177 133 160T152 112Q152 88 137 72T102 52Q99 51 101 49Q106 43 129 29Q159 15 190 15Q232 15 256 48T286 126Q286 127 286 142T286 183T286 238T287 306T287 378Q287 403 287 429T287 479T287 524T286 563T286 593T286 614V621Q281 630 263 633T182 637H154V683H166Q187 680 332 680Q439 680 457 683H465V637H449Q422 637 401 634Q393 631 389 623Q388 621 388 376T387 123Q377 61 322 20T194 -22Q188 -22 177 -21T160 -20Q96 -9 61 29T25 110Q25 144 44 160T89 177Z"></path><path id="MJX-6-TEX-N-42" d="M131 622Q124 629 120 631T104 634T61 637H28V683H229H267H346Q423 683 459 678T531 651Q574 627 599 590T624 512Q624 461 583 419T476 360L466 357Q539 348 595 302T651 187Q651 119 600 67T469 3Q456 1 242 0H28V46H61Q103 47 112 49T131 61V622ZM511 513Q511 560 485 594T416 636Q415 636 403 636T371 636T333 637Q266 637 251 636T232 628Q229 624 229 499V374H312L396 375L406 377Q410 378 417 380T442 393T474 417T499 456T511 513ZM537 188Q537 239 509 282T430 336L329 337H229V200V116Q229 57 234 52Q240 47 334 47H383Q425 47 443 53Q486 67 511 104T537 188Z"></path><path id="MJX-6-TEX-N-50" d="M130 622Q123 629 119 631T103 634T60 637H27V683H214Q237 683 276 683T331 684Q419 684 471 671T567 616Q624 563 624 489Q624 421 573 372T451 307Q429 302 328 301H234V181Q234 62 237 58Q245 47 304 46H337V0H326Q305 3 182 3Q47 3 38 0H27V46H60Q102 47 111 49T130 61V622ZM507 488Q507 514 506 528T500 564T483 597T450 620T397 635Q385 637 307 637H286Q237 637 234 628Q231 624 231 483V342H302H339Q390 342 423 349T481 382Q507 411 507 488Z"></path><path id="MJX-6-TEX-N-70" d="M36 -148H50Q89 -148 97 -134V-126Q97 -119 97 -107T97 -77T98 -38T98 6T98 55T98 106Q98 140 98 177T98 243T98 296T97 335T97 351Q94 370 83 376T38 385H20V408Q20 431 22 431L32 432Q42 433 61 434T98 436Q115 437 135 438T165 441T176 442H179V416L180 390L188 397Q247 441 326 441Q407 441 464 377T522 216Q522 115 457 52T310 -11Q242 -11 190 33L182 40V-45V-101Q182 -128 184 -134T195 -145Q216 -148 244 -148H260V-194H252L228 -193Q205 -192 178 -192T140 -191Q37 -191 28 -194H20V-148H36ZM424 218Q424 292 390 347T305 402Q234 402 182 337V98Q222 26 294 26Q345 26 384 80T424 218Z"></path><path id="MJX-6-TEX-N-79" d="M69 -66Q91 -66 104 -80T118 -116Q118 -134 109 -145T91 -160Q84 -163 97 -166Q104 -168 111 -168Q131 -168 148 -159T175 -138T197 -106T213 -75T225 -43L242 0L170 183Q150 233 125 297Q101 358 96 368T80 381Q79 382 78 382Q66 385 34 385H19V431H26L46 430Q65 430 88 429T122 428Q129 428 142 428T171 429T200 430T224 430L233 431H241V385H232Q183 385 185 366L286 112Q286 113 332 227L376 341V350Q376 365 366 373T348 383T334 385H331V431H337H344Q351 431 361 431T382 430T405 429T422 429Q477 429 503 431H508V385H497Q441 380 422 345Q420 343 378 235T289 9T227 -131Q180 -204 113 -204Q69 -204 44 -177T19 -116Q19 -89 35 -78T69 -66Z"></path><path id="MJX-6-TEX-N-4D" d="M132 622Q125 629 121 631T105 634T62 637H29V683H135Q221 683 232 682T249 675Q250 674 354 398L458 124L562 398Q666 674 668 675Q671 681 683 682T781 683H887V637H854Q814 636 803 634T785 622V61Q791 51 802 49T854 46H887V0H876Q855 3 736 3Q605 3 596 0H585V46H618Q660 47 669 49T688 61V347Q688 424 688 461T688 546T688 613L687 632Q454 14 450 7Q446 1 430 1T410 7Q409 9 292 316L176 624V606Q175 588 175 543T175 463T175 356L176 86Q187 50 261 46H278V0H269Q254 3 154 3Q52 3 37 0H29V46H46Q78 48 98 56T122 69T132 86V622Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mtable"><g data-mml-node="mtr"><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="3C" xlink:href="#MJX-6-TEX-N-3C"></use><use data-c="63" xlink:href="#MJX-6-TEX-N-63" transform="translate(778,0)"></use><use data-c="3A" xlink:href="#MJX-6-TEX-N-3A" transform="translate(1222,0)"></use><use data-c="73" xlink:href="#MJX-6-TEX-N-73" transform="translate(1500,0)"></use><use data-c="65" xlink:href="#MJX-6-TEX-N-65" transform="translate(1894,0)"></use><use data-c="74" xlink:href="#MJX-6-TEX-N-74" transform="translate(2338,0)"></use><use data-c="3E" xlink:href="#MJX-6-TEX-N-3E" transform="translate(2727,0)"></use></g><g data-mml-node="mrow" transform="translate(3671.7,0)"><g data-mml-node="mo"><use data-c="23A7" xlink:href="#MJX-6-TEX-S4-23A7" transform="translate(0,1200.5)"></use><use data-c="23A9" xlink:href="#MJX-6-TEX-S4-23A9" transform="translate(0,-700.5)"></use><use data-c="23A8" xlink:href="#MJX-6-TEX-S4-23A8" transform="translate(0,0)"></use><svg width="889" height="230.5" y="1060" x="0" viewBox="0 40.6 889 230.5" class="in-text-selection"><use data-c="23AA" xlink:href="#MJX-6-TEX-S4-23AA" transform="scale(1,1.134)"></use></svg><svg width="889" height="230.5" y="-790.5" x="0" viewBox="0 40.6 889 230.5" class="in-text-selection"><use data-c="23AA" xlink:href="#MJX-6-TEX-S4-23AA" transform="scale(1,1.134)"></use></svg></g><g data-mml-node="mtable" transform="translate(889,0)"><g data-mml-node="mtr" transform="translate(0,1349.5)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="76" xlink:href="#MJX-6-TEX-N-76"></use><use data-c="61" xlink:href="#MJX-6-TEX-N-61" transform="translate(528,0)"></use><use data-c="72" xlink:href="#MJX-6-TEX-N-72" transform="translate(1028,0)"></use><use data-c="20" xlink:href="#MJX-6-TEX-N-20" transform="translate(1420,0)"></use><use data-c="76" xlink:href="#MJX-6-TEX-N-76" transform="translate(1670,0)"></use><use data-c="65" xlink:href="#MJX-6-TEX-N-65" transform="translate(2198,0)"></use><use data-c="72" xlink:href="#MJX-6-TEX-N-72" transform="translate(2642,0)"></use><use data-c="73" xlink:href="#MJX-6-TEX-N-73" transform="translate(3034,0)"></use><use data-c="69" xlink:href="#MJX-6-TEX-N-69" transform="translate(3428,0)"></use><use data-c="6F" xlink:href="#MJX-6-TEX-N-6F" transform="translate(3706,0)"></use><use data-c="6E" xlink:href="#MJX-6-TEX-N-6E" transform="translate(4206,0)"></use></g><g data-mml-node="mo" transform="translate(5039.8,0)"><use data-c="3A" xlink:href="#MJX-6-TEX-N-3A"></use></g><g data-mml-node="mtext" transform="translate(5595.6,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="827.1px" font-family="serif">属</text></g><g data-mml-node="mtext" transform="translate(6422.3,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="827.1px" font-family="serif">性</text></g><g data-mml-node="mtext" transform="translate(7249,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="827.1px" font-family="serif">变</text></g><g data-mml-node="mtext" transform="translate(8075.8,0)"><text data-variant="normal" transform="scale(1,-1)" font-size="827.1px" font-family="serif">量</text></g></g></g><g data-mml-node="mtr" transform="translate(0,-650)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="74" xlink:href="#MJX-6-TEX-N-74"></use><use data-c="61" xlink:href="#MJX-6-TEX-N-61" transform="translate(389,0)"></use><use data-c="72" xlink:href="#MJX-6-TEX-N-72" transform="translate(889,0)"></use><use data-c="67" xlink:href="#MJX-6-TEX-N-67" transform="translate(1281,0)"></use><use data-c="65" xlink:href="#MJX-6-TEX-N-65" transform="translate(1781,0)"></use><use data-c="74" xlink:href="#MJX-6-TEX-N-74" transform="translate(2225,0)"></use><use data-c="20" xlink:href="#MJX-6-TEX-N-20" transform="translate(2614,0)"></use><use data-c="76" xlink:href="#MJX-6-TEX-N-76" transform="translate(2864,0)"></use><use data-c="65" xlink:href="#MJX-6-TEX-N-65" transform="translate(3392,0)"></use><use data-c="72" xlink:href="#MJX-6-TEX-N-72" transform="translate(3836,0)"></use><use data-c="73" xlink:href="#MJX-6-TEX-N-73" transform="translate(4228,0)"></use><use data-c="69" xlink:href="#MJX-6-TEX-N-69" transform="translate(4622,0)"></use><use data-c="6F" xlink:href="#MJX-6-TEX-N-6F" transform="translate(4900,0)"></use><use data-c="6E" xlink:href="#MJX-6-TEX-N-6E" transform="translate(5400,0)"></use></g><g data-mml-node="mrow" transform="translate(6122.7,0)"><g data-mml-node="mo" transform="translate(0 -0.5)"><use data-c="7B" xlink:href="#MJX-6-TEX-S3-7B"></use></g><g data-mml-node="mtable" transform="translate(750,0)"><g data-mml-node="mtr" transform="translate(0,650)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="4A" xlink:href="#MJX-6-TEX-N-4A"></use><use data-c="61" xlink:href="#MJX-6-TEX-N-61" transform="translate(514,0)"></use><use data-c="76" xlink:href="#MJX-6-TEX-N-76" transform="translate(1014,0)"></use><use data-c="61" xlink:href="#MJX-6-TEX-N-61" transform="translate(1542,0)"></use><use data-c="42" xlink:href="#MJX-6-TEX-N-42" transform="translate(2042,0)"></use><use data-c="65" xlink:href="#MJX-6-TEX-N-65" transform="translate(2750,0)"></use><use data-c="61" xlink:href="#MJX-6-TEX-N-61" transform="translate(3194,0)"></use><use data-c="6E" xlink:href="#MJX-6-TEX-N-6E" transform="translate(3694,0)"></use><text data-variant="normal" transform="translate(4250,0) scale(1,-1)" font-size="827.1px" font-family="serif">的</text><use data-c="50" xlink:href="#MJX-6-TEX-N-50" transform="translate(5076.7,0)"></use><use data-c="72" xlink:href="#MJX-6-TEX-N-72" transform="translate(5757.7,0)"></use><use data-c="6F" xlink:href="#MJX-6-TEX-N-6F" transform="translate(6149.7,0)"></use><use data-c="70" xlink:href="#MJX-6-TEX-N-70" transform="translate(6649.7,0)"></use><use data-c="65" xlink:href="#MJX-6-TEX-N-65" transform="translate(7205.7,0)"></use><use data-c="72" xlink:href="#MJX-6-TEX-N-72" transform="translate(7649.7,0)"></use><use data-c="74" xlink:href="#MJX-6-TEX-N-74" transform="translate(8041.7,0)"></use><use data-c="79" xlink:href="#MJX-6-TEX-N-79" transform="translate(8430.7,0)"></use></g></g></g><g data-mml-node="mtr" transform="translate(0,-650)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="4D" xlink:href="#MJX-6-TEX-N-4D"></use><use data-c="61" xlink:href="#MJX-6-TEX-N-61" transform="translate(917,0)"></use><use data-c="70" xlink:href="#MJX-6-TEX-N-70" transform="translate(1417,0)"></use><text data-variant="normal" transform="translate(1973,0) scale(1,-1)" font-size="827.1px" font-family="serif">的</text><text data-variant="normal" transform="translate(2799.7,0) scale(1,-1)" font-size="827.1px" font-family="serif">值</text></g></g></g></g><g data-mml-node="mo" transform="translate(9708.7,0) translate(0 250)"></g></g></g></g></g><g data-mml-node="mo" transform="translate(16720.4,0) translate(0 250)"></g></g></g></g></g></g></g></svg></mjx-container></div></div>
<pre><code class="language-jsp" lang="jsp">&lt;!-- 无体版本 --&gt;
&lt;c:set var="userLevel" scope="session" value="Cowboy" /&gt;

&lt;!-- 有体版本： 计算体的内容，并将结果作为 value的值（如果计算结果为null，则变量会被删除！） --&gt;
&lt;c:set var="userLevel" scope="session"&gt;
    Sheriff, Bartender, Cowgirl
&lt;/c:set&gt;
</code></pre>
<pre><code class="language-jsp" lang="jsp">&lt;!-- 注意：此处target必须传入 对象的引用本身，而不能传递 对象的ID String--&gt;
&lt;c:set target="${PetMap}" property="dogName" value="Clover" /&gt;
</code></pre>
<blockquote><p>对于 <code>&lt;c:out&gt;</code> ，如果没有指定 <code>scope</code>，则默认 <code>只会搜索 pageScope</code></p>
</blockquote>
</blockquote>
<blockquote><ul>
<li><code>&lt;c:remove&gt;</code></li>

</ul>
<pre><code class="language-jsp" lang="jsp">&lt;c:set var="userStatus" scope="request" value="Brilliant" /&gt;
before userStatus: ${userStatus} &lt;br&gt;
&lt;!-- scope是可选的，默认会指定为 所有的作用域 --&gt;
&lt;c:remove var="userStatus" scope="request" /&gt;
&lt;!-- 此处会打印出 空字符串 （因为EL是null友好的） --&gt;
after userStatus: ${userStatus} &lt;br&gt;
</code></pre>
</blockquote>
<blockquote><ul>
<li><code>&lt;c:import&gt;</code></li>

</ul>
<p>在 <code>请求</code> 时，将 <code>URL指定的内容</code> 粘贴到 <code>当前页面</code>。（类似于 <code>&lt;jsp:include&gt; 标准动作</code>，只不过 <code>&lt;c:import&gt;</code> 可以 <code>通过URL来引用app外部的资源</code> ）</p>
<blockquote><p>可以搭配 <code>&lt;c:param&gt;</code> 来使用。</p>
<pre><code class="language-jsp" lang="jsp">&lt;c:import url="Header.jsp"&gt;
 &lt;c:param name="subTitle" value="We take the sting out of SOAP." /&gt;
&lt;/c:import&gt;
</code></pre>
</blockquote>
</blockquote>
<blockquote><ul>
<li><code>&lt;c:url&gt;</code></li>

</ul>
<pre><code class="language-java" lang="java">out.println("&lt;a href=\"" + response.encodeURL("/BeerTest.do") + "\"&gt;Click Here&lt;/a&gt;");
</code></pre>
<pre><code class="language-jsp" lang="jsp">&lt;a href="&lt;c:url value='/inputComments.jsp' /&gt;"&gt;Click Here&lt;/a&gt;
</code></pre>
<blockquote><p>注意，<code>&lt;c:url&gt;</code> 仅仅进行 <code>URL重写</code>，但不包含 <code>URL编码</code>。</p>
<p>若需要 <code>URL编码</code>，则使用 <code>&lt;c:param&gt;</code> 来 <code>显式地指出所有的参数列表</code></p>
<pre><code class="language-jsp" lang="jsp">&lt;c:url value="/inputComments.jsp" var="inputURL"&gt;
 &lt;c:param name="firstName" value="${first}" /&gt;
 &lt;c:param name="lastName" value="${last}" /&gt;
&lt;/c:url&gt;
</code></pre>
</blockquote>
</blockquote>
<blockquote><ul>
<li>建立 <code>错误页面</code></li>

</ul>
<pre><code class="language-jsp" lang="jsp">&lt;!-- errorPage.jsp --&gt;
&lt;%@ page isErrorPage="true" %&gt;
&lt;html&gt;
	You caused a ${pageContext.exception} on the server.
&lt;/html&gt;
</code></pre>
<pre><code class="language-jsp" lang="jsp">&lt;!-- badPage.jsp --&gt;
&lt;%@ page errorPage="errorPage.jsp" %&gt;
&lt;html&gt;
    About to be bad...
    &lt;% int x = 10 / 0; %&gt;
&lt;/html&gt;
</code></pre>
<blockquote><p>此外，也可以通过 <code>DD文件</code> 来指定 <code>错误页面</code> 的 <code>匹配规则</code></p>
<pre><code class="language-xml" lang="xml">&lt;error-page&gt;
 &lt;exception-type&gt;java.lang.ArithmeticException&lt;/exception-type&gt;
 &lt;location&gt;/aritimeticErrorPage.jsp&lt;/location&gt;
&lt;/error-page&gt;
</code></pre>
</blockquote>
</blockquote>
<blockquote><ul>
<li><code>&lt;c:catch&gt;</code></li>

</ul>
<p>该标签会 <code>同时</code> 作为 <code>try</code> 和 <code>catch</code>，实际上，它的语义和 <code>catch</code> 不同。（它表现得更快 <code>try</code> 块）</p>
<p>一旦 <code>异常</code> 发生，<code>控制流</code> 会 <code>直接跳转</code> 到 <code>&lt;c:catch&gt;标记体的末尾</code>。即：一旦 <code>&lt;c:catch&gt;</code> 中出现异常，则 <code>体中的剩余部分</code> 不会继续运行。</p>
</blockquote>
<blockquote><ul>
<li>自定义 <code>Tag Library</code></li>

</ul>
<pre><code class="language-xml" lang="xml">&lt;!-- 标记库描述文件 (Tag Library Descriptor, TLD) --&gt;
&lt;!-- 
容器在4个位置中查找TLD：
1. WEB-INF目录
2. WEB-INF的一个子目录
3. WEB-INF/lib的jar文件中的META-INF目录
4. WEB-INF/lib的jar文件中的META-INF目录的一个子目录
--&gt;
&lt;xml ...&gt;
    &lt;tlib-version&gt;1.2&lt;/tlib-version&gt;
    &lt;short-name&gt;RandomTags&lt;/short-name&gt;

    &lt;!-- 自定义EL函数 --&gt;
    &lt;function&gt;
        &lt;name&gt;rollIt&lt;/name&gt;
        &lt;function-class&gt;foo.DiceRoller&lt;/function-class&gt;
        &lt;function-signature&gt;int rollDice()&lt;/function-signature&gt;
    &lt;/function&gt;
    
    &lt;!-- 自定义标签 --&gt;
    
    &lt;!-- uri只不过是一个名称，而不是一个必须存在的位置 --&gt;
    &lt;uri&gt;randomThings&lt;/uri&gt;
    &lt;tag&gt;
        &lt;description&gt;random advice&lt;/description&gt;
        &lt;name&gt;advice&lt;/name&gt;
        &lt;tag-class&gt;foo.AdvisorTagHandler&lt;/tag-class&gt;
        &lt;!-- 即使这里声明位empty，仍然可以通过 &lt;jsp:attribute&gt; 在标记的体中存放属性！ --&gt;
        &lt;!-- 对于声明为empty，仍然可以通过 开始标记 和 结束标记 之间没有内容 的方式来调用 --&gt;
        &lt;!-- body-content可以设置为：empty, scriptless, tagdependent, JSP --&gt;
    	&lt;body-content&gt;empty&lt;/body-content&gt;
    
        &lt;!-- 对于定制标记，并不在TLD中书写attribute，而是转移到 标记文件 中书写属性。--&gt;
        &lt;attribute&gt;
        	&lt;name&gt;user&lt;/name&gt;
            &lt;!-- 必须? --&gt;
            &lt;required&gt;true&lt;/required&gt;
            &lt;!-- 允许是运行时表达式量? 默认false --&gt;
            &lt;rtexprvalue&gt;true&lt;/rtexprvalue&gt;
        &lt;/attribute&gt;
    &lt;/tag&gt;

&lt;/xml&gt;
</code></pre>
<pre><code class="language-jsp" lang="jsp">&lt;html&gt; 
    &lt;body&gt;
        &lt;!-- prefix只是一个方便引用的前缀，你可以任意取名。
		但注意不要取保留的前缀名：jsp, jspx, java, javax, servlet, sun, sunw
		--&gt;
        &lt;!-- 对于定制标记，使用tagdir而不是uri --&gt;
    	&lt;%@ taglib prefix="mine" uri="randomThings" %&gt;
        Advisor Page&lt;br&gt; &lt;mine:advice user="${userName}" /&gt;
    &lt;/body&gt;
&lt;/html&gt;
</code></pre>
<pre><code class="language-java" lang="java">public class AdvisorTagHandler extends SimpleTagSupport {

    private String user;
    
    public void doTag() throws JspException, IOException {
        getJspContext().getOut().write("hello " + user + ": " + getAdvice() );
    }
    
    public void setUser(String user) {
        this.user = user;
    }
    
    String getAdvice() {
        return "do nothing";
    }

}
</code></pre>
</blockquote>
<blockquote><p><code>标记文件 (*.tag)</code> 最后仍然需要作为 <code>JSP的一部分</code>，它可以使用 <code>JSP隐式对象</code> 和 <code>EL隐式对象</code>。</p>
<p>但不能使用 <code>ServletContext</code>，取而代之的是使用 <code>JspContext</code>。</p>
</blockquote>
<h3>My Custom Tag</h3>
<div contenteditable="true" spellcheck="false" class="mathjax-block md-end-block md-math-block md-rawblock" id="mathjax-n539" cid="n539" mdtype="math_block" data-math-tag-before="0" data-math-tag-after="0" data-math-labels="[]"><div class="md-rawblock-container md-math-container" tabindex="-1"><mjx-container class="MathJax" jax="SVG" display="true" style="position: relative;"><svg xmlns="http://www.w3.org/2000/svg" width="38.619ex" height="5.428ex" role="img" focusable="false" viewBox="0 -1449.5 17069.7 2399" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" style="vertical-align: -2.148ex;" class="in-text-selection"><defs><path id="MJX-7-TEX-N-4D" d="M132 622Q125 629 121 631T105 634T62 637H29V683H135Q221 683 232 682T249 675Q250 674 354 398L458 124L562 398Q666 674 668 675Q671 681 683 682T781 683H887V637H854Q814 636 803 634T785 622V61Q791 51 802 49T854 46H887V0H876Q855 3 736 3Q605 3 596 0H585V46H618Q660 47 669 49T688 61V347Q688 424 688 461T688 546T688 613L687 632Q454 14 450 7Q446 1 430 1T410 7Q409 9 292 316L176 624V606Q175 588 175 543T175 463T175 356L176 86Q187 50 261 46H278V0H269Q254 3 154 3Q52 3 37 0H29V46H46Q78 48 98 56T122 69T132 86V622Z"></path><path id="MJX-7-TEX-N-79" d="M69 -66Q91 -66 104 -80T118 -116Q118 -134 109 -145T91 -160Q84 -163 97 -166Q104 -168 111 -168Q131 -168 148 -159T175 -138T197 -106T213 -75T225 -43L242 0L170 183Q150 233 125 297Q101 358 96 368T80 381Q79 382 78 382Q66 385 34 385H19V431H26L46 430Q65 430 88 429T122 428Q129 428 142 428T171 429T200 430T224 430L233 431H241V385H232Q183 385 185 366L286 112Q286 113 332 227L376 341V350Q376 365 366 373T348 383T334 385H331V431H337H344Q351 431 361 431T382 430T405 429T422 429Q477 429 503 431H508V385H497Q441 380 422 345Q420 343 378 235T289 9T227 -131Q180 -204 113 -204Q69 -204 44 -177T19 -116Q19 -89 35 -78T69 -66Z"></path><path id="MJX-7-TEX-N-20" d=""></path><path id="MJX-7-TEX-N-43" d="M56 342Q56 428 89 500T174 615T283 681T391 705Q394 705 400 705T408 704Q499 704 569 636L582 624L612 663Q639 700 643 704Q644 704 647 704T653 705H657Q660 705 666 699V419L660 413H626Q620 419 619 430Q610 512 571 572T476 651Q457 658 426 658Q322 658 252 588Q173 509 173 342Q173 221 211 151Q232 111 263 84T328 45T384 29T428 24Q517 24 571 93T626 244Q626 251 632 257H660L666 251V236Q661 133 590 56T403 -21Q262 -21 159 83T56 342Z"></path><path id="MJX-7-TEX-N-75" d="M383 58Q327 -10 256 -10H249Q124 -10 105 89Q104 96 103 226Q102 335 102 348T96 369Q86 385 36 385H25V408Q25 431 27 431L38 432Q48 433 67 434T105 436Q122 437 142 438T172 441T184 442H187V261Q188 77 190 64Q193 49 204 40Q224 26 264 26Q290 26 311 35T343 58T363 90T375 120T379 144Q379 145 379 161T380 201T380 248V315Q380 361 370 372T320 385H302V431Q304 431 378 436T457 442H464V264Q464 84 465 81Q468 61 479 55T524 46H542V0Q540 0 467 -5T390 -11H383V58Z"></path><path id="MJX-7-TEX-N-73" d="M295 316Q295 356 268 385T190 414Q154 414 128 401Q98 382 98 349Q97 344 98 336T114 312T157 287Q175 282 201 278T245 269T277 256Q294 248 310 236T342 195T359 133Q359 71 321 31T198 -10H190Q138 -10 94 26L86 19L77 10Q71 4 65 -1L54 -11H46H42Q39 -11 33 -5V74V132Q33 153 35 157T45 162H54Q66 162 70 158T75 146T82 119T101 77Q136 26 198 26Q295 26 295 104Q295 133 277 151Q257 175 194 187T111 210Q75 227 54 256T33 318Q33 357 50 384T93 424T143 442T187 447H198Q238 447 268 432L283 424L292 431Q302 440 314 448H322H326Q329 448 335 442V310L329 304H301Q295 310 295 316Z"></path><path id="MJX-7-TEX-N-74" d="M27 422Q80 426 109 478T141 600V615H181V431H316V385H181V241Q182 116 182 100T189 68Q203 29 238 29Q282 29 292 100Q293 108 293 146V181H333V146V134Q333 57 291 17Q264 -10 221 -10Q187 -10 162 2T124 33T105 68T98 100Q97 107 97 248V385H18V422H27Z"></path><path id="MJX-7-TEX-N-6F" d="M28 214Q28 309 93 378T250 448Q340 448 405 380T471 215Q471 120 407 55T250 -10Q153 -10 91 57T28 214ZM250 30Q372 30 372 193V225V250Q372 272 371 288T364 326T348 362T317 390T268 410Q263 411 252 411Q222 411 195 399Q152 377 139 338T126 246V226Q126 130 145 91Q177 30 250 30Z"></path><path id="MJX-7-TEX-N-6D" d="M41 46H55Q94 46 102 60V68Q102 77 102 91T102 122T103 161T103 203Q103 234 103 269T102 328V351Q99 370 88 376T43 385H25V408Q25 431 27 431L37 432Q47 433 65 434T102 436Q119 437 138 438T167 441T178 442H181V402Q181 364 182 364T187 369T199 384T218 402T247 421T285 437Q305 442 336 442Q351 442 364 440T387 434T406 426T421 417T432 406T441 395T448 384T452 374T455 366L457 361L460 365Q463 369 466 373T475 384T488 397T503 410T523 422T546 432T572 439T603 442Q729 442 740 329Q741 322 741 190V104Q741 66 743 59T754 49Q775 46 803 46H819V0H811L788 1Q764 2 737 2T699 3Q596 3 587 0H579V46H595Q656 46 656 62Q657 64 657 200Q656 335 655 343Q649 371 635 385T611 402T585 404Q540 404 506 370Q479 343 472 315T464 232V168V108Q464 78 465 68T468 55T477 49Q498 46 526 46H542V0H534L510 1Q487 2 460 2T422 3Q319 3 310 0H302V46H318Q379 46 379 62Q380 64 380 200Q379 335 378 343Q372 371 358 385T334 402T308 404Q263 404 229 370Q202 343 195 315T187 232V168V108Q187 78 188 68T191 55T200 49Q221 46 249 46H265V0H257L234 1Q210 2 183 2T145 3Q42 3 33 0H25V46H41Z"></path><path id="MJX-7-TEX-N-54" d="M36 443Q37 448 46 558T55 671V677H666V671Q667 666 676 556T685 443V437H645V443Q645 445 642 478T631 544T610 593Q593 614 555 625Q534 630 478 630H451H443Q417 630 414 618Q413 616 413 339V63Q420 53 439 50T528 46H558V0H545L361 3Q186 1 177 0H164V46H194Q264 46 283 49T309 63V339V550Q309 620 304 625T271 630H244H224Q154 630 119 601Q101 585 93 554T81 486T76 443V437H36V443Z"></path><path id="MJX-7-TEX-N-61" d="M137 305T115 305T78 320T63 359Q63 394 97 421T218 448Q291 448 336 416T396 340Q401 326 401 309T402 194V124Q402 76 407 58T428 40Q443 40 448 56T453 109V145H493V106Q492 66 490 59Q481 29 455 12T400 -6T353 12T329 54V58L327 55Q325 52 322 49T314 40T302 29T287 17T269 6T247 -2T221 -8T190 -11Q130 -11 82 20T34 107Q34 128 41 147T68 188T116 225T194 253T304 268H318V290Q318 324 312 340Q290 411 215 411Q197 411 181 410T156 406T148 403Q170 388 170 359Q170 334 154 320ZM126 106Q126 75 150 51T209 26Q247 26 276 49T315 109Q317 116 318 175Q318 233 317 233Q309 233 296 232T251 223T193 203T147 166T126 106Z"></path><path id="MJX-7-TEX-N-67" d="M329 409Q373 453 429 453Q459 453 472 434T485 396Q485 382 476 371T449 360Q416 360 412 390Q410 404 415 411Q415 412 416 414V415Q388 412 363 393Q355 388 355 386Q355 385 359 381T368 369T379 351T388 325T392 292Q392 230 343 187T222 143Q172 143 123 171Q112 153 112 133Q112 98 138 81Q147 75 155 75T227 73Q311 72 335 67Q396 58 431 26Q470 -13 470 -72Q470 -139 392 -175Q332 -206 250 -206Q167 -206 107 -175Q29 -140 29 -75Q29 -39 50 -15T92 18L103 24Q67 55 67 108Q67 155 96 193Q52 237 52 292Q52 355 102 398T223 442Q274 442 318 416L329 409ZM299 343Q294 371 273 387T221 404Q192 404 171 388T145 343Q142 326 142 292Q142 248 149 227T179 192Q196 182 222 182Q244 182 260 189T283 207T294 227T299 242Q302 258 302 292T299 343ZM403 -75Q403 -50 389 -34T348 -11T299 -2T245 0H218Q151 0 138 -6Q118 -15 107 -34T95 -74Q95 -84 101 -97T122 -127T170 -155T250 -167Q319 -167 361 -139T403 -75Z"></path><path id="MJX-7-TEX-S3-7B" d="M618 -943L612 -949H582L568 -943Q472 -903 411 -841T332 -703Q327 -682 327 -653T325 -350Q324 -28 323 -18Q317 24 301 61T264 124T221 171T179 205T147 225T132 234Q130 238 130 250Q130 255 130 258T131 264T132 267T134 269T139 272T144 275Q207 308 256 367Q310 436 323 519Q324 529 325 851Q326 1124 326 1154T332 1205Q369 1358 566 1443L582 1450H612L618 1444V1429Q618 1413 616 1411L608 1406Q599 1402 585 1393T552 1372T515 1343T479 1305T449 1257T429 1200Q425 1180 425 1152T423 851Q422 579 422 549T416 498Q407 459 388 424T346 364T297 318T250 284T214 264T197 254L188 251L205 242Q290 200 345 138T416 3Q421 -18 421 -48T423 -349Q423 -397 423 -472Q424 -677 428 -694Q429 -697 429 -699Q434 -722 443 -743T465 -782T491 -816T519 -845T548 -868T574 -886T595 -899T610 -908L616 -910Q618 -912 618 -928V-943Z"></path><path id="MJX-7-TEX-N-46" d="M128 619Q121 626 117 628T101 631T58 634H25V680H582V676Q584 670 596 560T610 444V440H570V444Q563 493 561 501Q555 538 543 563T516 601T477 622T431 631T374 633H334H286Q252 633 244 631T233 621Q232 619 232 490V363H284Q287 363 303 363T327 364T349 367T372 373T389 385Q407 403 410 459V480H450V200H410V221Q407 276 389 296Q381 303 371 307T348 313T327 316T303 317T284 317H232V189L233 61Q240 54 245 52T270 48T333 46H360V0H348Q324 3 182 3Q51 3 36 0H25V46H58Q100 47 109 49T128 61V619Z"></path><path id="MJX-7-TEX-N-69" d="M69 609Q69 637 87 653T131 669Q154 667 171 652T188 609Q188 579 171 564T129 549Q104 549 87 564T69 609ZM247 0Q232 3 143 3Q132 3 106 3T56 1L34 0H26V46H42Q70 46 91 49Q100 53 102 60T104 102V205V293Q104 345 102 359T88 378Q74 385 41 385H30V408Q30 431 32 431L42 432Q52 433 70 434T106 436Q123 437 142 438T171 441T182 442H185V62Q190 52 197 50T232 46H255V0H247Z"></path><path id="MJX-7-TEX-N-6C" d="M42 46H56Q95 46 103 60V68Q103 77 103 91T103 124T104 167T104 217T104 272T104 329Q104 366 104 407T104 482T104 542T103 586T103 603Q100 622 89 628T44 637H26V660Q26 683 28 683L38 684Q48 685 67 686T104 688Q121 689 141 690T171 693T182 694H185V379Q185 62 186 60Q190 52 198 49Q219 46 247 46H263V0H255L232 1Q209 2 183 2T145 3T107 3T57 1L34 0H26V46H42Z"></path><path id="MJX-7-TEX-N-65" d="M28 218Q28 273 48 318T98 391T163 433T229 448Q282 448 320 430T378 380T406 316T415 245Q415 238 408 231H126V216Q126 68 226 36Q246 30 270 30Q312 30 342 62Q359 79 369 104L379 128Q382 131 395 131H398Q415 131 415 121Q415 117 412 108Q393 53 349 21T250 -11Q155 -11 92 58T28 218ZM333 275Q322 403 238 411H236Q228 411 220 410T195 402T166 381T143 340T127 274V267H333V275Z"></path><path id="MJX-7-TEX-N-48" d="M128 622Q121 629 117 631T101 634T58 637H25V683H36Q57 680 180 680Q315 680 324 683H335V637H302Q262 636 251 634T233 622L232 500V378H517V622Q510 629 506 631T490 634T447 637H414V683H425Q446 680 569 680Q704 680 713 683H724V637H691Q651 636 640 634T622 622V61Q628 51 639 49T691 46H724V0H713Q692 3 569 3Q434 3 425 0H414V46H447Q489 47 498 49T517 61V332H232V197L233 61Q239 51 250 49T302 46H335V0H324Q303 3 180 3Q45 3 36 0H25V46H58Q100 47 109 49T128 61V622Z"></path><path id="MJX-7-TEX-N-6E" d="M41 46H55Q94 46 102 60V68Q102 77 102 91T102 122T103 161T103 203Q103 234 103 269T102 328V351Q99 370 88 376T43 385H25V408Q25 431 27 431L37 432Q47 433 65 434T102 436Q119 437 138 438T167 441T178 442H181V402Q181 364 182 364T187 369T199 384T218 402T247 421T285 437Q305 442 336 442Q450 438 463 329Q464 322 464 190V104Q464 66 466 59T477 49Q498 46 526 46H542V0H534L510 1Q487 2 460 2T422 3Q319 3 310 0H302V46H318Q379 46 379 62Q380 64 380 200Q379 335 378 343Q372 371 358 385T334 402T308 404Q263 404 229 370Q202 343 195 315T187 232V168V108Q187 78 188 68T191 55T200 49Q221 46 249 46H265V0H257L234 1Q210 2 183 2T145 3Q42 3 33 0H25V46H41Z"></path><path id="MJX-7-TEX-N-64" d="M376 495Q376 511 376 535T377 568Q377 613 367 624T316 637H298V660Q298 683 300 683L310 684Q320 685 339 686T376 688Q393 689 413 690T443 693T454 694H457V390Q457 84 458 81Q461 61 472 55T517 46H535V0Q533 0 459 -5T380 -11H373V44L365 37Q307 -11 235 -11Q158 -11 96 50T34 215Q34 315 97 378T244 442Q319 442 376 393V495ZM373 342Q328 405 260 405Q211 405 173 369Q146 341 139 305T131 211Q131 155 138 120T173 59Q203 26 251 26Q322 26 373 103V342Z"></path><path id="MJX-7-TEX-N-72" d="M36 46H50Q89 46 97 60V68Q97 77 97 91T98 122T98 161T98 203Q98 234 98 269T98 328L97 351Q94 370 83 376T38 385H20V408Q20 431 22 431L32 432Q42 433 60 434T96 436Q112 437 131 438T160 441T171 442H174V373Q213 441 271 441H277Q322 441 343 419T364 373Q364 352 351 337T313 322Q288 322 276 338T263 372Q263 381 265 388T270 400T273 405Q271 407 250 401Q234 393 226 386Q179 341 179 207V154Q179 141 179 127T179 101T180 81T180 66V61Q181 59 183 57T188 54T193 51T200 49T207 48T216 47T225 47T235 46T245 46H276V0H267Q249 3 140 3Q37 3 28 0H20V46H36Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="scale(1,-1)"><g data-mml-node="math"><g data-mml-node="mtable"><g data-mml-node="mtr"><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="4D" xlink:href="#MJX-7-TEX-N-4D"></use><use data-c="79" xlink:href="#MJX-7-TEX-N-79" transform="translate(917,0)"></use><use data-c="20" xlink:href="#MJX-7-TEX-N-20" transform="translate(1445,0)"></use><use data-c="43" xlink:href="#MJX-7-TEX-N-43" transform="translate(1695,0)"></use><use data-c="75" xlink:href="#MJX-7-TEX-N-75" transform="translate(2417,0)"></use><use data-c="73" xlink:href="#MJX-7-TEX-N-73" transform="translate(2973,0)"></use><use data-c="74" xlink:href="#MJX-7-TEX-N-74" transform="translate(3367,0)"></use><use data-c="6F" xlink:href="#MJX-7-TEX-N-6F" transform="translate(3756,0)"></use><use data-c="6D" xlink:href="#MJX-7-TEX-N-6D" transform="translate(4256,0)"></use><use data-c="20" xlink:href="#MJX-7-TEX-N-20" transform="translate(5089,0)"></use><use data-c="54" xlink:href="#MJX-7-TEX-N-54" transform="translate(5339,0)"></use><use data-c="61" xlink:href="#MJX-7-TEX-N-61" transform="translate(6061,0)"></use><use data-c="67" xlink:href="#MJX-7-TEX-N-67" transform="translate(6561,0)"></use></g><g data-mml-node="mrow" transform="translate(7227.7,0)"><g data-mml-node="mo" transform="translate(0 -0.5)"><use data-c="7B" xlink:href="#MJX-7-TEX-S3-7B"></use></g><g data-mml-node="mtable" transform="translate(750,0)"><g data-mml-node="mtr" transform="translate(0,650)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="43" xlink:href="#MJX-7-TEX-N-43"></use><use data-c="75" xlink:href="#MJX-7-TEX-N-75" transform="translate(722,0)"></use><use data-c="73" xlink:href="#MJX-7-TEX-N-73" transform="translate(1278,0)"></use><use data-c="74" xlink:href="#MJX-7-TEX-N-74" transform="translate(1672,0)"></use><use data-c="6F" xlink:href="#MJX-7-TEX-N-6F" transform="translate(2061,0)"></use><use data-c="6D" xlink:href="#MJX-7-TEX-N-6D" transform="translate(2561,0)"></use><use data-c="20" xlink:href="#MJX-7-TEX-N-20" transform="translate(3394,0)"></use><use data-c="54" xlink:href="#MJX-7-TEX-N-54" transform="translate(3644,0)"></use><use data-c="61" xlink:href="#MJX-7-TEX-N-61" transform="translate(4366,0)"></use><use data-c="67" xlink:href="#MJX-7-TEX-N-67" transform="translate(4866,0)"></use><use data-c="20" xlink:href="#MJX-7-TEX-N-20" transform="translate(5366,0)"></use><use data-c="46" xlink:href="#MJX-7-TEX-N-46" transform="translate(5616,0)"></use><use data-c="69" xlink:href="#MJX-7-TEX-N-69" transform="translate(6269,0)"></use><use data-c="6C" xlink:href="#MJX-7-TEX-N-6C" transform="translate(6547,0)"></use><use data-c="65" xlink:href="#MJX-7-TEX-N-65" transform="translate(6825,0)"></use></g></g></g><g data-mml-node="mtr" transform="translate(0,-650)"><g data-mml-node="mtd"></g><g data-mml-node="mtd"><g data-mml-node="mtext"><use data-c="43" xlink:href="#MJX-7-TEX-N-43"></use><use data-c="75" xlink:href="#MJX-7-TEX-N-75" transform="translate(722,0)"></use><use data-c="73" xlink:href="#MJX-7-TEX-N-73" transform="translate(1278,0)"></use><use data-c="74" xlink:href="#MJX-7-TEX-N-74" transform="translate(1672,0)"></use><use data-c="6F" xlink:href="#MJX-7-TEX-N-6F" transform="translate(2061,0)"></use><use data-c="6D" xlink:href="#MJX-7-TEX-N-6D" transform="translate(2561,0)"></use><use data-c="20" xlink:href="#MJX-7-TEX-N-20" transform="translate(3394,0)"></use><use data-c="54" xlink:href="#MJX-7-TEX-N-54" transform="translate(3644,0)"></use><use data-c="61" xlink:href="#MJX-7-TEX-N-61" transform="translate(4366,0)"></use><use data-c="67" xlink:href="#MJX-7-TEX-N-67" transform="translate(4866,0)"></use><use data-c="20" xlink:href="#MJX-7-TEX-N-20" transform="translate(5366,0)"></use><use data-c="48" xlink:href="#MJX-7-TEX-N-48" transform="translate(5616,0)"></use><use data-c="61" xlink:href="#MJX-7-TEX-N-61" transform="translate(6366,0)"></use><use data-c="6E" xlink:href="#MJX-7-TEX-N-6E" transform="translate(6866,0)"></use><use data-c="64" xlink:href="#MJX-7-TEX-N-64" transform="translate(7422,0)"></use><use data-c="6C" xlink:href="#MJX-7-TEX-N-6C" transform="translate(7978,0)"></use><use data-c="65" xlink:href="#MJX-7-TEX-N-65" transform="translate(8256,0)"></use><use data-c="72" xlink:href="#MJX-7-TEX-N-72" transform="translate(8700,0)"></use></g></g></g></g><g data-mml-node="mo" transform="translate(9842,0) translate(0 250)"></g></g></g></g></g></g></g></svg></mjx-container></div></div>
<p>&nbsp;</p>
<h4>Custom Tag File</h4>
<pre><code class="language-xml" lang="xml">&lt;!-- TLD --&gt;
&lt;taglib&gt;
    &lt;tlib-version&gt;1.0&lt;/tlib-version&gt;
    &lt;uri&gt;myTagLibrary&lt;/uri&gt;
    &lt;tag-file&gt;
    	&lt;name&gt;Header&lt;/name&gt;
        &lt;path&gt;/META-INF/tags/Header.tag&lt;/path&gt;
    &lt;/tag-file&gt;
&lt;/taglib&gt;
</code></pre>
<pre><code class="language-jsp" lang="jsp">&lt;!-- Custom Tag File (定制标记文件) --&gt;
&lt;%@ attribute name="subTitle" required="true" rtexprvalue="true" %&gt;
&lt;!-- body-content可取值为 scriptless(默认值), empty, tagdependent(直接当作纯文本处理)--&gt;
&lt;%@ tag body-content="tagdepent" %&gt;
&lt;strong&gt;${subTitle}&lt;/strong&gt;
</code></pre>
<pre><code class="language-jsp" lang="jsp">&lt;!-- Usage --&gt;
&lt;%@ taglib prefix="myTags" tagdir="/WEB-INF/tags" %&gt;
&lt;html&gt;
    &lt;body&gt;
    	&lt;myTags:Header subTitle="We take the String out of SOAP" /&gt;
    &lt;/body&gt;
&lt;/html&gt;
</code></pre>
<h4>Custom Tag Handler</h4>
<pre><code class="language-xml" lang="xml">&lt;!-- TLD --&gt;
&lt;taglib ..&gt;
    &lt;tlib-version&gt;1.2&lt;/tlib-version&gt;
    &lt;uri&gt;simpleTags&lt;/uri&gt;

    &lt;tag&gt;
    	&lt;description&gt;worst use of a custom tag&lt;/description&gt;
        &lt;name&gt;simple1&lt;/name&gt;
        &lt;tag-class&gt;foo.SimpleTagTest1&lt;/tag-class&gt;
        &lt;body-content&gt;empty&lt;/body-content&gt;
    &lt;/tag&gt;
&lt;/taglib&gt;
</code></pre>
<pre><code class="language-java" lang="java">/* Tag Handler */
// 每个SimpleTagHandler不会重用，每个实例只会被调用1次
public class SimpleTagTest1 extends SimpleTagSupport {
 public void doTag() throws JspException, IOException {
     // 使用 getJspBody().invoke(null) 来处理标记的体 (如果有)，并将结果打印到响应
	 // 使用 throw new SkipPageException() 来停止处理后续的页面。（对于嵌套的页面，该异常只会影响 直接抛出该异常的页面，外围页面均不受异常的影响）      // setJspBody() 只会在 实际调用标记 时 确确实实 存在体 才会被执行。（不管标记的声明是否要求 有体）

     ...
 }   
}
</code></pre>
<pre><code class="language-jsp" lang="jsp">&lt;%@ taglib prefix="myTags" uri="simpleTags" %&gt;
&lt;html&gt;
    &lt;body&gt;
    	&lt;myTags:simple1 /&gt;
    &lt;/body&gt;
&lt;/html&gt;
</code></pre>
<blockquote><p>这里仅列出 <code>SimpleTagSupport</code>，不考虑 <code>TagSupport</code> </p>
</blockquote>
<h3>Deploy Application</h3>
<blockquote><p>OUT-OF-DATE</p>
</blockquote>
<h3>Application Security</h3>
<p><code>Servlet安全</code>  可以划分为： <code>认证</code>，<code>授权</code>，<code>机密性</code>， <code>数据完整性</code></p>
<pre><code class="language-jsp" lang="jsp">&lt;web-app&gt;
	&lt;security-constraint&gt;
    	&lt;web-resource-collection&gt;
            &lt;!-- 至少指定1个url-pattern --&gt;
        	&lt;url-pattern&gt;/Beer/AddRecipe/*&lt;/url-pattern&gt;
            &lt;url-pattern&gt;/Beer/ReviewRecipe/*&lt;/url-pattern&gt;
            &lt;!-- 如果没有指定任何http方法，则所有的方法都是受约束的。（一旦指定任何http方法，则只有这部分方法受约束） --&gt;
            &lt;http-method&gt;GET&lt;/http-method&gt;
            &lt;http-method&gt;POST&lt;/http-method&gt;
        &lt;/web-resource-collection&gt;

        &lt;auth-constraint&gt;
            &lt;!-- 通过role-name对用户进行许可 --&gt;
            &lt;!-- &lt;role-name&gt;*&lt;/role-name&gt; 表示所有用户都被许可--&gt;
            &lt;!-- 如果两个不同的非空&lt;auto-constraint&gt;元素应用于 同一个受限资源，则两个元素中的所有角色的并集 都可以访问该首先资源--&gt;
            &lt;role-name&gt;Admin&lt;/role-name&gt;
            &lt;role-name&gt;Member&lt;/role-name&gt;
        &lt;/auth-constraint&gt;
    &lt;/security-constraint&gt;

&lt;/web-app&gt;
</code></pre>
<h3>Filter &amp; Wrapper</h3>
<p>只有1个 <code>过滤器接口：Filter</code>，当谈到 <code>请求过滤器</code> 和 <code>响应过滤器</code> 时，只是在说 <code>如何使用</code> 过滤器，对于容器来说，只有 <code>1种过滤器</code></p>
<pre><code class="language-java" lang="java">public class BeerRequestFilter implements Filter {

    private FilterConfig fc;
    
    public void init(FilterConfig config) throws ServletException {
    	this.fc=config;
    }
    
    public void doFilter(ServletRequest req, ServletResponse, resp, FilterChain chain) throws ServletException, IOException {
        // do something.
        chain.doFilter(req, resp);
    }
    
    public void destroy() {
        // do some clean-up
    }

}
</code></pre>
<pre><code class="language-xml" lang="xml">&lt;filter&gt;
    &lt;filter-name&gt;BeerRequest&lt;/filter-name&gt;
    &lt;filtet-class&gt;com.example.web.BeerRequestFilter&lt;/filtet-class&gt;
    &lt;init-param&gt;
    	&lt;param-name&gt;LogFileName&lt;/param-name&gt;
        &lt;param-value&gt;UserLog.txt&lt;/param-value&gt;
    &lt;/init-param&gt;
&lt;/filter&gt;

&lt;filter-mapping&gt;
	&lt;filter-name&gt;BeerRequest&lt;/filter-name&gt;
    &lt;url-pattern&gt;*.do&lt;/url-pattern&gt;
&lt;/filter-mapping&gt;

&lt;!-- or --&gt;
&lt;filter-mapping&gt;
	&lt;filter-name&gt;BeerRequest&lt;/filter-name&gt;
    &lt;servlet-name&gt;AdviceServlet&lt;/servlet-name&gt;
&lt;/filter-mapping&gt;
</code></pre>
<h3>Pattern &amp; struts</h3>
<blockquote><p>OUT-OF-DATE</p>
</blockquote>
<p>实际上，这篇文章几乎都是错误。</p>
<p>&nbsp;</p>

{% endraw %}



