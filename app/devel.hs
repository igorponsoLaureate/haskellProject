{-# LANGUAGE PackageImports #-}
--FEITO AUTOMATICAMENTE PELO COMANDO 'stack new MyBlog yesod-postgres'
--O COMANDO 'stack new' gera um arquivo padrão sem template.
--Como eu usei um template já do yesod + postgresql, eu vi na documentação
--que poderia fazer 'stack new <nomedoprojeto> <template>
--Pelo comando 'stack template' deu pra ver um que era yesos com postgresql
--Esse foi o template usado no projeto.
import "MyBlog" Application (develMain)
import Prelude (IO)

main :: IO ()
main = develMain
