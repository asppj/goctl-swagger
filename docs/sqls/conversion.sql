CREATE TABLE conversation
(
    id BIGSERIAL NOT NULL,
    uuid CHARACTER VARYING(64) NOT NULL UNIQUE ,
    prompt_uuid CHARACTER VARYING(64),
    conversation_index INTEGER,
    avatar_url CHARACTER VARYING(256),
    content TEXT,
    status CHARACTER VARYING(32),
    role CHARACTER VARYING(32),
    create_at TIMESTAMP WITH TIME ZONE,
    update_at TIMESTAMP WITH TIME ZONE,
    CONSTRAINT conversation_pkey PRIMARY KEY (id)
);


COMMENT ON TABLE conversation IS 'prompt 对话表';
COMMENT ON COLUMN conversation.id IS '自增主键';
COMMENT ON COLUMN conversation.uuid IS '对话表表uuid，最大64位字符串，唯一不为空';
COMMENT ON COLUMN conversation.prompt_uuid IS 'prompt 的uuid';
COMMENT ON COLUMN conversation.conversation_index IS '对话序列，用于前端排序';
COMMENT ON COLUMN conversation.avatar_url IS '消息发送方头像';
COMMENT ON COLUMN conversation.content IS '消息内容';
COMMENT ON COLUMN conversation.status IS '状态，可选：active/delete';
COMMENT ON COLUMN conversation.role IS '发送方角色，可选：openAI/ user';
COMMENT ON COLUMN conversation.create_at IS '创建时间戳，在插入数据时默认为当前时间';
COMMENT ON COLUMN conversation.update_at IS '更新时间戳，在插入或更新数据时默认为当前时间';


CREATE INDEX index_conversation_prompt_uuid ON conversation (prompt_uuid);