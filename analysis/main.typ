#import "@preview/oxifmt:0.2.1": strfmt

#set text(size: 15pt)
#set text(lang: "ru")
#set page(numbering: "1")

= Козлов Василий Сергеевич

= Задание 1

#figure(
  image("task-1.png", width: 80%),
  caption: link("https://www.desmos.com/calculator/jxmkykotsg"),
)

$
  limits(integral)_0^1 dif y limits(integral)_0^sqrt(y) f dif x +
  limits(integral)_1^sqrt(2) dif y limits(integral)_0^sqrt(2-y^2) f dif x =
  limits(integral)_0^1 dif x limits(integral)_(x^2)^1 f dif y +
  limits(integral)_0^1 dif x limits(integral)_1^sqrt(2-x^2) f dif y = \
  = limits(integral integral)_G f dif x dif y
$

#pagebreak()

= Задание 2
$
  x^2 - 4x + y^2 = 0 <=> (x - 2)^2 + y^2 = 2^2
$

$
  x^2 - 8x + y^2 = 0 <=> (x - 4)^2 + y^2 = 4^2
$
$
  y = 0 ; y = x / sqrt(3)
$

#table(
  columns: 2,
  table.cell(
    [
      #image("task-2.png", width: 100%)
    ],
    stroke: none,
  ),
  table.cell(
    [
      #image("task-2-colored.png", width: 100%)
    ],
    stroke: none,
  )
)

// https://www.desmos.com/calculator/cloxo2top8

$
  S = limits(integral integral)_G 1 dif x dif y = limits(integral)_4^8 dif r limits(integral)_0^(pi / 6) r dif phi = \
  = limits(integral)_4^8 (r dot pi) / 6 dif r = pi / 6 limits(integral)_4^8 r dif r = pi / 6 (
    r^2 / 2
  )limits(|)_4^8 = pi / 6 (32 - 8) = 4pi
$

#pagebreak()

= Задание 3

$
  y = -5x^2 + 3, y = -2 \
  z = 2x^2 - 3y - 6y^2 - 1, z = 2x^2-3y-6y^2+2
$

$
  limits(integral.triple)_D 1 dif x dif y dif z = limits(integral)_(-1)^1 dif x limits(integral)_(-2)^(-5x^2+3) dif y limits(integral)_(2x^2 - 3y - 6y^2 - 1)^(2x^2-3y-6y^2+2) 1 dif z  = \

  = 3 limits(integral)_(-1)^1 dif x limits(integral)_(-2)^(-5x^2 + 3) dif y = 3limits(integral)_(-1)^1 -5x^2 + 5 dif x = \

  = 3 (-5/3 x^3 + 5x) limits(|)_(-1)^1 = (-5x^3 + 15x) limits(|)_(-1)^1 = \

  = 10 - (-10) = 20
$

Ответ: $20$

#pagebreak()

= Задание 4
$
  y = x^4 / (a^3), y = x^4 / (b^3), x y = c^2, x y = d^2
$

$
  x > 0 , y > 0, 0 < a < b, 0 < c < d
$

#figure(
  image("task-4.png", width: 50%),
)

$
  v = x y in [c^2, d^2], " "u = y / (x^4) in [1 / (b^3); 1 / (a^3)]
$

$
  J^(-1) = mat(
    u'_x, u'_y;
    v'_x, v'_u; delim: "|"
  ) = mat(
    - (4y)/(x^5), 1/x^4;
    y, x; delim: "|"
  ) = -(4y) / x^4 - y / x^4 = -(5y) / x^4
 => abs(J) = x^4 / (5y) = 1 / 5 u^(-1)
$


Тогда интеграл примет вид:
$
  limits(integral)_(1 / b^3)^(1 / a^3) dif u limits(integral)_(c^2)^(d^2) 1 / 5 u^(-1) dif v = 1 / 5 limits(integral)_(1 / b^3)^(1 / a^3) (
    d^2 - c^2
  )u^(-1) dif u = 1 / 5 (
    d^2 - c^2
  ) limits(integral)_(1 / b^3)^(1 / a^3) u^(-1) dif u = \
  = 1 / 5 (d^2 - c^2) ln(u) limits(|)_(1 / b^3)^(1 / a^3) = 1 / 5(d^2 - c^2) (
    ln 1 / a^3 - ln 1 / b^3
  ) = \
  = 3 / 5 (d^2 - c^2) (ln b - ln a)
