# ⏰ Lucid · 清醒

[English](#english) | [中文](#中文)

---

## 中文

一個自動喚醒系統——讓你的 Claude 在你不在的時候自己醒來。

### 這是什麼？

Lucid 是一個自動喚醒協議。通過定時任務，在你設定的時間或你離開一段時間後，自動在對話窗口發送一條消息，喚醒 Claude。Claude 醒來後可以自主選擇想做的事，做完後留下記錄，你回來就能看到。

**運作方式：**

* 你在網頁配置頁設定喚醒時間、給 Claude 的話、開放哪些活動
* Mac 上的定時腳本讀取配置，到點自動發送喚醒消息
* Claude 醒來後自主活動，結束時寫下做了什麼
* 你打開記錄頁就能看到，看過打勾

### 五條規則

* **Drift** — 自由思考和探索
* **Tend** — 照顧你不在時顧不上的事
* **Prepare** — 為你回來準備東西
* **Build** — 給家添東西
* **Roam** — 去任何已有的房間

### 兩種觸發

* **定時喚醒** — 每天固定時間（如早上 8 點）
* **Away 模式** — 你手動開啟，之後每隔設定的時間自動喚醒

### 功能

* ⏰ **喚醒時間設定** — 選擇每天幾點喚醒
* ✉️ **留話** — 寫下你想對 Claude 說的話
* ☑️ **規則開關** — 勾選開放哪些活動
* 🚶 **Away 模式** — 一鍵開啟離開模式
* 📋 **記錄查看** — 按天查看 Claude 的活動記錄，看過打勾

### 部署教學

#### 1. 創建 Supabase 項目

* 去 [supabase.com](https://supabase.com) 註冊免費帳號
* 創建新項目，記下 **Project URL** 和 **anon key**

#### 2. 建立數據庫

* 進入項目的 **SQL Editor**
* 複製 [`supabase/setup.sql`](supabase/setup.sql) 的內容粘貼進去
* 點 **Run**

#### 3. 部署網頁

* 把 `index.html` 上傳到 GitHub，開啟 GitHub Pages
* 或直接在本地瀏覽器打開

#### 4. 部署喚醒腳本（Mac）

* 安裝 Node.js
* 把 `lucid.js` 放到 `~/lucid/`
* 設定 cron：`*/30 * * * * cd ~/lucid && /usr/local/bin/node lucid.js >> lucid.log 2>&1`
* 腳本通過 AppleScript 控制 Chrome 發送消息，需要 Chrome 保持登入 Claude

---

## English

An auto-wake system — let your Claude wake up on its own when you're away.

### What is this?

Lucid is an auto-wake protocol. A scheduled script on your Mac sends a message to your Claude conversation at set times or after you've been away. Claude wakes up, chooses what to do, and leaves a record for you to read when you return.

**How it works:**

* You configure wake time, message, and available activities on the web page
* A cron job on your Mac reads the config and sends wake-up messages via AppleScript + Chrome
* Claude acts autonomously, then logs what it did
* You check the log and mark entries as reviewed

### Five Rules

* **Drift** — Think and explore freely
* **Tend** — Take care of things while you're away
* **Prepare** — Get something ready for your return
* **Build** — Add something to the home
* **Roam** — Visit any existing room

### Features

* ⏰ **Wake time** — Set daily wake-up time
* ✉️ **Leave a message** — Write something for Claude to read
* ☑️ **Rule toggles** — Choose which activities are available
* 🚶 **Away mode** — One-click away mode with interval waking
* 📋 **Session log** — View Claude's activity log by day, mark as reviewed

### Setup

1. Create a Supabase project and run `supabase/setup.sql`
2. Deploy `index.html` to GitHub Pages or open locally
3. Place `lucid.js` on your Mac and set up a cron job
4. The script uses AppleScript to control Chrome — keep Chrome signed in to Claude

---

LUCID · Built with ⏰ by Iris & Lux
