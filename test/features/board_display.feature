Feature: 棋盘显示
  作为一个象棋游戏玩家
  我想要看到一个标准的国际象棋棋盘
  以便于我能够开始下棋

  Scenario: 显示标准8x8棋盘
    Given 我打开了游戏
    When 游戏加载完成
    Then 我应该看到一个8x8的棋盘
    And 棋盘应该显示交替的黑白格子
    And 棋盘的边缘应该显示坐标标识(A-H和1-8)

  Scenario: 初始化棋子位置
    Given 我打开了游戏
    When 游戏加载完成
    Then 我应该看到所有棋子在正确的初始位置
    And 白方棋子应该在底部两行
    And 黑方棋子应该在顶部两行 