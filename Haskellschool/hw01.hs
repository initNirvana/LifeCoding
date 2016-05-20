-- Exersize 1
lastDigit :: Integer -> Integer
lastDigit n = mod n 10

dropLastDigit :: Integer -> Integer
dropLastDigit n = div n 10

-- Exersize 2 
toRevDigits :: Integer -> [Integer]
toRevDigits n = if n>= 0 then lastDigit n : toRevDigits (dropLastDigit n) else []

toDigits :: Integer -> [Integer]
toDigits n = reverse (toRevDigits n)

-- Exersize 3
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther [] = [] 
doubleEveryOther l = result
    where
        isFirstDouble = length l `mod` 2 /= 0
        f _ [] = []
        f True (x : xs) = 2 * x : f False xs
        f _ (x : xs) = x : f True xs
        result = f isFirstDouble l

-- Exercise 4

sumDigits :: [Integer] -> Integer
sumDigits [] = 0
sumDigits (x : xs) = sum (toRevDigits x) sumDigits xs

-- Exercize 5

luhn :: Integer -> Bool
luhn n = result
    where
        calc = lastDigit (sumDigits (doubleEveryOther (toDigits (dropLastDigit n))))
        check = if calc == 0 then 0 else 10 - calc
        result = lastDigit n == check
-- Exercise 6

type Peg = String
type Move = (Peg, Peg)
hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 0 _ _ _ = []
hanoi n a b c = hanoi (n - 1) a c b ++ (a, b) : hanoi (n - 1) c b a

-- Exercise 7

type Peg' = String
type Move' = (Peg', Peg')
hanoi' :: Integer -> Peg' -> Peg' -> Peg' -> Peg' -> [Move]
hanoi' 0 _ _ _ _ = []
hanoi' n a b c d = result
    where
        k = n + 1 - round (sqrt (2 * fromIntegral n + 1))
        result = hanoi' k a d c b ++ hanoi (n - k) a b c ++ hanoi' k d b c a
