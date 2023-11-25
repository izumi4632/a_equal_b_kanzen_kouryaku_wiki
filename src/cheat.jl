#=============================
= ワンライナー、実績解除です =
=============================#

solve(f, n=7) = join(["$(i)=(return)$(f(i))\n" for i in vcat([(f -> (x -> f((y, z) -> ((x(x))(y, z))))(x -> f((y, z) -> ((x(x))(y, z)))))(f -> (n, memo=Dict(0 => [""])) -> haskey(memo, n) ? memo[n] : (memo[n] = vcat([[s * c for s in f(n - 1, memo)] for c in 'a':'c']...)))(i) for i in n:-1:1]...)])

#===========
= 同じもの =
===========#

# Yコンビネータ（2引数関数版）
Y(f)           = (x -> f((y, z) -> ((x(x))(y, z))))(x -> f((y, z) -> ((x(x))(y, z))))

# 無名再帰関数（メモ化あり）
_inputs        = Y(f -> (n, memo=Dict(0 => [""])) -> haskey(memo, n) ? memo[n] : (memo[n] = vcat([[s * c for s in f(n - 1, memo)] for c in 'a':'c']...)))

# 本体
solve2(f, n=7) = join(["$(i)=(return)$(f(i))\n" for i in vcat([_inputs(i) for i in n:-1:1]...)])
