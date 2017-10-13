# Title: Preprocess MDs in MkDocs instance to insert H1s needed 
#        for good results from Lunr search engine
# Author: stephen@kx.com
rm -fr tmp && cp -r Docs tmp && q prepare.q # && mkdocs build && mv Docs docx && mv tmp Docs