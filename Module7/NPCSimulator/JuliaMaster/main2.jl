const D = 10.0
const dt = 0.001
const alpha = sqrt(2*D*dt)
const L = 10.0
const L2 = L/2
const NPCSize = 0.1
const NPCLoc = [-L/2, 0]
const NPCSize2 =  NPCSize^2
const N = 2000

# implements box boundary conditions
function f(x::Float64, y::Float64)
	return max(min(x+y, L2), -L2)
end

function NPCWalk()
    t = 0.0
    x = [L/2, 0]
    while ( (x[1]-NPCLoc[1])^2 + (x[2]-NPCLoc[2])^2 >= NPCSize2 )
		x[1] = f(x[1], alpha*randn())
		x[2] = f(x[2], alpha*randn())
        t+=1
    end
    return t*dt
end

function main()
	times = 0.0
    for i = 1:N
		times += NPCWalk()
    end
	return times/N
end