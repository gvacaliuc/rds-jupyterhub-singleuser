{%- extends 'null.tpl' -%}

{% block header %}
"""
Rice University
File Name: {{resources.metadata.name}}
"""
{% endblock header %}

{% block input %}
{{ cell.source | ipython2python }}
{% endblock input %}
