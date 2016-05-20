-- 1. 리스트의 마지막 원소를 리턴하는 함수 'myLast'를 작성하시오
-- myLast :: [a] -> a

myLast :: [a] -> a
myLast [x] = x
myLast (_ : xs) = myLast xs

-- 2. 리스트의 k번째 원소를 리턴하는 함수 elementAt를 작성하시오
-- elementAt :: [a] -> Int -> a

elementAt :: [a] -> Int -> a
elementAt (x : _) 0 = x
elementAt (_ : xs) n = elementAt xs (n-1)

-- 3. 리스트가 palindrome인지 아닌지를 리턴하는 함수를 작성하시오
-- isPalindrome :: (Eq a) =>[a] -> Bool

isPalindrom :: (Eq a) => [a] -> Bool
isPalindrom [] = True
isPalindrom [x] = True
isPalindrom l = if head l == last l 
                then isPalindrom (init (tail l)) else False
-- 연속된 리스트 원소를 제거하는 compress 함수를 작성하시오
-- compress :: Eq a => [a] -> [a]

compress :: Eq a => [a] -> [a]
compress [] = []
compress [x] = [x]
compress (x0 : x1 : xs) = if x0 == x1 
                          then compress (x1:xs)
                          else x0 : compress (x1:xs)
-- 리스트를 run-length 인코딩으로 리턴하는 함수 encode를 작성하시오
-- encode :: Eq a => [a] -> [(Int, a)]
encode :: Eq a => [a] -> [(Int, a)]
encode [] = []
encode (x:xs) = encode' 1 x xs where
    encode' n x [] = [(n, x)]
    encode' n x (y:ys)
        | x == y    = encode' (n+1) x ys
        | otherwise = (n, x) : encode' 1 y ys
