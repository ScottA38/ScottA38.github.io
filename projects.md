---
layout: page
title: "My projects / project contributions"
permalink: /projects/
categories: work portfolio
---
{% for repository in site.github.public_repositories %}
  {% for project in site.data.projects %}
    {% if repository.name == project.name %}
      <img class="br4 h10 w10 dib" src="{{ project.url }}" alt="{{ project.alt }}"/>
    {% endif %}
  {% endfor %}
  * [{{ repository.name }}]({{ repository.html_url }})
  {{repository.description}}
{% endfor %}
