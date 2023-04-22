CREATE TABLE community_topic(
    id BIGSERIAL NOT NULL,
    uuid CHARACTER VARYING(64) NOT NULL UNIQUE ,
    topic_name CHARACTER VARYING(30) UNIQUE,
    description CHARACTER VARYING(255),
    weight INTEGER DEFAULT 0,
    status CHARACTER VARYING(32) DEFAULT 'active',
    type  CHARACTER VARYING(32) DEFAULT 'topics',
    create_at TIMESTAMP WITH TIME ZONE,
    update_at TIMESTAMP WITH TIME ZONE,
    CONSTRAINT community_topic_id_k PRIMARY KEY (id)
);

COMMENT ON TABLE community_topic IS '论坛话题表'; -- 表注释
COMMENT ON COLUMN community_topic.id IS 'ID，自增长整数'; -- 列注释
COMMENT ON COLUMN community_topic.uuid IS 'topic UUID，最大长度为64个字符，不能为空且唯一';
COMMENT ON COLUMN community_topic.topic_name IS '话题名称，最大长度为30个字符';
COMMENT ON COLUMN community_topic.description IS '话题描述，最大长度为255个字符';
COMMENT ON COLUMN community_topic.weight IS '话题权重， 默认为0， 数值越大权重越高';
COMMENT ON COLUMN community_topic.status IS '话题状态，最大长度为32个字符， 话题状态：active/inactive/deleted';
COMMENT ON COLUMN community_topic.type IS '话题类型， 可选topic/roles';
COMMENT ON COLUMN community_topic.create_at IS '创建时间戳，在插入数据时默认为当前时间';
COMMENT ON COLUMN community_topic.update_at IS '更新时间戳，在插入或更新数据时默认为当前时间';