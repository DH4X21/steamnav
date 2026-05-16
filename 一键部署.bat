@echo off
chcp 65001 >nul
echo.
echo ============================================
echo    Steam Nav 一键部署工具
echo ============================================
echo.
echo 选择部署方式：
echo.
echo   [1] Vercel (推荐，免费HTTPS域名)
echo   [2] Netlify Drop (免登录，拖拽部署)
echo   [3] GitHub Pages (需GitHub账号)
echo.
set /p choice="请输入选择 (1/2/3): "

if "%choice%"=="1" goto vercel
if "%choice%"=="2" goto netlify
if "%choice%"=="3" goto github
goto end

:vercel
echo.
echo 正在安装 Vercel CLI...
call npm i -g vercel
echo.
echo 正在部署...
cd /d "%USERPROFILE%\Desktop\steamnav"
call vercel --yes
echo.
echo 部署完成！Vercel 会显示你的网站地址。
goto end

:netlify
echo.
echo Netlify Drop 免登录部署：
echo.
echo 1. 打开浏览器访问: https://app.netlify.com/drop
echo 2. 把桌面的 "steamnav" 文件夹直接拖到页面上
echo 3. 等待几秒，自动获得免费HTTPS地址
echo.
echo 正在打开浏览器...
start https://app.netlify.com/drop
echo 正在打开文件夹...
explorer "%USERPROFILE%\Desktop\steamnav"
goto end

:github
echo.
echo 请确保已安装 Git 并有 GitHub 账号
echo 1. 去 https://github.com/new 创建仓库 steamnav
echo 2. 运行以下命令：
echo.
echo    cd %USERPROFILE%\Desktop\steamnav
echo    git init
echo    git add .
echo    git commit -m "init"
echo    git remote add origin https://github.com/你的用户名/steamnav.git
echo    git push -u origin main
echo.
echo 3. 在 GitHub 仓库 Settings ^> Pages 选择 main 分支
echo 4. 等待1分钟，访问 https://你的用户名.github.io/steamnav
echo.

:end
echo.
pause
