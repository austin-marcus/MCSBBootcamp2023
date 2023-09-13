using Printf
using Statistics
using Base.Threads

const D = 10
const dt = 0.001
const alpha = sqrt(2*D*dt)
const L = 10
const NPCSize = 0.1
const NPCLoc = [-L/2, 0]

function NPCWalk()
    # loop until hits target

    t::Int = 0
    x = [L/2, 0]
    while ( (x[1]-NPCLoc[1])^2 + (x[2]-NPCLoc[2])^2 >= NPCSize^2 )
        # take random step
        x = x + alpha*randn(2)

        # boundary conditions
        if (x[1] > L/2)
            x[1] = L/2
        elseif (x[1] < -L/2)
            x[1] = -L/2
        end
        if (x[2] > L/2)
            x[2] = L/2
        elseif (x[2] < -L/2)
            x[2] = -L/2
        end
        # x[1] = mod(x[1] + L/2, L) - L/2
        # x[2] = mod(x[2] + L/2, L) - L/2

        # println(x)
        t+=1
    end
    return x, t*dt
end

function main()
    N = 2000
    times = zeros(N)
    Threads.@threads for i = 1:N
        times[i] = NPCWalk()[2]
    end
    return mean(times)
end