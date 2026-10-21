# SauceDemo UI Automation

[![SauceDemo UI tests](https://github.com/ri-ce/saucedemo-ui-automation/actions/workflows/tests.yml/badge.svg)](https://github.com/ri-ce/saucedemo-ui-automation/actions/workflows/tests.yml)
![Python](https://img.shields.io/badge/Python-3.12%2B-3776AB?logo=python&logoColor=white)
![Playwright](https://img.shields.io/badge/Playwright-1.55%2B-2EAD33?logo=playwright&logoColor=white)

使用 Playwright 对 Sauce Labs 公开的 SauceDemo 演示商城执行网页自动化测试。
项目通过真实浏览器模拟用户操作，覆盖登录、商品排序、购物车和完整结算流程。

## 测试结果

| 指标 | 结果 |
| --- | ---: |
| 自动化用例 | 12 |
| 最近一次本地结果 | 12 / 12 通过 |
| 最近一次独立执行耗时 | 32.77 秒 |
| 被测网站 | `https://www.saucedemo.com/` |
| CI | GitHub Actions |

## 测试内容

- 登录页面加载。
- 标准用户正常登录。
- 错误密码提示。
- 锁定账号被拒绝。
- 登录后退出。
- 商品列表数量。
- 商品价格从低到高排序。
- 商品名称从 Z 到 A 排序。
- 加入和移除购物车。
- 购物车商品展示。
- 结算表单必填校验。
- 标准用户完整下单。

## 技术设计

- 使用 Page Object 模式封装登录、商品、购物车和结算页面。
- 使用 `data-test` 属性进行稳定元素定位。
- 使用 Playwright 自动等待，避免固定睡眠时间。
- 每个测试使用独立浏览器上下文，隔离登录状态和购物车数据。
- 测试失败时自动保存完整页面截图。
- GitHub Actions 自动安装 Chromium 并执行回归。

## 页面对象

```text
ui_tests/pages/
├── login_page.py
├── inventory_page.py
├── cart_page.py
└── checkout_page.py
```

测试用例只表达用户业务步骤，页面元素和操作集中放在页面对象中，
网页结构变化时可以集中维护。

## 运行

```powershell
.\run_tests.ps1
```

如果本机没有 Playwright 浏览器，可以安装 Chromium：

```powershell
python -m playwright install chromium
```

手动运行：

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install -r requirements.txt
python -m pytest ui_tests --html=docs/test-report.html --self-contained-html
```

## 在线页面

- 项目页：`https://ri-ce.github.io/saucedemo-ui-automation/`
- 测试报告：`https://ri-ce.github.io/saucedemo-ui-automation/test-report.html`


## 项目边界

SauceDemo 是 Sauce Labs 提供的公开测试演示网站，不是企业生产系统。
测试账号和顾客信息均为公开演示数据。
