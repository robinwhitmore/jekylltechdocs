# build Designer
cd Documents/jekylltechdocs
bundle exec jekyll build --config _config_Designer.yml --destination x_designer_output

# copy output to Git Designer output dir
cd ../..
cp -R ~/Documents/jekylltechdocs/x_designer_output/ ~/Documents/DesignerDocs/

cd Documents/DesignerDocs/

# push changes to Cloud repo
git add *
git commit -m "move to published directory"
git push --set-upstream https://github.com/robinwhitmore/DesignerDocs.git master --force

