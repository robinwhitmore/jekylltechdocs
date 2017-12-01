# echo 'Killing all Jekyll instances'
# kill -9 $(ps aux | grep '[j]ekyll' | awk '{print $2}')
# clear

# cd Documents/NewDocs
# echo "Building PDF-friendly HTML site for Designer Getting Started ...";
# bundle exec jekyll serve --detach --config _config_Designer.yml,pdfconfigs/config_designer_gs_pdf.yml;
# echo "done";

# echo "Building the PDF ...";
# prince --javascript --input-list=x_designer_output/pdf/pdfconfigs/prince-list.txt -o downloads/Migration.pdf;
# echo "done";


# build Designer
echo "Building HTML site for Designer ...";
bundle exec jekyll build --config _config_Designer.yml --destination x_designer_output

echo "Copying to local output dir"
# copy output to Git Designer output dir
cd ../..
cp -R ~/Documents/NewDocs/x_designer_output/ ~/Documents/DesignerDocsStaging/
echo "Done"

cd Documents/DesignerDocs/

# echo "Push to GIT staging repo"
# push changes to Designer repo
# git add *
# git commit -m "move to published directory"

# git push --set-upstream https://github.com/robinwhitmore/DesignerDocs.git master --force

# git push --set-upstream https://github.com/Weebly/designer-docs.git master --force

# git push --set-upstream https://github.intern.weebly.net/weebly/staging-designerDocs.git master --force
