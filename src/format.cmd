
:: -A1 Estilo de linhas
:: -t Indentação por tabulações

:: -K Indenta cases
:: -s Indenta switches
:: -w Indenta preprocessor
:: -f Insere linhas em branco entres estrutura( if, for, while )
:: -D Insere espaçoes em branco em parenteses somente internamente.
:: -xd Deleta linhas vazias
:: -j Adiciona Chaves
:: -Y Alinha comentários com estruturas
:: -r recursivo
:: suffix=none Não cria cópias dos arquivos originais
:: Source: http://astyle.sourceforge.net/astyle.html#_General_Information

set project_dir= "C:\projetos\pratica1"
AStyle --suffix=none -xd -D -f -j -A1 -t -w -s -K -Y -r %project_dir%\src\*.c %project_dir%\src\*.h

