CREATE TABLE community_discussion(
    id BIGSERIAL NOT NULL,
    uuid CHARACTER VARYING(64) NOT NULL UNIQUE ,
    user_uuid CHARACTER VARYING(64) NOT NULL,
    topic_uuid CHARACTER VARYING(64),
    title CHARACTER VARYING(60),
    content TEXT,
    position CHARACTER VARYING(128),
    top_weight INTEGER DEFAULT 0,
    upvote_num INTEGER DEFAULT 0,
    upvote_fake_num INTEGER DEFAULT 0,
    click_num INTEGER DEFAULT 0,
    click_fake_num INTEGER DEFAULT 0,
    reply_num INTEGER DEFAULT 0,
    operation_time TIMESTAMP WITHOUT TIME ZONE,
    creator_type  CHARACTER VARYING(20) DEFAULT 'user',
    status CHARACTER VARYING(32) DEFAULT 'normal',
    create_at TIMESTAMP WITH TIME ZONE,
    update_at TIMESTAMP WITH TIME ZONE,
    CONSTRAINT community_discussion_id_k PRIMARY KEY (id)
);


COMMENT ON TABLE community_discussion IS '论坛帖子'; -- 表注释
COMMENT ON COLUMN community_discussion.id IS 'ID，自增长整数'; -- 列注释
COMMENT ON COLUMN community_discussion.uuid IS '帖子 UUID，最大长度为64个字符，不能为空且唯一';
COMMENT ON COLUMN community_discussion.user_uuid IS '发贴人 uuid，最大长度为64个字符，不为空';
COMMENT ON COLUMN community_discussion.topic_uuid IS '话题 uuid，最大长度为64个字符';
COMMENT ON COLUMN community_discussion.title IS '帖子 uuid，最大长度为64个字符';
COMMENT ON COLUMN community_discussion.content IS '帖子 内容';
COMMENT ON COLUMN community_discussion.position IS '帖子 地理位置';
COMMENT ON COLUMN community_discussion.top_weight IS '帖子 排序权重， 默认值为0';
COMMENT ON COLUMN community_discussion.upvote_num IS '帖子 点赞数，默认为0';
COMMENT ON COLUMN community_discussion.upvote_num IS '帖子 点赞数，默认为0';
COMMENT ON COLUMN community_discussion.upvote_fake_num IS '帖子 虚拟点赞数，默认为0';
COMMENT ON COLUMN community_discussion.click_num IS '帖子 点击量，默认为0';
COMMENT ON COLUMN community_discussion.click_fake_num IS '帖子 虚拟点击量，默认为0';
COMMENT ON COLUMN community_discussion.reply_num IS '帖子 回复数，发生回帖事件更新';
COMMENT ON COLUMN community_discussion.operation_time IS '帖子 操作事件，用户编辑帖子时更新';
COMMENT ON COLUMN community_discussion.creator_type IS '帖子 创建人类型，admin/user';
COMMENT ON COLUMN community_discussion.status IS '帖子 状态, 可选值 normal/banned/deleted';


CREATE INDEX idx_cd_topic_uuid ON community_discussion (topic_uuid);
CREATE INDEX idx_cd_user_uuid ON community_discussion (user_uuid);
