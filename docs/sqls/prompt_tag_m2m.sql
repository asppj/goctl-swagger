CREATE TABLE prompt_tag_m2m
(
    id BIGSERIAL NOT NULL,
    prompt_uuid CHARACTER VARYING(64),
    tag_md5 CHARACTER VARYING(64),
    CONSTRAINT prompt_tag_m2m_pkey PRIMARY KEY (id)
);

COMMENT ON TABLE prompt_tag_m2m IS 'prompt 关联tag中间表'; -- 表注释

COMMENT ON COLUMN prompt_tag_m2m.tag_md5 IS 'tag字符串 md5，用于查询tag关联Prompt'; -- 列注释
CREATE INDEX idx_ptm_prompt_uuid ON prompt_tag_m2m (prompt_uuid);

CREATE INDEX idx_ptm_prompt_tag_uuid ON prompt_tag_m2m (tag_md5);