module Main where

import Prelude
-- import Data.Foldable (foldl)
import Control.Monad.Eff
import Control.Monad.Eff.Console

import Data.Either
-- import Data.Either

-- import Control.Monad.Cont.Trans
-- import Control.Monad.Except.Trans

-- import Data.DOM.Render (render)
-- import Data.DOM.Tags (Template(), img, p, text, a)
-- import Data.DOM.Attributes (src, _class, (:=))

-- doc :: Template
-- doc = do
--   a [ _class := "Class" ] do
--     text "Somethings"
--   p [ _class := "first_class" ] $ do
--     img [ src := "cat.jpg" ]
--     text "A cat"
--   p [ _class := "last_class" ] $ do
--     img [ src := "dog.jpg" ]
--     text "A dog"

-- import Model.Base
import Lib.Utils

import Model.Base

insertTest :: forall eff. DBAsync eff String
insertTest = do
  createTable "Test" ["info" .= "TEXT"]
  -- delete "lorem" (by ("id" .> 1) .&& ("info" .= "Test"))
  return "success"

-- insertTest :: forall eff. DBAsync eff String
-- insertTest = getDBFullPath

main :: forall eff. Eff (console :: CONSOLE , database :: DATABASE | eff) Unit
main = runAsync insertTest result
       where result (Right str) = print str
             result (Left err) = print err.message

-- main = log "hello"
-- main = log $ render $
--        a [_class := "main", href := "http://baidu.com"] [text "Hello World!"]

-- import SQLite

-- type Lorem = Row (info :: String)

-- insertTest :: forall eff. String -> ExceptT ErrorCode (ContT Unit (Eff eff)) (Array Lorem)
-- insertTest info = do
--   db <- connectContEx "/tmp/test.db" default_mode
--   rows <- allContEx db $ "select * from lorem where `info` = \""++ info ++"\""
--   return rows

-- main :: forall e. Eff (console :: CONSOLE | e) Unit
-- main = do
--   runAsyncEx (insertTest "再试试") $ next
--     where next (Right rows) =
--             foldl
--             (\l row-> l >>= (\_ -> (log $ show row.id ++ "|" ++ row.info )))
--             (log "123") rows
--           next (Left err) = error err

-- main = flip runContT print . runExceptT $ insertTest

-- foreign import data ALERT :: !
-- foreign import alert :: forall e. String -> Eff (console :: CONSOLE | e) Unit

-- foreign import setTimeout :: forall eff. Fn2 Int
--                              (Eff eff Unit)
--                              (Eff eff Unit)

-- foreign import data HRec :: * -> *
-- foreign import empty :: forall a. HRec a
-- foreign import insert :: forall a. Fn3 String a (HRec a) (HRec a)
-- foreign import showHRec :: forall a. Fn1 (HRec a) String

-- iEmpty :: HRec Int
-- iEmpty = empty

-- iInsert :: String -> Int -> (HRec Int) -> (HRec Int)
-- iInsert = runFn3 insert

-- iShowHRec :: (HRec Int) -> String
-- iShowHRec = runFn1 showHRec

-- foreign import data DB :: *

-- foreign import connect :: forall e. Fn2 String
--                           (DB -> Eff e Unit)
--                           (Eff e Unit)

-- foreign import run :: forall e. Fn3 DB String
--                           (Eff e Unit)
--                           (Eff e Unit)

-- foreign import isOpen :: forall e. Fn1 DB (Eff e Unit)
-- foreign import close :: forall e. Fn1 DB (Eff e Unit)
