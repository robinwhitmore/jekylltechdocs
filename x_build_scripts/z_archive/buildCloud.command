# build Cloud
cd Documents/jekylltechdocs
bundle exec jekyll build --config _config_Cloud.yml --destination cloud_output/docs

# copy output to Git Cloud output dir
cd ../..
cp -R ~/Documents/jekylltechdocs/cloud_output/docs ~/Documents/CloudPublished/

