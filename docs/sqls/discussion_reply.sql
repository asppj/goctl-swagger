CREATE TABLE discussion_reply(
    id BIGSERIAL NOT NULL,
    uuid CHARACTER VARYING(64) NOT NULL UNIQUE,
    user_uuid CHARACTER VARYING(64) NOT NULL,
    to_user_uuid CHARACTER VARYING(64),
    discussion_uuid CHARACTER VARYING(64),
    parent_uuid CHARACTER VARYING(64),
    content TEXT,
    top_weight INTEGER DEFAULT 0,
    upvote_num INTEGER DEFAULT 0,
    reply_num INTEGER DEFAULT 0,

    status CHARACTER VARYING(32) DEFAULT 'normal',
    create_at TIMESTAMP WITH TIME ZONE,
    update_at TIMESTAMP WITH TIME ZONE,
    CONSTRAINT discussion_reply_id_k PRIMARY KEY (id)
);

COMMENT ON TABLE discussion_reply IS '帖子回复表'; -- 表注释
COMMENT ON COLUMN discussion_reply.id IS 'ID，自增长整数'; -- 列注释
COMMENT ON COLUMN discussion_reply.uuid IS '回复 UUID，最大长度为64个字符，不能为空且唯一';
COMMENT ON COLUMN discussion_reply.user_uuid IS '回贴人 uuid，最大长度为64个字符, 不为空';
COMMENT ON COLUMN discussion_reply.to_user_uuid IS '被回复人 uuid';
COMMENT ON COLUMN discussion_reply.discussion_uuid IS '帖子uuid，不为空';
COMMENT ON COLUMN discussion_reply.parent_uuid IS '父级回复uuid';
COMMENT ON COLUMN discussion_reply.content IS '回复内容';
COMMENT ON COLUMN discussion_reply.top_weight IS '回复权重，默认为0';
COMMENT ON COLUMN discussion_reply.upvote_num IS '回复点赞数，被点赞事件时更新';
COMMENT ON COLUMN discussion_reply.reply_num IS '被回复数，被回复事件时更新';

COMMENT ON COLUMN discussion_reply.status IS '回复状态， 话题状态：normal/banned/deleted';


COMMENT ON COLUMN discussion_reply.create_at IS '创建时间戳，在插入数据时默认为当前时间';
COMMENT ON COLUMN discussion_reply.update_at IS '更新时间戳，在插入或更新数据时默认为当前时间';



CREATE INDEX idx_dr_post_uuid ON discussion_reply (discussion_uuid);
CREATE INDEX idx_dr_parent_uuid ON discussion_reply (parent_uuid);
CREATE INDEX idx_dr_user_uuid ON discussion_reply (user_uuid);
ALTER TABLE discussion_reply ADD CONSTRAINT pr_pr_rs1 FOREIGN KEY (parent_uuid) REFERENCES discussion_reply (uuid) ON DELETE NO ACTION  ON UPDATE NO ACTION;