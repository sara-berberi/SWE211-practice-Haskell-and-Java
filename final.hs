import Data.List (group)
-- (*) Find the last element of a list.
lastElement :: [a] -> a
lastElement [x] = x
lastElement (_:xs) = lastElement xs
lastElement [] = error "Empty list"

-- (*) Find the last-but-one (or second-last) element of a list.
secondLastElement:: [a] -> a 
secondLastElement [x,_] = x
secondLastElement (_:xs) = secondLastElement xs
secondLastElement [_] = error "Not enough elements"
secondLastElement [] = error "List is empty"

-- (*) Find the K'th element of a list.

kthElement :: [a] -> Int -> a
kthElement list b   
  | b < length list = list !! (b-1)
  | otherwise = error "Invalid Index"

-- (*) Find the number of elements in a list.
numberOfElements :: [a] -> Int
numberOfElements [] = 0 
numberOfElements (_:xs) = 1 + numberOfElements xs

-- reverse a list 
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

-- find out whether a list is a palindrome

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome list = reverse list == list 

-- (**) Flatten a nested list structure.
data NestedList a = Elem a | List [NestedList a] deriving (Show)

flatten :: NestedList a -> [a]
flatten (Elem x) = [x]
flatten (List []) = []
flatten (List (x:xs)) = flatten x ++ flatten (List xs)

-- (**) Eliminate consecutive duplicates of list elements. 
remDup :: (Eq a) => [a] -> [a]
remDup [] = []
remDup (x:xs) = x : remDup (remove x xs)
  where 
    remove :: (Eq a) => a -> [a] -> [a]
    remove _ [] = []
    remove x (y:ys)
        | x == y = remove x ys 
        | otherwise = y : remove x ys



remDup1 :: (Eq a) => [a] -> [a]
remDup1 =  map head . group

-- !! (**) Pack consecutive duplicates of list elements into sublists.

encode :: Eq a => [a] -> [(Int, a)]
encode [] = []
encode xs = [(length groupX, head groupX) | groupX <- group xs]

-- (*) replicate the elements of a list n times.
duplicate' :: [a] -> Int ->[a]
duplicate' [] n = []
duplicate' xs n = concatMap (replicate  n) xs 

-- (**) delete every nth element of a list 
dropNth :: Int -> [a] -> [a]
dropNth n xs
  | n <= 0 = error "Index entered is invalid."
  | n <= length xs = take (n - 1) xs ++ dropNth n (drop n xs)
  | otherwise = xs

-- (*) Split a list into two parts; the length of the first part is given.

split :: [a] -> Int -> ([a], [a])
split xs n = splitHelper xs n []
  where
    splitHelper :: [a] -> Int -> [a] -> ([a], [a])
    splitHelper xs 0 acc = (acc, xs)
    splitHelper [] _ acc = (acc, [])
    splitHelper (x:xs) count acc = splitHelper xs (count - 1) (acc ++ [x])

-- (**) Rotate a list N places to the left.
rotate :: [a] -> Int -> [a]
rotate xs n = drop n xs ++ take n xs

-- (*) Remove the K'th element from a list.
dropKth :: Int -> [a] -> [a]
dropKth n xs
  | n <= 0 = error "Index entered is invalid."
  | n <= length xs = take (n - 1) xs ++ drop n xs
  | otherwise = xs

-- Insert an element at a given position into a list.
insertAt :: [a] -> Int -> a -> [a] 
insertAt list index key 
  | index < 1 = key:list 
  | otherwise = take (index - 1) list ++ [key] ++ drop (index-1) list

-- Create a list containing all integers within a given range.
rangeList :: Int -> Int -> [Int]
rangeList start end = [start..end]


  
-- main :: IO ()
-- main = 
-- -- print(dropNth 2 [1,2,3,4,5] )
-- -- print(zipWith' (*) (replicate 5 2) [1..])

-- -- print(isPalindrome[1,2,1])
-- -- print(reverse' [1,2,3])
-- -- print (numberOfElements [1,2,3,4])
-- -- print(kthElement [1,2,3] 2)
-- -- print(secondLastElement [1,2,3,4])
-- -- print (lastElement [1])