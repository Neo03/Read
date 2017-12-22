module Ex1 where

import Control.Applicative
import Control.Monad
import Data.Char

cup :: [Char] -> [Char]
cup xs = map toUpper xs

rev :: [Char] -> [Char]
rev xs = reverse xs

composed :: [Char] -> [Char]
composed = cup . rev

fmapped :: [Char] -> [Char]
fmapped = fmap cup rev

tupled :: [Char] -> ([Char],[Char])
tupled = (,) <$> rev <*> cup

tupled' :: [Char] -> ([Char],[Char])
tupled' = liftA2 (,) cup rev

tupled'' :: [Char] -> ([Char], [Char])
tupled'' = do
  a <- cup
  b <- rev
  return (a,b)

tupled''' :: [Char] -> ([Char], [Char])
tupled''' = rev >>= \x1 -> cup >>= \x2 -> return (x1, x2)
