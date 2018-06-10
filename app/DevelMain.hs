-- | RODAR O WEBSITE DENTRO DO GHCi.
--
-- Essa opção é um pouco mais rápida de rodar comparado ao comando 'yesod devel'
-- (Só Deus sabe o porque)
-- MAS, não possui reload de código automático (o que pode ser bom se não fizer bosta).
-- LINHAS ABAIXO RETIRADO DO ARQUIVO DO GITHUB
module DevelMain where

import Application (getApplicationDev)

import Control.Exception (finally)
import Control.Concurrent
import Data.IORef
import Foreign.Store
import Network.Wai.Handler.Warp

-- | inicia ou restarta o server.

update :: IO ()
update = do
    mtidStore <- lookupStore tidStoreNum
    case mtidStore of
      -- Nenhum server detectado
      Nothing -> do
          done <- storeAction doneStore newEmptyMVar
          tid <- start done
          _ <- storeAction (Store tidStoreNum) (newIORef tid)
          return ()
      -- server rodando
      Just tidStore ->
          -- Desliga o server e aguarda pelo sinal de OK
          modifyStoredIORef tidStore $ \tid -> do
              killThread tid
              withStore doneStore takeMVar >> readStore doneStore >>= start
  where
    doneStore = Store 0
    tidStoreNum = 1

    modifyStoredIORef :: Store (IORef a) -> (a -> IO a) -> IO ()
    modifyStoredIORef store f = withStore store $ \ref -> do
        v <- readIORef ref
        f v >>= writeIORef ref

-- | Inicia o server uma Thread separada.
start :: MVar () 
      -> IO ThreadId
start done = do
    (settings,app) <- getApplicationDev
    forkIO (finally (runSettings settings app)
                    (putMVar done ()))
