#=====================================
= まどろっこしく書くと多分こんな感じ =
=====================================#

# n文字のabcでできた文字列の配列を作成する関数
function build_length_n_abc_str(n, memo::Dict{Int, Vector{String}})::Vector{String}

  # 再帰の終了条件として、n=0のときは空文字列のみ
  if n == 0
    memo[n] = [""]
    return memo[n]
  end

  # メモがあったらそっちを返す
  if haskey(memo, n)
    return memo[n]
  end

  # メモがなければa, b, cをそれぞれn-1文字の文字列に繋げてn文字の文字列の配列を作る
  pre = build_length_n_abc_str(n - 1, memo)
  memo[n] = []
  for c ∈ 'a':'c'
    for s ∈ pre
      push!(memo[n], s * c)
    end
  end
  return memo[n]

end

# n文字以下のabcでできた文字列に対して関数fを適用するコードを出力する関数
function solve_roundabout(f, n=7)::String

  # メモ化用の辞書を作る
  memo = Dict{Int, Vector{String}}()

  # n~1文字のabcでできた文字列を順に詰めて、n文字以下のabcでできた文字列の配列を作成する
  input_string_list::Vector{String} = []
  for i ∈ n:-1:1
    for str ∈ build_length_n_abc_str(i, memo)
      push!(input_string_list, str)
    end
  end

  # 関数fを適用した結果を返す
  code = ""
  for i ∈ input_string_list
    code *= "$(i)=(return)$(f(i))\n"
  end
  return code

end