$

Ответ: $3 / 5 (d^2 - c^2) (ln b - ln a)$

#pagebreak()

= Задание 5

$
  (x^2 + y^2)^3 + z^6 = a^3 x y z
$

Выполним переход к сферическим координатам

$
  cases(
    x = r cos phi sin theta,
    y = r sin phi sin theta,
    z = r cos theta,
    delim: "{",
    gap: #0.6em
  )
$

$
  (
    r^2 cos^2 phi sin^2 theta + r^2 sin^2 phi sin^2 theta
  )^3 + r^6 cos^6 theta = a^3 r^3 cos phi sin phi sin theta sin theta cos theta
$

$
  r^6 sin^6 theta + r^6 cos^6 theta = a^3 r^3 cos phi sin phi sin theta sin theta cos theta
$

$
  r^3 (
    sin^6 theta + cos^6 theta
  ) = a^3 cos phi sin phi sin theta sin theta cos theta
$

$
  r = a root(3, (cos phi sin phi sin^2 theta cos theta)/(sin^6 theta + cos^6 theta))
$

$
  limits(integral)_0^(pi / 2) limits(integral)_0^(pi / 2) limits(integral)_0^(a root(3, (cos phi sin phi sin^2 theta cos theta)/(sin^6 theta + cos^6 theta))) r^2 sin theta dif r dif theta dif phi =
  limits(integral)_0^(pi / 2) limits(integral)_0^(pi / 2) sin theta limits(integral)_0^(a root(3, (cos phi sin phi sin^2 theta cos theta)/(sin^6 theta + cos^6 theta))) r^2 dif r dif theta dif phi = \
  = limits(integral)_0^(pi / 2) limits(integral)_0^(pi / 2) sin theta (
    dot r^3 / 3 limits(|)_0^(a root(3, (cos phi sin phi sin^2 theta cos theta)/(sin^6 theta + cos^6 theta)))
  ) dif theta dif phi = \
  = a^3 / 3 limits(integral)_0^(pi / 2) limits(integral)_0^(pi / 2) sin theta dot (cos phi sin phi sin^2 theta cos theta) / (sin^6 theta + cos^6 theta) dif theta dif phi =
$

$
  = a^3 / 3 limits(integral)_0^(pi / 2) limits(integral)_0^(pi / 2) (sin phi cos phi sin^3 theta cos theta) / (sin^6 theta + cos^6 theta) dif theta dif phi =
$

$
  a^3 / 3 limits(integral)_0^(pi / 2) sin phi cos phi limits(integral)_0^(pi / 2) (sin^3 theta cos theta) / (sin^6 theta + cos^6 theta) dif theta dif phi = \
  = a^3 / 3 dot pi / (3 sqrt(3)) limits(integral)_0^(pi / 2) sin phi cos phi dif phi = a^3 / 3 dot pi / (3 sqrt(3)) (
    -1 / 2 cos^2 x
  )limits(|)_0^(pi / 2) = \
  = a^3 / 3 dot pi / (3 sqrt(3)) dot 1 / 2 = a^3 (pi) / (18 sqrt(3))
$

#image("task-5.png", width: 100%)

Чтобы найти объем всей фигуры необходимо результат умножить на 4.

Ответ: $2 a^3 pi/(9sqrt(3))$

#pagebreak()

= Задание 6

$
  arrow(a) = (x - y) arrow(i) + x arrow(j) + z^2 arrow(k)
$

$
  Г: x^2 + y^2 + z^2 = 4, z = 1
$

Контур будет иметь вид:

$
  partial Г: x^2 + y^2 = 3, z = 1
$

$
  P = x - y\
  Q = x \
  dif z = 0
$

=== Воспользуемся формулой Грина
$
  limits(integral.cont)_(partial D) P dif x + Q dif y = limits(integral.double)_D (
    (diff Q) / (diff x) - (diff P) / (diff y)
  ) dif x dif y = \
  = limits(integral.double)_D (
    1 + 1
  ) dif x dif y = 2 limits(integral.double)_D dif x dif y = 2 dot pi dot 3 = 6 pi
$

