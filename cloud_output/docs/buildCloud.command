# build Cloud
cd Documents/jekylltechdocs
bundle exec jekyll build --config _config_Cloud.yml --destination cloud_output/docs

# copy output to Git Cloud output dir
cd ../..
cp -R ~/Documents/jekylltechdocs/cloud_output/docs ~/Documents/CloudPublished/CloudDocs/

cd Documents/CloudPublished/

# push changes to Cloud repo
# git add *
# git commit -m "move to published directory"
# git push