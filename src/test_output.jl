#===========================================================================================================
= 試しに全ての文字種の数が奇数もしくは0のときtrueを、そうでない場合はfalseを出力せよという問題を解いてみる =
===========================================================================================================#

["./cheat.jl", "./cheat_no_technique_ver.jl", "./cheat_roundabout_ver.jl"] .|> include

for (name, solve_function) in [("cheat", solve), ("cheat2", solve2), ("cheat_no_technique", solve_no_technique), ("cheat_roundabout", solve_roundabout)]
  open("./output/ex.$name.a_equal_b", "w") do file
    write(file, solve_function(
      x -> any(c -> count(c, x) % 2 == 0 && count(c, x) != 0, 'a':'c') ? "false" : "true"
    ))
  end
end
