DROP TABLE IF EXISTS meetings;
CREATE TABLE meetings (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,          -- 会议名称
    meeting_time TEXT NOT NULL,   -- 会议时间
    location TEXT,                -- 会议地点/会议室
    status TEXT DEFAULT '未开始',  -- 状态 (未开始/进行中/已完成)
    notes TEXT                    -- 备注/保障要求
);