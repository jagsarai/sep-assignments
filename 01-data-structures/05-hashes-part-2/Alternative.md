Alternative collision strategies. 

1. Quadratic Probing
    We can try using quadratic probing. When a collision occurs, we simply take the index and add n^2 (where n is a number from 0 to n) to get our new index value. If there is still a collision at that index, we simply increase n until we get an open index. For example, if we use the hashing strategy of h<sub>n</sub>(x) = (H(x) + f(n)) mod 10, where f(n) = n^2. We initially store the value with n = 0. If there is collision at the hashed index, we simply increment n by 1 and try again. We will keep trying until we get an open index. If all the indexes fail, we can then double the array size. 

2. Double Hashing 
    We can try to use a second hash function along with the first after a collision occurs. We use h<sub>i</sub>(x) = (H(x) + f(i)) mod TableSize, where f(i) = i * hash<sub>2</sub>(x) as our second hash. Our initial will be H(x) = x mod TableSize. 

3. Extendiable Hashing
    We can store our Hash table in RAM or main memory, and store the bins/buckets at those indicies on hard disk memory.
