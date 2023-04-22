CREATE TABLE upvote_record(
    id BIGSERIAL NOT NULL,
    uuid CHARACTER VARYING(64) NOT NULL UNIQUE ,
    user_uuid CHARACTER VARYING(30),
    target_uuid CHARACTER VARYING(64),
    target_type  CHARACTER VARYING(32),
    create_at TIMESTAMP WITH TIME ZONE,
    CONSTRAINT upvote_record_id_k PRIMARY KEY (id)
);

COMMENT ON TABLE upvote_record IS '点赞记录表'; -- 表注释
COMMENT ON COLUMN upvote_record.id IS 'ID，自增长整数'; -- 列注释
COMMENT ON COLUMN upvote_record.uuid IS 'up_record UUID，最大长度为64个字符，不能为空且唯一';

COMMENT ON COLUMN upvote_record.user_uuid IS 'up_record uuid，点赞操作人uuid';
COMMENT ON COLUMN upvote_record.target_uuid IS 'up_record UUID，点赞对象uuid';
COMMENT ON COLUMN upvote_record.target_type IS 'up_record UUID，点赞类型可选值： discussion/prompt/discussion_replay';

CREATE INDEX idx_ur_target_type_target_uuid ON upvote_record (target_type,target_uuid);
CREATE INDEX idx_ur_user_uuid ON upvote_record (user_uuid);
CREATE INDEX idx_ur_user_uuid_target_type ON upvote_record (user_uuid, target_type);