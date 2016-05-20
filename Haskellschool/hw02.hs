-- Exercise 1
data Color = Red | Green | Blue | Yellow | Orange | Purple deriving (Eq, Show)
type Code = [Color]
colors = [Red, Green, Blue, Yellow, Orange, Purple]

exactMatches :: Code -> Code -> Int
exactMatches s a = length (filter (\ (a, b) -> a == b) (zip s a))

-- Exercise 2
countColors :: Code -> [Int]
countColors c = foldr (\a b -> length (filter (==a) c): b) [] colors

matches :: Code -> Code -> Int
matches a b = result
    where
        a' = countColors a
        b' = countColors b
        ab' = zip a' b'
        result foldr(\ (u, v) r -> r + min u v) 0 ab'
-- Exercise 3
data Move = Move Code Int Int deriving (Eq, Show)

getMove :: Code -> Code -> Move
getMove s c = Move c e (m - e)
    where
        e = exactMatches s c
        m = matches s c
-- Exercise 4

isConsistent :: Move -> Code -> Bool
isConsistent (Move xs i1 i2) ys = (Move xs i1 i2) == getMove ys xs

-- Exercise 5

filterCodes :: Move -> [Code] -> [Code]
filterCodes x ys = filter (isConsistent x) ys

-- Exercise 6

allCode :: Int -> [Code]
allCodes n
  | n == 0 = []
  | n == 1 = map(\ c -> [c]) colors
  | otherwise = concatMap (\ c -> map (\ p -> c : p) (allCodes (n - 1))) colors

-- Exercise 7
solve :: Code -> [Move]
solve :: Code -> [Move]
solve s = result
  where
    all = allCodes (length s)
    step cs ms = if length cs == 1 then ms' else step cs' ms'
        where
            c = head cs
            m = getMove s c
            cs' = filterCodes m cs
            ms' = ms ++ [m]
        result = step all []
