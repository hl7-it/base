---
title: Datatypes defined for this Guide
layout: default
active: datatypes
---


{% for sd_hash in site.data.structuredefinitions -%}
  {%- assign sd = sd_hash[1] -%}
  {%- if sd.kind  == "complex-type" and sd.type != "Extension" -%}
   <li> <a href="{{sd.path}}">{{sd.name}}</a>{{sd.title}}. {{sd.description}} </li>
  {%- endif -%}
{%- endfor -%}

<!--
 <table>
   <tr>
    <th colspan="2">CEN EN 17269 DATATYPES</th>
  </tr>
 </table>
-->
