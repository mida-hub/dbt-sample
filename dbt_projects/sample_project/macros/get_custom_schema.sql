{% macro generate_schema_name(custom_schema_name, node) -%}
  {%- set default_schema = target.schema -%}
  {%- if custome_schema_name is none or custom_schema_name == None -%}
    {{ default_schema }}
  {%- else -%}
    {{ custom_schema_name | trim }}
  {%- endif -%}
{%- endmacro %}
