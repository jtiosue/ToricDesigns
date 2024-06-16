alpha = [3, 3, 4]
# we can always assume that one of the elements of the zs are 0
arg3 = Iterators.product([0], [0, 1, 2], [0, 1, 2], [0, 1, 2], [0, 1, 2], [0, 1, 2]) |> collect
arg4 = Iterators.product([0], [0, 1, 2, 3], [0, 1, 2, 3], [0, 1, 2, 3], [0, 1, 2, 3], [0, 1, 2, 3]) |> collect
arg5_5 = Iterators.product([0], [0, 1, 2, 3, 4], [0, 1, 2, 3, 4], [0, 1, 2, 3, 4], [0, 1, 2, 3, 4]) |> collect


function eq25(X)
    d = length(X[1])
    for i = 1:length(X)
        for j = i+1:length(X)
            phi = X[i]
            theta = X[j]
            function f(j)
                exp(1im * (phi[j] - theta[j]))
            end
            t = abs(sum(f, 1:d))^2
            if (abs(t) > 0.001 && abs(t - d) > 0.001)
                return false
            end
        end
    end
    return true
end


function isValid(X)
    d = length(X[1])
    if length(unique(X)) != d^2
        return false
    end
    function f(a, b, c, e)
        t = 0
        corr = 0
        if sort([a, b]) == sort([c, e])
            corr = 1
        end
        for phi = X
            t += exp(1im * (phi[a] + phi[b] - phi[c] - phi[e]))
        end
        return t / length(X) - corr
    end
    for a = 1:d
        for b = a:d
            for c = b:d
                for e = c:d
                    if abs(f(a, b, c, e)) > 0.001
                        return false
                    end
                end
            end
        end
    end
    return true
end

# sanity check with 5
function eq28_5(z1, z2)
    X = []
    for n1 = 0:4
        for n2 = 0:4
            elem = 2 * pi * (z1 * n1 / 5 + z2 * n2 / 5)
            push!(X, elem)
        end
    end
    X
end


function checkAll5()
    count = 0
    for z1 = arg5_5
        z1 = [z1[1], z1[2], z1[3], z1[4], z1[5]]
        for z2 = arg5_5
            z2 = [z2[1], z2[2], z2[3], z2[4], z2[5]]
            X = eq28_5(z1, z2)
            if eq25(X) && isValid(X)
                return [z1, z2]
            end
        end
    end

    return false

end


function eq28(z1, z2, z3)
    X = []
    for n1 = 0:2
        for n2 = 0:2
            for n3 = 0:3
                elem = 2 * pi * (z1 * n1 / 3 + z2 * n2 / 3 + z3 * n3 / 4)
                push!(X, elem)
            end
        end
    end
    X
end


function checkAll6()
    count = 0
    for z1 = arg3
        z1 = [z1[1], z1[2], z1[3], z1[4], z1[5], z1[6]]
        for z2 = arg3
            z2 = [z2[1], z2[2], z2[3], z2[4], z2[5], z2[6]]
            for z3 = arg4
                z3 = [z3[1], z3[2], z3[3], z3[4], z3[5], z3[6]]
                count += 1
                if count % 1000000 == 0
                    println(count / (length(arg3)^2 * length(arg4)))
                end
                X = eq28(z1, z2, z3)
                if eq25(X) && isValid(X)
                    # if isValid(X) && z1 != [0, 0, 0, 0, 0, 0] && z2 != [0, 0, 0, 0, 0, 0] && z3 != [0, 0, 0, 0, 0, 0] && z1 != z2
                    return [z1, z2, z3]
                end
            end
        end
    end

    return false

end

# sanity check
println(checkAll5())
println()
println(checkAll6())
