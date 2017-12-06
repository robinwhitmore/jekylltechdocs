echo "Copying to local live dir"
# copy output to Git Designer live dir
cd ../../..
cp -R ~/Documents/staging-Designer/ ~/Documents/DesignerDocsFinal/
echo "Done"

 cd Documents/Documents/DesignerDocsFinal

 echo "Push to GIT live repo"
# push changes to Designer staging repo

 git add *
 git commit -m "move to live directory"

 git push --set-upstream https://github.com/Weebly/designer-docs.git --force


