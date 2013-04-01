

for pyfile in *.py 
do
  pygmentize -f latex $pyfile > ${pyfile/py/tex}
done
for pyfile in *.cpp 
do
  pygmentize -f latex $pyfile > ${pyfile/cpp/tex}
done
