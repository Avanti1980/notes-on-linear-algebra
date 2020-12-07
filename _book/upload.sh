gitbook build
git add _book/ font/ img/ node_modules/gitbook-plugin-mathjax/ posts/ styles/ book.json README.md SUMMARY.md upload.sh
git commit -m "$1"
git push origin master
