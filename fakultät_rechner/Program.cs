using System.Diagnostics;
using System.Numerics;

var z = 1;

while (true)
{
    var stopwatch = Stopwatch.StartNew();

    BigInteger result = Fakultaet(z);

    stopwatch.Stop();

    Console.WriteLine($"Fakultät von {z}: {result}, Dauer: {stopwatch.ElapsedMilliseconds} ms\n\n");

    z = z * 10;
}

static BigInteger Fakultaet(int n)
{
    BigInteger r = 1;
    for (int i = 1; i <= n; i++)
        r *= i;
    return r;
}
