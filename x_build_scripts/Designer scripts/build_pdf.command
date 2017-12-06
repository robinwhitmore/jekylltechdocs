echo 'Killing all Jekyll instances'
kill -9 $(ps aux | grep '[j]ekyll' | awk '{print $2}')
clear

cd Documents/NewDocs
echo "Building PDF-friendly HTML site for Designer Getting Started ...";
bundle exec jekyll serve --detach --config _config_Designer.yml,pdfconfigs/config_designer_gs_pdf.yml;
echo "done";

echo "Building the PDF ...";
prince --javascript --input-list=x_designer_output/pdf/pdfconfigs/prince-list.txt -o downloads/Migration.pdf;
echo "done";
