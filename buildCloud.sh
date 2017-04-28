//build Cloud
bundle exec jekyll serve --config _config_Cloud.yml --destination x_cloud_output

//copy output to Git Cloud output dir
cd ../
cp -R ~/Documents/jekylltechdocs/x_cloud_output ~/Documents/CloudPublished/CloudDocs-master

//push changes to Cloud repo
git add *
git commit -m "move to published directory"
git push