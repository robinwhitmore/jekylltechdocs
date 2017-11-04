# build Cloud
cd Documents/NewDocs
bundle exec jekyll build --config _config_Cloud.yml --destination x_cloud_output

# copy output to Git Cloud output dir
cd ../..
cp -R ~/Documents/NewDocs/x_cloud_output/ ~/Documents/CloudPublished/

cd Documents/CloudPublished/

# push changes to Cloud repo
git add *
git commit -m "move to published directory"
git push --set-upstream https://github.com/robinwhitmore/CloudDocs.git master --force

