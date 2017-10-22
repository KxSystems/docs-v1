# Title: Preprocess MDs in MkDocs instance to insert H1s needed 
#        for good results from Lunr search engine
# Author: stephen@kx.com
rm -fr tmp docx && cp -r docs tmp && ~/q/m64/q prepare.q && mkdocs build --clean && mv docs docx && mv tmp docs