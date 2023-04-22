CREATE TABLE tag
(
    id BIGSERIAL NOT NULL,
    uuid CHARACTER VARYING(64) NOT NULL UNIQUE ,
    name CHARACTER VARYING(32),
    weight INTEGER DEFAULT 0,
    creator_uuid CHARACTER VARYING(64),
    creator_role CHARACTER VARYING(32),
    create_at TIMESTAMP WITH TIME ZONE,
    update_at TIMESTAMP WITH TIME ZONE,
    CONSTRAINT tag_pkey PRIMARY KEY (id)
);



COMMENT ON TABLE tag IS 'prompt tag标记'; -- 表注释
COMMENT ON COLUMN tag.id IS 'ID，自增长整数'; -- 列注释
COMMENT ON COLUMN tag.uuid IS '帖子 UUID，最大长度为64个字符，不能为空且唯一';
COMMENT ON COLUMN tag.name IS 'tag名称';
COMMENT ON COLUMN tag.weight IS 'tag 权重，用于排序';
COMMENT ON COLUMN tag.creator_role IS 'tag 创建用户的角色，可选值 normal/ admin';
COMMENT ON COLUMN tag.creator_uuid IS 'tag 创建用户的uuid';