cp node_modules/gitbook-plugin-mathjax/book/plugin.js js/
gitbook build
git add *
git commit -m "$1"
git push origin master
