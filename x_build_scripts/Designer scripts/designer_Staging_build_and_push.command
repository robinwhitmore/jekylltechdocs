cd ../..

# build Designer
echo "Building HTML site for Designer ...";
bundle exec jekyll build --config _config_Designer.yml --destination x_designer_output

echo "Copying to local output dir"
# copy output to Git Designer output dir
cd ../..
cp -R ~/Documents/NewDocs/x_designer_output/ ~/Documents/staging-Designer/
echo "Done"

 cd Documents/staging-Designer

 echo "Push to GIT staging repo"
# push changes to Designer staging repo

git add *
git commit -m "move to staging directory"

git push --set-upstream https://github.com/robinwhitmore/staging-Designer.git master --force


