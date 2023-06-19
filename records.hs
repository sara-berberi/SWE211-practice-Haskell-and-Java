import System.IO

data Person = Person
  { id :: Int
  , firstName :: String
  , lastName :: String
  , height :: Float
  }

instance Show Person where
  show person = firstName person ++ " " ++ lastName person

instance Eq Person where
  person1 == person2 = Main.id person1 == Main.id person2

tell :: Person -> String
tell person = show person ++ " is " ++ show (height person) ++ " meter tall with id " ++ show (Main.id person)

main :: IO ()
main = do
  putStr "First name: "
  firstName <- getLine
  putStr "Last name: "
  lastName <- getLine
  putStr "Enter height: "
  height <- readLn
  let guy = Person 10 firstName lastName height
      otherGuy = Person 11 firstName lastName height
  putStrLn (show guy)
  putStrLn (tell guy)
  putStrLn (show (guy == otherGuy))
  putStrLn "End of program"