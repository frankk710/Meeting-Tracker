📊 每周会议保障排期表 - 安装与部署说明
本项目是一个基于 Cloudflare 生态 构建的轻量级会议管理系统。采用前后端分离架构，利用 Cloudflare Pages 托管前端，Workers 处理 API，D1 数据库存储数据。

🛠️ 技术架构
前端: HTML5 + Tailwind CSS (通过 CDN 加载)

后端: Cloudflare Workers (接口逻辑)

数据库: Cloudflare D1 (关系型数据库)

部署平台: Cloudflare Pages + GitHub 自动联动

🚀 部署步骤
1. 准备数据库 (Cloudflare D1)
登录 Cloudflare 控制台，进入 Workers & Pages -> D1。

创建一个名为 meeting_db 的数据库。

在控制台执行以下 SQL 语句初始化表结构：

SQL
CREATE TABLE meetings (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    meeting_time TEXT NOT NULL,
    location TEXT NOT NULL,
    meeting_type TEXT,
    department TEXT,
    leader TEXT,
    status TEXT,
    notes TEXT
);
2. 部署后端 (Cloudflare Workers)
在 GitHub 仓库中创建 functions/api/meetings.js 文件。

将提供的后端逻辑代码粘贴进去。

在 Cloudflare Pages 的项目设置中，进入 Settings -> Functions -> D1 database bindings。

添加绑定，变量名设为 DB，绑定到你创建的 meeting_db 数据库。

3. 设置安全密码
在 Cloudflare Pages 项目设置中，进入 Settings -> Environment variables。

添加一个变量 ADMIN_PASSWORD，值为你设定的删除权限密码（如：666888）。

4. 部署前端
将最终版的 index.html 放入仓库的 public 文件夹下。

提交并推送至 GitHub，Cloudflare 会自动完成构建部署。

📝 核心功能说明
1. 数据隔离显示
单元格隔离：通过 border 样式实现物理边框隔离，确保数据清晰不混淆。

领导标签化：输入时使用顿号（、）分隔多个姓名，系统会自动渲染为独立的蓝色小标签。

类型防换行：针对“本地会”、“视频会”等标签做了强制不换行处理（whitespace-nowrap）。

2. 交互逻辑
序号自动生成：前端根据列表索引实时计算序号 Index + 1，删除记录后序号会自动重排。

修改功能：点击“修改”按钮，数据将回填至上方表单，表单颜色变为黄色提示状态，点击“保存”即可更新。

删除功能：点击“删除”需输入预设的管理员密码，校验通过后方可操作。

3. 自适应布局
宽幅设计：容器宽度设置为全屏的 95%，充分利用显示器空间。

折行规则：时间、类型、操作等固定内容禁止换行；会议名称、备注等长文本支持自动折行。

📂 文件目录结构
Plaintext
├── public/
│   └── index.html      # 前端界面逻辑
├── functions/
│   └── api/
│       └── meetings.js # 后端 API 接口 (处理 GET/POST/PUT/DELETE)
└── README.md           # 本说明文档
⚠️ 注意事项
CDN 依赖：前端使用了 Tailwind CSS 的 CDN，运行环境需保持网络畅通。

密码安全：请务必在 Cloudflare 环境变量中设置 ADMIN_PASSWORD，否则默认删除密码可能为 123456。

时间格式：日期时间控件采用原生 datetime-local，存储格式为标准的 ISO 字符串。
