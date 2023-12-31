#====================================================================
= テクニック的なもの（Yコンビネータとメモ化）を使わないとこんな感じ =
====================================================================#

# n文字のabcでできた文字列の配列を作成する関数
inputs(n)                  = n == 0 ? [""] : vcat([[s * c for s in inputs(n - 1)] for c in 'a':'c']...)

# n文字以下のabcでできた文字列に対して関数fを適用するコードを出力する関数
solve_no_technique(f, n=7) = join(["$(i)=(return)$(f(i))\n" for i in vcat([inputs(i) for i in n:-1:1]...)])
