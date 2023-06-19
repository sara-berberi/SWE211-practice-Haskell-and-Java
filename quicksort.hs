module Main where
import Data.List (intercalate)

quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort [x] = [x]
quickSort xs =
  let pivot = last xs
      smallerSorted = quickSort (filter (<= pivot) (init xs))
      biggerSorted = quickSort (filter (> pivot) (init xs))
  in smallerSorted ++ [pivot] ++ biggerSorted

main :: IO ()
main = do
  let data' = [2, 9, 10, 1, 0, 11]
      sortedData = quickSort data'
  putStrLn "Output:"
  putStrLn (show sortedData)
  putStrLn "End of program"