=== Параметризуем путь и вычислим интеграл
$
  limits(integral.cont)_(partial D) P dif x + Q dif y = \
  = limits(integral)_0^(2pi) (
    -P(sqrt(3) cos phi, sqrt(3) sin phi) sqrt(3) sin phi + Q(
      sqrt(3) cos phi, sqrt(3) sin phi
    ) sqrt(3) cos phi
  ) dif phi = \
  = limits(integral)_0^(2pi) (
    -(
      sqrt(3) cos phi - sqrt(3) sin phi
    ) sqrt(3) sin phi + sqrt(3) cos phi sqrt(3) cos phi
  ) dif phi = \
  = limits(integral)_0^(2pi) (
    3 sin^2 phi - 3 sin phi cos phi + 3 cos^2 phi
  ) dif phi = limits(integral)_0^(2pi) 3 dif phi + 0 = 6pi
$

#pagebreak()

= Задание 7

$
  z = 3 - 2 (x^2+y^2) \
  z^2 = x^2 + y^2
$

$
  arrow(a) = 6x arrow(i) - 2y arrow(j) - z arrow(k)
$

$
  "div"arrow(F) = (diff P) / (diff x) + (diff Q) / (diff y) + (diff R) / (diff z) = 6 - 2 - 1 = 3
$


$
  limits(integral.triple)_(z <= 1) "div" arrow(F) dif x dif y dif z + limits(integral.triple)_(z>1) "div" arrow(F) dif x dif y dif z = \
  = limits(integral.triple)_G 3 dif x dif y dif z + limits(integral.triple)_H 3 dif x dif y dif z = \
  = limits(integral.triple)_G 3 dif x dif y dif z + limits(integral.triple)_H 3 dif x dif y dif z = \
  = 3 limits(integral.triple)_G dif x dif y dif z + 3 limits(integral.triple)_H dif x dif y dif z =
$

$
  = 3 limits(integral)_0^1 limits(integral)_0^z limits(integral)_0^(2pi) r dif phi dif r dif z + 3 limits(integral)_1^3 limits(integral)_0^sqrt((3 - z)/2) limits(integral)_0^(2pi) r dif phi dif r dif z = \
  = 6 pi limits(integral)_0^1 limits(integral)_0^z r dif r dif z + 6 pi limits(integral)_0^3 limits(integral)_0^sqrt((3 - z)/2) r dif r dif z = \
  = 3 pi limits(integral)_0^1 z^2 dif z + 3 pi limits(integral)_0^3 (3 - z) / 2 dif z = \
  = pi + 9 / 2 pi limits(integral)_0^3 dif z - 3 / 2 pi limits(integral)_0^3 z dif z = \
  = pi + 27 / 2 pi - 3 / 2 pi 9 / 2 = pi + 54 / 4 pi - 27 / 4 pi = pi + 27 / 4 pi = 31 / 4 pi
$

$
  z^2 = x^2 + y^2 \
  z^2 = r^2 \
  z = r
$

$
  z = 3 - 2(x^2+y^2) \
  z = 3 - 2 r^2 => 2 r^2 = 3 - z => r^2 = (3 - z) / 2 => r = sqrt((3 - z)/2)
$

Ответ: $31/4 pi$

#figure(
  image("task-7.png", width: 100%),
)

// === Вычислим интеграл при помощи поверхностного

// Вычислим для $z<=1$
// $
//   x^2 + y^2 - z^2 = 0 =>

//   arrow(N) = ((2x, 2y, -2z))/sqrt(4x^2 + 4y^2 + 4z^2) = ((x, y, -z))/sqrt(x^2+y^2+z^2)
// $

// $
//   limits(integral.double)_(Sigma) arrow(a) dot arrow(N_0) dif S = limits(integral.double)_(Sigma) (6x, -2y, -z) dot ((x, y, -z))/sqrt(x^2+y^2+z^2) dif S
// $

// $
//   limits(integral.double)_D arrow(a) dot arrow(N) dif u dif v = limits(integral.double)_D arrow(F) (arrow(r)'_u times arrow(r)'_v) dif u dif v
// $

#pagebreak()

= Задание 8

$
  arrow(a) = x y arrow(i) + y z arrow(j) + z x arrow(k)
$

$
  S: x^2 + y^2 + z^2 = 1, x = 0, y = 0, z = 0, (x, y, z >= 0)
$

