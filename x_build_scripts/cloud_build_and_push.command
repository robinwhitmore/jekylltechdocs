# build Cloud
cd Documents/jekylltechdocs
bundle exec jekyll build --config _config_Cloud.yml --destination x_cloud_output/docs

# copy output to Git Cloud output dir
cd ../..
cp -R ~/Documents/jekylltechdocs/x_cloud_output/docs ~/Documents/CloudPublished/

cd Documents/CloudPublished/

# push changes to Cloud repo
git add *
git commit -m "move to published directory"
git push --set-upstream https://github.com/robinwhitmore/CloudDocs.git master --force

