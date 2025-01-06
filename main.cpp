#include <iostream>
#include <format>
#include <print>
#include <cmath>
#include <algorithm>
#include <numbers>
#include <numeric>
#include <chrono>
#include <ranges>
#include <random>

[[nodiscard]] constexpr auto f(const double x, const double y) -> double {
  return (x * x + y * y) + 3.0 * x * y;
}

[[nodiscard]] constexpr auto f1(const double x, const double y) -> double {
  return x * x + y * y;
}

[[nodiscard]] constexpr auto f2(const double x, const double y) -> double {
  return 3.0 * x * y;
}

auto pathMethod(const double delta) -> double {
  constexpr double angle_start = std::numbers::pi / 4.0;
  constexpr double angle_end = -3.0 * std::numbers::pi / 4.0;

  auto n = static_cast<std::size_t>((angle_start - angle_end) / delta);
  double s = 0.0;
  double angle = angle_start;

  for (std::size_t i = 0; i != n; ++i, angle -= delta) {
    const double x = std::cos(angle);
    const double y = std::sin(angle);

    s += f1(x, y) * sin(angle) * delta;
    s += -f2(x, y) * cos(angle) * delta;
  }

  const double step = delta / std::numbers::sqrt2;

  const double x_start = std::cos(angle_end);
  const double x_end = std::cos(angle_start);
  double x = x_start;

  n = static_cast<std::size_t>((x_end - x_start) / step);

  for (std::size_t i = 0; i != n; ++i, x += step) {
    s += f1(x, x) * step;
    s += f2(x, x) * step;
  }

  return s;
}

auto grinFormula(const double delta) -> double {
  auto f = [](const double /* x */, const double y) {
    return y;
  };

  double s = 0.0;
  double x = -1.0 + delta / 2.0;
  const std::size_t n = static_cast<std::size_t>(std::ceil(2.0 / delta)) - 1U;

  for (std::size_t i = 0; i != n; ++i, x += delta) {
    double y = -1.0 + delta / 2.0;

    for (std::size_t j = 0; j != n; ++j, y += delta) {
      const double v = f(x, y) * delta * delta;
      s += (x >= y && x * x + y * y <= 1.0) ? v : 0.0;
    }
  }

  return -s;
}

auto monteCarlo(const std::size_t N) -> double {
  static std::mt19937_64 engine{std::random_device{}()};
  static std::uniform_real_distribution distribution(-1.0, 1.0);

  constexpr double S = 2.0 * 2.0;
  double s = 0.0;

  for (std::size_t i = 0; i != N; ++i) {
    const double x = distribution(engine);
    const double y = distribution(engine);

    s += (x >= y && x * x + y * y <= 1.0) ? y : 0.0;
  }

  return -s * S / static_cast<double>(N);
}

int main() {
  using namespace std::chrono_literals;

  constexpr std::array deltas{1e-1, 1e-2, 1e-3, 1e-4, 1e-5, 1e-6, 1e-7, 1e-8, 1e-9};
  constexpr std::array<std::size_t, 9> nValues{20, 50, 100, 1000, 10'000, 100'000, 1'000'000, 10'000'000, 100'000'000};
  constexpr double answer = std::numbers::sqrt2 / 3.0;

  std::println("Вычисление интеграла по пути");

  for (auto delta: deltas) {
    const auto begin = std::chrono::high_resolution_clock::now();
    auto result = pathMethod(delta);
    const auto end = std::chrono::high_resolution_clock::now();
    std::println("Шаг: {:.0e}, результат: {:.4}, отклонение от аналитического результата: {:.4}, время выполнения: {} нс", delta, result,
                std::abs(result - answer), (end - begin) / 1ns);
  }

  std::println("Вычисление интеграла с применением формулы Грина для области");

  for (auto delta: deltas | std::views::take(4)) {
    const auto begin = std::chrono::high_resolution_clock::now();
    auto result = grinFormula(delta);
    const auto end = std::chrono::high_resolution_clock::now();
    std::println("Шаг: {:.0e}, результат: {:.4}, отклонение от аналитического результата: {:.4}, время выполнения: {} нс", delta, result,
                std::abs(result - answer), (end - begin) / 1ns);
  }

  std::println("Вычисление интеграла с применением формулы Грина и метода Монте-Карло для области");

  for (auto n: nValues) {
    const auto begin = std::chrono::high_resolution_clock::now();
    auto result = monteCarlo(n);
    const auto end = std::chrono::high_resolution_clock::now();
    std::println("N: {}, результат: {:.4}, отклонение от аналитического результата: {:.4}, время выполнения: {} нс", n, result,
                std::abs(result - answer), (end - begin) / 1ns);
  }
}
