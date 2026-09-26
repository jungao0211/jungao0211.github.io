---
permalink: /
title: "Jun Gao"
excerpt: "Combinatorics, graph theory, extremal set theory and discrete geometry."
redirect_from:
  - /about/
  - /about.html
---

<p class="language-switch"><span aria-current="page">English</span> / <a href="{{ '/zh/' | relative_url }}" lang="zh-CN">中文简介</a></p>

I am currently a tenure-track Associate Professor at the Academy of Mathematics and Systems Science, Chinese Academy of Sciences.

From April 2025 to June 2026, I was a postdoctoral researcher at the University of Warwick, UK, working with Professor [Oleg Pikhurko](https://pikhurko.github.io/).

From August 2022 to March 2025, I was a research fellow in the Extremal Combinatorics and Probability Group, led by Professor [Hong Liu](https://www.ibs.re.kr/ecopro/hongliu/), at the Institute for Basic Science (IBS) in Daejeon, South Korea.

Prior to that, I completed my Ph.D. in the School of Mathematical Sciences at the University of Science and Technology of China (USTC), under the supervision of Professor [Jie Ma](http://staff.ustc.edu.cn/~jiema/). I received my B.S. degree in 2017 from the School of the Gifted Young at USTC.

## Email

[gj950211@gmail.com](mailto:gj950211@gmail.com) or [jungao@amss.ac.cn](mailto:jungao@amss.ac.cn)

## Research Interests

I am interested in Combinatorics, Graph Theory (both extremal and structural), Extremal Set Theory, Discrete Geometry, and their applications to Computer Science.

## Selected publications

<p class="section-intro"><a href="{{ '/publications/' | relative_url }}">Full list of publications and preprints →</a></p>

{% assign selected_papers = site.data.papers | where_exp: "paper", "paper.selected_order != nil" | sort: "selected_order" %}
<ol class="publication-list selected-publications">
{% for pub in selected_papers %}
  {% include publication-item.html paper=pub %}
{% endfor %}
</ol>
