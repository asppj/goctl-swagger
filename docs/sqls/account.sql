CREATE TABLE account(
    id          BIGSERIAL NOT NULL,
    uuid        CHARACTER VARYING(64) NOT NULL UNIQUE,
    user_uuid   CHARACTER VARYING(64),
    type        CHARACTER VARYING(32),
    account     VARCHAR(64) DEFAULT NULL UNIQUE,
    password    CHARACTER VARYING(64),
    sso_id      CHARACTER VARYING(128),
    sso_name    CHARACTER VARYING(1024),
    sso_info    TEXT,
    status      CHARACTER VARYING(32) DEFAULT 'active',
    create_at TIMESTAMP WITH TIME ZONE,
    update_at TIMESTAMP WITH TIME ZONE,
    CONSTRAINT "public.account_pkey" PRIMARY KEY (id)
);

COMMENT ON TABLE account IS '存储用户登录账号信息'; -- 表注释

COMMENT ON COLUMN account.id IS 'ID，自增长整数'; -- 列注释
COMMENT ON COLUMN account.uuid IS '账号表uuid，最大64位字符串，唯一不为空';
COMMENT ON COLUMN account.user_uuid IS 'user表uuid，最大64位字符串';
COMMENT ON COLUMN account.type IS '账号类型，可选值：email/google/discord/twitter/linkedin';
COMMENT ON COLUMN account.account IS '账号， type为email时，email填入该字段';
COMMENT ON COLUMN account.password IS '密码，非对称加密后字符，account字段不为空时，该字段不能为空';
COMMENT ON COLUMN account.sso_id IS 'sso_id，sso登录时第三方返回';
COMMENT ON COLUMN account.sso_name IS 'sso_name，sso登录时第三方返回';
COMMENT ON COLUMN account.sso_info IS 'sso_info，sso登录时第三方返回';
COMMENT ON COLUMN account.status IS '登录账号状态，active/banned';
COMMENT ON COLUMN account.create_at IS '创建时间戳，在插入数据时默认为当前时间';
COMMENT ON COLUMN account.update_at IS '更新时间戳，在插入或更新数据时默认为当前时间';

CREATE INDEX idx_account_sso_id ON account (sso_id);  -- sso_id 索引
CREATE INDEX idx_account_user_uuid ON account (user_uuid); -- 用户users 表uuid 索引
