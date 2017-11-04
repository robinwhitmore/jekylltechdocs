# build Platform
 cd Documents/NewDocs
 bundle exec jekyll build --config _config_Platform.yml --destination x_platform_output

# copy output to Git Platform output dir
cd ../..
cp -R ~/Documents/NewDocs/x_platform_output/ ~/Documents/PlatformDocs/

 cd Documents/PlatformDocs/

# push changes to Cloud repo
 git add *
 git commit -m "move to published directory"
 git push --set-upstream https://github.com/robinwhitmore/PlatformDocs.git master --force