$
  "div" arrow(F) = (diff P) / (diff x) + (diff Q) / (diff y) + (diff R) / (diff z) = y + z + x = x + y + z
$

$
  limits(integral.triple)_G "div" arrow(F) dif x dif y dif z = \
  = limits(integral)_0^(pi / 2)limits(integral)_0^(pi / 2) limits(integral)_0^1 r^2 sin theta (
    r cos phi sin theta + r sin phi sin theta + r cos theta
  ) dif phi dif theta dif r = \
  = limits(integral)_0^(pi / 2)limits(integral)_0^(pi / 2) limits(integral)_0^1 r^3 (
    cos phi sin^2 theta + sin phi sin^2 theta + sin theta cos theta
  ) dif phi dif theta dif r = \
  = limits(integral)_0^(pi / 2)limits(integral)_0^(pi / 2) (
    cos phi sin^2 theta + sin phi sin^2 theta + sin theta cos theta
  ) limits(integral)_0^1 r^3 dif phi dif theta dif r = \
  = 1 / 4 limits(integral)_0^(pi / 2)limits(integral)_0^(pi / 2) (
    cos phi sin^2 theta + sin phi sin^2 theta + sin theta cos theta
  ) dif phi dif theta = \
  = 1 / 4 limits(integral)_0^(pi / 2)limits(integral)_0^(pi / 2) cos phi sin^2 theta dif phi dif theta + 1 / 4 limits(integral)_0^(pi / 2)limits(integral)_0^(pi / 2)sin phi sin^2 theta dif phi dif theta + \
  + 1 / 4 limits(integral)_0^(pi / 2)limits(integral)_0^(pi / 2) sin theta cos theta dif phi dif theta = (3pi) / 16
$

#pagebreak()

= Задание 9
$
  arrow(a) = (y^2 z^3 - 3) arrow(i) + z (2x y z^2 - 1) arrow(j) + (
    3x y^2 z^2 - y + 2
  ) arrow(k)
$

$
  "div" arrow(a) = 0 + 2 x z^3 + 6 x y^2 z !=0 => "не соленоидальное поле"
$

$
  "rot" arrow(a) = (6 x y z^2 - 1 - 6 x y z^2 + 1) + (3y^2 z^2 - 3y^2 z^2) + (
    2 y z^3 - 2 y z^3
  ) = 0 =>
  \ => "поле является потенциальным" => arrow(a) = "grad"(u)
$

$
  u(x, y, z), "если" dif u = (y^2 z^3 - 3)dif x + z(2x y z^2 - 1) dif y + (
    3x y^2 z^2 - y + 2
  ) dif z
$

$
  u(x, y, z) = limits(integral)_(A(x_0, y_0, z_0))^B(x, y, z) (
    y^2 z^3 - 3
  )dif x + z(2x y z^2 - 1) dif y + (3x y^2 z^2 - y + 2) dif z
$

$
  u(x, y, z) = limits(integral)_A(0, 0, 0)^B(x, 0, 0) (
    y^2 z^3 - 3
  ) dif x + limits(integral)_A(x, 0, 0)^B(x, y, 0) z(2x y z^2 - 1) dif y + \
  + limits(integral)_A(x, y, 0)^B(x, y, z) (3x y^2 z^2 - y + 2) dif z = \
  = - 3 limits(integral)_A(0, 0, 0)^B(x, 0, 0) dif x + 3 limits(integral)_A(
    x, y, 0
  )^B(x, y, z) x y^2 z^2 dif z - \
  - limits(integral)_A(x, y, 0)^B(x, y, z) y dif z + 2 limits(integral)_A(
    x, y, 0
  )^B(x, y, z) dif z = \
  = -3x + x y^2 z^3 - y z + 2 z
$

Ответ: потенциал поля = $x y^2 z^3 -3x - y z + 2z$

#pagebreak()

= Задание 10
== Аналитический метод

#figure(
  image("task-10-1.png", width: 80%),
  caption: "Путь интегрирования",
)

$
  gamma(t) = vec(x(t) = cos (pi/4 - t), y(t) = sin (pi/4 - t)), t in [0, pi]
$

$
  x'(t) = sin(pi/4 - t), " " y'(t) = - cos(pi/4 - t)
$

$
  f_1(x, y) = x^2+y^2, " " f_2(x, y) = 3x y
