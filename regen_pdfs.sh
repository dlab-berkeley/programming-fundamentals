# regenerate pdfs from markdown in repo

for fname in ./*.md
do
  markdown-pdf $fname
done

rm pdfs/*

for fname in ./*.pdf
do
  mv $fname pdfs/
done

for fname in answers/*.md
do
  markdown-pdf $fname
done

echo "pdf files successfully regenerated"
