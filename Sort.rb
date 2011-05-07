# selection sort searches for lowest number and places first O(n^2) complexity
# insertion sort checks the next element and if previous is smaller, inserts 
#     the smaller before the larger O(n^2) complexity
# quick sort sorts by employing a divide and conquer strategy to divide a list into two sub-lists.
# Pick an element, called a pivot, from the list. 
#   1. Reorder the list so that all elements with values less than the pivot come before the pivot, 
#          while all elements with values greater than the pivot come after it.
#   2. After this partitioning, the pivot is in its final position. This is called the partition operation. 
#   3. Recursively sort the sub-list of lesser elements and the sub-list of greater elements. 
# The base case of the recursion are lists of size zero or one, which never need to be sorted.
# O(nlogn) complexity    

def Program()
    array1 = Array.new
    array2 = Array.new
    array3 = Array.new
     array4 = Array.new
    Fill(array1, array2, array3, array4)

    if(array1.length <= 10001) 
        puts "Selection Sort" 
        t = Time.now.to_f  
		Selection(array1)
        t2 = Time.now.to_f
        t3 = t2 - t
        puts t3
    end
   
    puts "Insertion Sort"   
    t4 = Time.now.to_f   
    Insertion(array2)   
    t5 = Time.now.to_f   
    t6 = t5 - t4   
    puts t6

    puts "Quick Sort"
    t7 = Time.now.to_f
    Quick(array3)
    t8 = Time.now.to_f
    t9 = t8 - t7
    puts t9

    puts "Default Array.sort"
    t10 = Time.now.to_f
    array4.sort
    t11 = Time.now.to_f
    t12 = t11 - t10
    puts t12
end

def Fill(ar1, ar2, ar3, ar4)
    for i in 0..8000
        r = Random.new()
        num = r.rand(0...50000)
        ar1 << num
        ar2 << ar1[i]
        ar3 << ar1[i]
         ar4 << ar1[i]
    end
end

def Selection(arS)
     i = 0
    while(i < arS.length-1)
        j = i + 1
        while(j < arS.length)
            if(arS[i] > arS[j])
                temp = arS[i]
                arS[i] = arS[j]
                arS[j] = temp
            end
        j+=1
        end
     i+=1
    end
end  

def Insertion(arI) i = 0
    while(i < arI.length)
        Insert(arI, i)
         i+=1
    end
end

def Insert(arI, num)
    k = arI[num]
    j = num
    while(j != 0 && arI[j-1] > k)
        arI[j] = arI[j-1]
        j-=1
    end
    arI[j] = k
end

def Quick(arQ)
    QuickSort(arQ, 0, arQ.length-1)
end

def QuickSort(arQ, l, r)
     if(l >= r)
         return
     end
     m = Partition(arQ, l, r)
    QuickSort(arQ, l, m-1)
    QuickSort(arQ, m+1, r)
end

def Partition(arQ, l, r)
    i = l+=1
    j = r
    p = arQ[l]
    while(i <=j)
        if(arQ[i]<=p)
            i+=1
        else
            if(arQ[j]>p)
                j-=1
            else
                Swap(arQ, i, j)
            end
        end
    end
    Swap(arQ, l, j)
    return j
end

def Swap(arQ, i, j)
    h = arQ[i]
    arQ[i] = arQ[j]
    arQ[j] = h
end

Program()