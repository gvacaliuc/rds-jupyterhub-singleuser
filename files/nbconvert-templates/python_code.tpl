{%- extends 'null.tpl' -%}

{% block header %}
"""
Rice University
Gabe Vacaliuc

Assignment Name: {{resources.metadata.name}}
"""
{% endblock header %}

{% block input %}
{{ cell.source | ipython2python }}
{% endblock input %}
