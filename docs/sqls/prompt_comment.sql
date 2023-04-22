CREATE TABLE prompt_comment
(
    id BIGSERIAL NOT NULL,
    uuid CHARACTER VARYING(64) NOT NULL UNIQUE ,
    user_uuid CHARACTER VARYING(64),
    to_user_uuid CHARACTER VARYING(64),
    prompt_uuid CHARACTER VARYING(64),
    parent_uuid CHARACTER VARYING(64),
    content TEXT,
    top_weight INTEGER DEFAULT 0,
    upvote_num INTEGER DEFAULT 0,
    reply_num INTEGER DEFAULT 0,
    status CHARACTER VARYING(32),
    create_at TIMESTAMP WITH TIME ZONE,
    update_at TIMESTAMP WITH TIME ZONE,
    CONSTRAINT prompt_comment_id_k PRIMARY KEY (id)
);

COMMENT ON TABLE prompt_comment IS 'prompt 评论表'; -- 表注释
COMMENT ON COLUMN prompt_comment.id IS 'ID，自增长整数'; -- 列注释
COMMENT ON COLUMN prompt_comment.uuid IS '回复 UUID，最大长度为64个字符，不能为空且唯一';
COMMENT ON COLUMN prompt_comment.user_uuid IS '回贴人 uuid，最大长度为64个字符, 不为空';
COMMENT ON COLUMN prompt_comment.to_user_uuid IS '被回复人 uuid';
COMMENT ON COLUMN prompt_comment.prompt_uuid IS 'prompt uuid，不为空';
COMMENT ON COLUMN prompt_comment.parent_uuid IS '父级回复uuid';
COMMENT ON COLUMN prompt_comment.content IS '回复内容';
COMMENT ON COLUMN prompt_comment.top_weight IS '回复权重，默认为0';
COMMENT ON COLUMN prompt_comment.upvote_num IS '回复点赞数，被点赞事件时更新';
COMMENT ON COLUMN prompt_comment.reply_num IS '被回复数，被回复事件时更新';
COMMENT ON COLUMN prompt_comment.status IS '回复状态， 话题状态：normal/banned/deleted';
COMMENT ON COLUMN prompt_comment.create_at IS '创建时间戳，在插入数据时默认为当前时间';
COMMENT ON COLUMN prompt_comment.update_at IS '更新时间戳，在插入或更新数据时默认为当前时间';


CREATE INDEX index_pc_prompt_uuid ON prompt_comment (prompt_uuid);

CREATE INDEX index_pc_parent_uuid ON prompt_comment (parent_uuid);

CREATE INDEX index_pc_user_uuid ON prompt_comment (user_uuid);

ALTER TABLE prompt_comment ADD CONSTRAINT pr_pr_rs1 FOREIGN KEY (parent_uuid) REFERENCES prompt_comment (uuid) ON DELETE NO ACTION  ON UPDATE NO ACTION;