$

$
  limits(integral.cont)_(partial D) f_1(x, y) dif x + f_2(x, y) dif y = limits(integral.cont)_xor f_1(x, y) dif x + f_2(x, y) dif y  + \
  + limits(integral.cont)_"/" f_1(x, y) dif x + f_2(x, y) dif y
$

$
  limits(integral.cont)_xor (
    x^2 +y^2
  ) dif x + 3 x y dif y = limits(integral)_0^pi (
    f_1(x(t), y(t)) x'(t) + f_2(x(t), y(t)) y'(t)
  ) dif t = \
  limits(integral)_0^pi (
    f_1(cos(pi/4 - t), sin(pi/4 - t)) sin(pi/4 - t) - \
    - f_2(cos(pi/4 - t), sin(pi/4 - t)) cos(pi /4 - t)
  ) dif t = \
  = limits(integral)_0^pi (
    (cos^2(pi / 4 - t) + sin^2(pi / 4-t)) sin(pi/4 - t) - \
    - 3 cos(pi/4 - t)sin(pi/4 - t) cos(pi/4 - t) dif t
  ) = \
  = limits(integral)_0^pi (
    (sin pi / 4 - t)- 3 cos^2 (pi / 4 - t) sin(pi/4 - t)
  ) dif t = \
  = limits(integral)_0^pi sin(pi/4 - t) dif t - 3limits(integral)_0^pi cos^2 (
    pi / 4 - t
  ) sin(pi/4-t) dif t = \
  = -sqrt(2) + sqrt(2) / 2 = -sqrt(2) / 2
$

$
  limits(integral.cont)_"/" (
    x^2 + y^2
  ) dif x + 3 x y dif y = cases(x = y, dif x = dif y, delim: "{", gap: #0.6em) = \
  limits(integral)_(-sqrt(2) / 2)^(sqrt(2) / 2) 2x^2 dif x + 3x^2 dif x = 5limits(integral)_(-sqrt(2) / 2)^(sqrt(2) / 2) x^2 dif x = 5 / 3 x^3 limits(|)_(-sqrt(2) / 2)^(sqrt(2) / 2) = \
  = 5 / 3 (
    (2sqrt(2)) / 8 + (2sqrt(2)) / 8
  ) = 5 / 3 dot (4 sqrt(2)) / 8 = (5 sqrt(2)) / (3)
$

$
  limits(integral.cont)_(partial D) f_1(x, y)dif x + f_2(
    x, y
  ) dif y = -sqrt(2) / 2 + (5sqrt(2)) / 3 = sqrt(2) / 3
$

$
  -limits(integral.cont)_(partial D) (
    x^2+y^2
  ) dif x + 3 x y dif y = limits(integral.double)_D (
    (diff Q) / (diff x) - (diff P) / (diff y)
  ) dif x dif y = \
  = limits(integral.double)_D (3y - 2y) dif x dif y
  = limits(integral.double)_D y dif x dif y = \
  = limits(integral)_0^pi limits(integral)_0^1 r^2 sin (
    pi / 4 - phi
  ) dif r dif phi = 1 / 3limits(integral)_0^pi sin(pi/4 - phi) = -sqrt(2) / 3 => \
  limits(integral.cont)_(partial D) (x^2+y^2) dif x + 3 x y dif y = sqrt(2) / 3
$

Минус, так как контур ориентирован по часовой стрелке, а направление обхода по формуле Грина положительное.

#pagebreak()

== Численный метод
=== Вычисление по пути

#let data_1 = (
  (1.00000000e-01, 6.12560673e-01, 1.41156153e-01, 6.66000000e-07),
  (1.00000000e-02, 4.67410700e-01, 3.99382098e-03, 2.20900000e-06),
  (1.00000000e-03, 4.70843152e-01, 5.61369113e-04, 2.07080000e-05),
  (1.00000000e-04, 4.71336432e-01, 6.80887116e-05, 2.07250000e-04),
  (1.00000000e-05, 4.71400047e-01, 4.47359229e-06, 2.09362500e-03),
  (1.00000000e-06, 4.71403936e-01, 5.84685097e-07, 2.10240000e-02),
  (1.00000000e-07, 4.71404467e-01, 5.37838500e-08, 2.12226500e-01),
  (1.00000000e-08, 4.71404508e-01, 1.26584077e-08, 2.07453271e+00),
)

