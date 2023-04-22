CREATE TABLE prompt(
    id BIGSERIAL NOT NULL,
    uuid CHARACTER VARYING(64) NOT NULL UNIQUE ,
    upvote_num INTEGER DEFAULT 0,
    saved_num INTEGER DEFAULT 0,
    user_uuid CHARACTER VARYING(64),
    name CHARACTER VARYING(32),
    status CHARACTER VARYING(32),
    description CHARACTER VARYING(64),
    background_url CHARACTER VARYING(256),
    tag_list jsonb,
    template TEXT,
    visibility BOOLEAN DEFAULT True,
    create_at TIMESTAMP WITH TIME ZONE,
    update_at TIMESTAMP WITH TIME ZONE,
    CONSTRAINT prompt_pkey PRIMARY KEY (id)
);




COMMENT ON TABLE prompt IS '记录用户传教的prompt'; -- 表注释
COMMENT ON COLUMN prompt.id IS 'ID，自增长整数'; -- 列注释
COMMENT ON COLUMN prompt.uuid IS '帖子 UUID，最大长度为64个字符，不能为空且唯一';
COMMENT ON COLUMN prompt.upvote_num IS '点赞次数，点赞该prompt的用户数';
COMMENT ON COLUMN prompt.saved_num IS '保存次数，保存该prompt的用户数';
COMMENT ON COLUMN prompt.user_uuid IS 'user uuid，prompt的拥有者';
COMMENT ON COLUMN prompt.name IS 'prompt 名称，最大长度为32个字符，不能为空且唯一';
COMMENT ON COLUMN prompt.description IS '描述，保存该prompt的描述';
COMMENT ON COLUMN prompt.status IS '状态，保存该prompt的状态，可选值 active/delete';
COMMENT ON COLUMN prompt.background_url IS '背景图，保存该prompt的背景图';
COMMENT ON COLUMN prompt.template IS '模版，基于该prompt生成的模版';
COMMENT ON COLUMN prompt.visibility IS '可见性，该模版是否公开';
COMMENT ON COLUMN prompt.tag_list IS '标签列表，保存该prompt的标签列表"{"value":["tag1","tag2"]}"';


CREATE INDEX index_prompt_user_uuid ON prompt (user_uuid);
CREATE INDEX index_prompt_tag_list ON prompt USING GIN (tag_list);