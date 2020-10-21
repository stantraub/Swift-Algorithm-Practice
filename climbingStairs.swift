func climbStairs(_ n: Int) -> Int {
    var table = Array(repeating: 0, count: n + 1);
    table[0] = 1;
    table[1] = 1;

    for i in stride(from: 2, through: n, by: 1) {
        table[i] = table[i - 1] + table[i - 2];
    }

    return table[table.count - 1];
}