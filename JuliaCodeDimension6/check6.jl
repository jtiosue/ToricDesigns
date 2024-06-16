alpha = [3, 3, 4]
# we can always assume that one of the elements of the zs are 0
arg2 = Iterators.product([0], [0, 1], [0, 1], [0, 1], [0, 1], [0, 1]) |> collect
arg3 = Iterators.product([0], [0, 1, 2], [0, 1, 2], [0, 1, 2], [0, 1, 2], [0, 1, 2]) |> collect
arg4 = Iterators.product([0], [0, 1, 2, 3], [0, 1, 2, 3], [0, 1, 2, 3], [0, 1, 2, 3], [0, 1, 2, 3]) |> collect
arg9 = Iterators.product([0], [0, 1, 2, 3, 4, 5, 6, 7, 8], [0, 1, 2, 3, 4, 5, 6, 7, 8], [0, 1, 2, 3, 4, 5, 6, 7, 8], [0, 1, 2, 3, 4, 5, 6, 7, 8], [0, 1, 2, 3, 4, 5, 6, 7, 8]) |> collect

# for sanity check
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


function eq28_alpha334(z1, z2, z3)
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

function eq28_alpha49(z1, z2)
    X = []
    for n1 = 0:3
        for n2 = 0:8
            elem = 2 * pi * (z1 * n1 / 4 + z2 * n2 / 9)
            push!(X, elem)
        end
    end
    X
end


function eq28_alpha229(z1, z2, z3)
    X = []
    for n1 = 0:1
        for n2 = 0:1
            for n3=0:8
                elem = 2 * pi * (z1 * n1 / 2 + z2 * n2 / 2 + z3 * n3 / 9)
                push!(X, elem)
            end
        end
    end
    X
end


function eq28_alpha2233(z1, z2, z3, z4)
    X = []
    for n1 = 0:1
        for n2 = 0:1
            for n3=0:2
                for n4=0:2
                    elem = 2 * pi * (z1 * n1 / 2 + z2 * n2 / 2 + z3 * n3 / 3 + z4 * n4 / 3)
                    push!(X, elem)
                end
            end
        end
    end
    X
end


function checkAll6_alpha334()
    count = 0
    total = length(arg3)^2 * length(arg4)
    for z1 = arg3
        z1 = [z1[1], z1[2], z1[3], z1[4], z1[5], z1[6]]
        for z2 = arg3
            z2 = [z2[1], z2[2], z2[3], z2[4], z2[5], z2[6]]
            for z3 = arg4
                z3 = [z3[1], z3[2], z3[3], z3[4], z3[5], z3[6]]
                count += 1
                if count % 1000000 == 0
                    println(count / total)
                end
                X = eq28_alpha334(z1, z2, z3)
                if eq25(X) && isValid(X)
                    return [z1, z2, z3]
                end
            end
        end
    end

    return false

end


function checkAll6_alpha49()
    count = 0
    total = length(arg4) * length(arg9)
    for z1 = arg4
        z1 = [z1[1], z1[2], z1[3], z1[4], z1[5], z1[6]]
        for z2 = arg9
            z2 = [z2[1], z2[2], z2[3], z2[4], z2[5], z2[6]]
            count += 1
            if count % 1000000 == 0
                println(count / total)
            end
            X = eq28_alpha49(z1, z2)
            if eq25(X) && isValid(X)
                return [z1, z2]
            end
        end
    end

    return false

end


function checkAll6_alpha229()
    count = 0
    total = length(arg2)^2 * length(arg9)
    for z1 = arg2
        z1 = [z1[1], z1[2], z1[3], z1[4], z1[5], z1[6]]
        for z2 = arg2
            z2 = [z2[1], z2[2], z2[3], z2[4], z2[5], z2[6]]
            for z3 = arg9
                z3 = [z3[1], z3[2], z3[3], z3[4], z3[5], z3[6]]
                count += 1
                if count % 1000000 == 0
                    println(count / total)
                end
                X = eq28_alpha229(z1, z2, z3)
                if eq25(X) && isValid(X)
                    return [z1, z2, z3]
                end
            end
        end
    end

    return false

end


function checkAll6_alpha2233()
    count = 0
    total = length(arg2)^2 * length(arg3)^2
    for z1 = arg2
        z1 = [z1[1], z1[2], z1[3], z1[4], z1[5], z1[6]]
        for z2 = arg2
            z2 = [z2[1], z2[2], z2[3], z2[4], z2[5], z2[6]]
            for z3 = arg3
                z3 = [z3[1], z3[2], z3[3], z3[4], z3[5], z3[6]]
                for z4 = arg3
                    z4 = [z4[1], z4[2], z4[3], z4[4], z4[5], z4[6]]
                    count += 1
                    if count % 1000000 == 0
                        println(count / total)
                    end
                    X = eq28_alpha2233(z1, z2, z3, z4)
                    if eq25(X) && isValid(X)
                        return [z1, z2, z3, z4]
                    end
                end
            end
        end
    end

    return false

end


# sanity check
println(checkAll5())
println()
println("Starting 3, 3, 4")
println(checkAll6_alpha334())
println("Starting 4 9")
println(checkAll6_alpha49())
println("Starting 2, 2, 9")
println(checkAll6_alpha229())
println("Starting 2, 2, 3, 3")
println(checkAll6_alpha2233())
