
:: -A1 Estilo de linhas
:: -t Indenta��o por tabula��es

:: -K Indenta cases
:: -s Indenta switches
:: -w Indenta preprocessor
:: -f Insere linhas em branco entres estrutura( if, for, while )
:: -D Insere espa�oes em branco em parenteses somente internamente.
:: -xd Deleta linhas vazias
:: -j Adiciona Chaves
:: -Y Alinha coment�rios com estruturas
:: -r recursivo
:: suffix=none N�o cria c�pias dos arquivos originais
:: Source: http://astyle.sourceforge.net/astyle.html#_General_Information

set project_dir= "C:\projetos\pratica1"
AStyle --suffix=none -xd -D -f -j -A1 -t -w -s -K -Y -r %project_dir%\src\*.c %project_dir%\src\*.h

