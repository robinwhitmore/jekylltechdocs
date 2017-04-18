---
layout: none
search: exclude
---
{% include custom/conditions.html %}

{% if site.project == "cloud" %}

<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="0;url="cl_gs_gs.html">
    <script type="text/javascript">
        window.location.href = "cl_gs_gs.html"
    </script>

</head>
<body>

</body>
</html>

{% elsif site.project == "platform" %}
{% assign sidebar = site.data.sidebars.pf_apps_sidebar.entries %}
<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="0;url="pf_apps_gs.html">
    <script type="text/javascript">
        window.location.href = "pf_apps_gs.html"
    </script>

</head>
<body>

</body>
</html>

{% endif %}
