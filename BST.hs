data BST a = EmptyTree | Node a (BST a) (BST a) deriving (Show)

treeInsert :: (Ord a) => a -> BST a -> BST a
treeInsert x EmptyTree = Node x EmptyTree EmptyTree
treeInsert x (Node a left right)
  | x < a = Node a (treeInsert x left) right
  | x > a = Node a left (treeInsert x right)
  | otherwise = Node a left right

preorder :: BST a -> [a]
preorder EmptyTree = []
preorder (Node a left right) = [a] ++ preorder left ++ preorder right

-- Inorder traversal of a BST
inorder :: BST a -> [a]
inorder EmptyTree = []
inorder (Node a left right) = inorder left ++ [a] ++ inorder right

-- Postorder traversal of a BST
postorder :: BST a -> [a]
postorder EmptyTree = []
postorder (Node a left right) = postorder left ++ postorder right ++ [a]

main :: IO ()
main = do
  let values = [10, 2, 5, 20]
  let bst = foldl (\acc val -> treeInsert val acc) EmptyTree values
  putStrLn "Input an integer into the BST"  
  val <- readLn
  let bst' = treeInsert val bst
  putStrLn ("Preorder: " ++ show (preorder bst'))
  putStrLn "End of program"