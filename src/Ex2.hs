module Ex2 where


newtype Reader r a = Reader { runReader :: r -> a }

ask :: Reader a a
ask = Reader id

myLift :: Applicative f => (a -> b -> c) -> f a -> f b -> f c
myLift a b c =  a <$>  b <*>  c

asks :: (r -> a) -> Reader r a
asks f = Reader f
