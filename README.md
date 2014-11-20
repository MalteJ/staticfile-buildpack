Deploy static HTML/JS/CSS apps to Cloud Foundry
-----------------------------------------------

Working on a pure front-end only web app or demo? It is easy to share it via your Cloud Foundry:

```
cf push my-site -m 64M -b https://github.com/MalteJ/staticfile-buildpack.git
```

You only need to create a `Staticfile` file for Cloud Foundry to detect this buildpack:

```
touch Staticfile
cf push my-site -m 64M
```

Why `-m 64M`? Your static assets will be served by [Nginx](http://nginx.com/) and it only requires 20M [[reference](http://wiki.nginx.org/WhyUseIt)]. The `-m 64M` reduces the RAM allocation from the default 1G allocated to Cloud Foundry containers. In the future there may be a way for a buildpack to indicate its default RAM requirements; but not as of writing.


