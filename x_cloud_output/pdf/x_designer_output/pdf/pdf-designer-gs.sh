# Note that .sh scripts work only on Mac. If you're on Windows, install Git Bash and use that as your client.

echo 'Killing all Jekyll instances'
kill -9 $(ps aux | grep '[j]ekyll' | awk '{print $2}')
clear

echo "Building PDF-friendly HTML site for Cloud Getting Started ...";
bundle exec jekyll serve --detach --config _config_Designer.yml,pdfconfigs/designer/config_designer_gs_pdf.yml;
echo "done";

echo "Building the PDF ...";
prince --javascript --input-list=x_designer_output/pdf/pdfconfigs/prince-list.txt -o x_designer_output/pdf/GetStarted.pdf;
echo "done";

