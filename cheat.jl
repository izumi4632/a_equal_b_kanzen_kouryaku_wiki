# 文字列の最大長と解法を表す関数fを引数にとって全列挙解法のコードを返す
solve(f, n=7) = join(["$(i)=(return)$(f(i))\n" for i in vcat([(f -> (x->f((y,z)->((x(x))(y,z))))(x->f((y,z)->((x(x))(y,z)))))(f -> (n, memo::Dict{Int, Vector{String}}=Dict(0=>[""])) -> haskey(memo, n) ? memo[n] : (memo[n] = vcat([[s*c for s in f(n-1, memo)] for c in 'a':'c']...)))(i) for i in n:-1:1]...)])

# 試しに全ての文字種の数が奇数もしくは0のときtrueを、そうでない場合はfalseを出力せよという問題を解いてみる
f(x) = begin
  for c in 'a':'c'
    if count(==(c), x) % 2 == 0 && count(==(c), x) != 0
      return "false"
    end
  end
  "true"
end

open("./ex.a_equal_b", "w") do file
  write(file, solve(f))
end
