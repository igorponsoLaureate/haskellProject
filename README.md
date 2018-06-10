VAMOS LÁ, PESSOAS.
ESSE ARQUIVO SERVE PRA MOSTRAR O PASSO A PASSO DO QUE EU FIZ
EU
DISSE
PASSO
A
PASSO!!!

=========================================================
NO INÍCIO DO PROJETO, SEGUINDO O TUTORIAL, DOCUMENTAÇÃO, VIDEO E AJUDAS,
SOMENTE DEUS E EU ENTENDIAMOS O QUE ESTAVA SENDO ESCRITO.
AGORA É SÓ DEUS QUEM ENTENDE!

AVISO: CASO TENTE MELHORAR ALGUMA FUNÇÃO (O QUE EU DUVIDO PORQUE NEM EU TENHO MUITA IDEIA 
DO QUE ACONTECEU), LEMBRE-SE QUE VOCÊ FOI AVISADO QUE ISSO É SÓ PERDER TEMPO ATOA.
DEPOIS DE SE FRUSTRAR, COMO EU ME FRUSTREI, E COMEÇAR A ODIAR HASKELL, COMO EU ODEIO, 
ADICIONE AO CONTADOR ABAIXO AS INFORMAÇÕES PARA QUE O PRÓXIMO COITADO PENSE DUAS VEZES
ANTES DE TENTAR ALGO

nº apx horas perdidas: 40;
nº apx de cafés : 20;
nº apx de vezes que quis arrebentar a máquina: 5;
nº apx de projetos iniciados do zero porque não sabia resolver: 3;
nº de pessoas do qual esse arquivo passou: 1;


## Database Setup


Depois de instalar o Postgres (sudo install apt postgres) rodar os seguintes comandos:

```
createuser MyBlog --password MyBlog --superuser
createdb MyBlog
createdb MyBlog_test
```


PORÉM, COMO NEM TUDO NA VIDA SÃO ROSAS. POR ALGUM MOTIVO NA MINHA MÁQUINA VIRTUAL,
MESMO ESTANDO LOGADO COM ADMIN E ROOT, DAVA PERMISSION DENIED.

APÓS ALGUMAS HORAS DE PESQUISA, TENTEI USAR O COMANDO GRANT ALL ACCESS TO <USER>.
PARECE NÃO TER ROLADO TAMBÉM.

## Haskell Setup

1. Caso não tenha instalado o Stack, faça isso: `curl -sSL https://get.haskellstack.org/ | sh`
2. Instale o `yesod`: `stack install yesod-bin --install-ghc`
 AQUI TEM ALGO QUE NÃO ACHEI NA DOCUMENTAÇÃO E QUE PRECISEI!
3. System Libraries: `sudo apt-get install -y build-essential zlib1g-dev`
4. Se for usar Banco de Dados, o que é nosso caso:
`sudo apt-get install -y libmysqlclient-dev`
`sudo apt-get install -y libpq-dev`

É SÉRIO. SEM ESSES DOIS COMANDOS ACIMA, NÃO VAI RODAR O STACK BUILD!!! NÃO VAI MEEEESMO!
 
5. Fazer o build: `stack build`


## Development

Iniciar um server com:

```
stack exec -- yesod devel
```

Conforme o código vai mudando (o que aconteceu bastante) o site vai automaticamente recompinahdo e dando o reploy no localhost

## Tests

```
stack test --flag MyBlog:library-only --flag MyBlog:dev
```

(Pq `yesod devel` passa para a `library-only` e `dev` flags, se as duas baterem certinho, significa que não é necessário recompilar toda a vez).

## Documentation

* [Yesod Book](https://www.yesodweb.com/book) 
* [Stackage](http://stackage.org/) 
* [search it using Hoogle]
* `stack haddock --open` 
* `stack hoogle <function, module or type signature>` t
* [Yesod cookbook](https://github.com/yesodweb/yesod-cookbook) 

## PEDINDO AJUDA

* Primeiro encontre pessoas tão desesperadas quanto você
* Faça uma roda de oração
* Se Deus não responder:

* [Stack Overflow, using the Yesod or Haskell tags](https://stackoverflow.com/questions/tagged/yesod+haskell) -  Aqui eu consegui MUITA ajuda. Muita mesmo!
* [Yesod Google Group](https://groups.google.com/forum/#!forum/yesodweb)

* Caso não resolva, voltar ao primeiro passo, amigo... E boa sorte!


## Verificando o site

Para testar e ver se está tudo dando certo, usar o localhost:3000


## ROTAS
Todas as rotas iniciam com '/'
As rotas são feitas por TYPESAFETY. (não que eu saiba muito a diferença.)
Após ter dado a rota, adicione as funções (GET ou/e POST)

Ex: /HOME GET POST

Na página HOME.HS é feito as chamadas das funções
ex: <gethome:: Handler html>

Os arquivos Hamlets são para HTML
Os arquivos Julius são para JavaScript
Os arquvios Lucius são para CSS;

WidgetFile = combina todos eles e mostra na URL;

NO HAMLET, AS TAGS FECHAM NO FIM DA LINHA
ex: <H1> BEM VINDO.

ELA NÃO FECHA COMO O PADRÃO </H1>. Ela simplesmente fecha no final da linha;

Para referenciar a URL, é só fazer =@{url}
ex: <form method=post action=@{Home}>
A Action é para a Home.


##WARNING: O QUE IMPORTA, E ONDE FORAM FEITAS AS ALTERAÇÕES, FOI NA PASTA 'TEMPLATES'