#let formatFloat(t: float) = {
  if (calc.abs(t) < 1e-4) {
    return strfmt("{:.3e}", t)
  }

  return strfmt("{:.4}", t)
}

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  align: center + horizon,
  table.header()[$delta$][Результат вычисления][Отклонение от аналитического результата][Время выполнения, с],
  ..for value in data_1 {
    for elem in value {
      ([#formatFloat(t: elem)],)
    }
  }
)

=== Вычисление при помощи формулы Грина и прохождением по каждому элементу сетки

#let data_2 = (
  (1.00000000e-01, 3.84500000e-01, 8.69045208e-02, 5.42000000e-07),
  (1.00000000e-02, 4.63303000e-01, 8.10152079e-03, 4.12080000e-05),
  (1.00000000e-03, 4.70603524e-01, 8.00996791e-04, 3.96308400e-03),
  (1.00000000e-04, 4.71325382e-01, 7.91385131e-05, 3.75959083e-01),
  (1.00000000e-05, 4.71396639e-01, 7.88175656e-06, 3.88214247e+01),
)

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  align: center + horizon,
  table.header()[$delta$][Результат вычисления][Отклонение от аналитического результата][Время выполнения, с],
  ..for value in data_2 {
    for elem in value {
      ([#formatFloat(t: elem)],)
    }
  }
)

#let data_3 = (
  (20, 7.65932849e-01, 2.94528328e-01, 7.00000000e-06),
  (50, 4.56732355e-01, 1.46721656e-02, 1.25000000e-06),
  (100, 3.25780699e-01, 1.45623822e-01, 2.79200000e-06),
  (1000, 4.10911244e-01, 6.04932773e-02, 2.69170000e-05),
  (10000, 4.64302132e-01, 7.10238926e-03, 2.72958000e-04),
  (100000, 4.75867896e-01, 4.46337487e-03, 2.66945900e-03),
  (1000000, 4.70318637e-01, 1.08588343e-03, 2.66140000e-02),
  (10000000, 4.71011540e-01, 3.92980624e-04, 2.67722000e-01),
  (100000000, 4.71526082e-01, 1.21561040e-04, 2.72526475e+00),
)

#pagebreak()

=== Вычисление при помощи формулы Грина и метода Монте-Карло

#let data_4 = (
  (20, 2.70807742e-01, 2.00596779e-01, 7.08300000e-06),
(50, 6.36924382e-01, 1.65519861e-01, 1.45800000e-06),
(100, 2.49401800e-01, 2.22002721e-01, 2.87500000e-06),
(1000, 4.91492963e-01, 2.00884419e-02, 2.79580000e-05),
(10000, 4.94104197e-01, 2.26996764e-02, 2.70667000e-04),
(100000, 4.65178004e-01, 6.22651649e-03, 2.63008300e-03),
(1000000, 4.72034046e-01, 6.29525262e-04, 2.65534590e-02),
(10000000, 4.71402710e-01, 1.81128009e-06, 2.67476833e-01),
(100000000, 4.71471932e-01, 6.74114650e-05, 2.63557492e+00),
)

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  align: center + horizon,
  table.header()[$N$][Результат вычисления][Отклонение от аналитического результата][Время выполнения, с],
  ..for value in data_3 {
    for elem in value {
      ([#formatFloat(t: elem)],)
    }
  }
)

=== Более "случайный" алгоритм выбора точки
#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  align: center + horizon,
  table.header()[$N$][Результат вычисления][Отклонение от аналитического результата][Время выполнения, с],
  ..for value in data_4 {
    for elem in value {
      ([#formatFloat(t: elem)],)
    }
  }
)

#pagebreak()

== Вывод
Вычисление интеграла по "пути" при решении данной задачи оказался самым эффективным и точным методом, сложность работы алгоритма $O(delta^(-1))$ (наверное, так не совсем корректно писать, но вроде бы понятно). Вычисление интеграла при помощи формулы Грина дает меньшую точность, при этом значительно дольше выполняется, сложность работы алгоритма $O(delta^(-2))$. Формул Грина и метод Монте-Карло позволяют найти приближенное значение интеграла за $O(n)$, но точность результата сильно зависит от алгоритма распределения и везения.